require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let(:player) { create(:user) }
  let(:opponent) { create(:user) }
  let(:valid_attributes) {
    attributes_for(:game).merge(player_id: player.id, opponent_id: opponent.id)
  }
  let(:invalid_attributes) {
    { player_id: nil, opponent_id: nil, player_score: nil, opponent_score: nil, played_at: nil }
  }

  describe "GET #index" do
    before { @games = create_list(:game, 3) }

    it "ok" do
      get :index
      
      expect(response).to have_http_status(:ok)
      expect(response.body.as_json).to match(@games.as_json.to_s)
      expect(JSON.parse(response.body).map { |game| game['id'] }).to \
        match_array(@games.map(&:id))
    end
  end

  describe 'GET #show' do
    subject { create(:game) }

    it 'returns a success response' do
      get :show, params: { id: subject.id }
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
      expect(assigns(:game)).to eq(subject)
      expect(response.content_type).to eq('application/json')
    end

    it 'when game doesn\'t exist' do
      get :show, params: { id: 612 }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new game' do
        expect { 
          post :create, params: { game: valid_attributes } 
        }.to change(Game, :count).by(1)
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new game' do
        post :create, params: {
          game: invalid_attributes
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')

        json_body = JSON.parse(response.body)
        %w[player opponent player_score opponent_score played_at].each do |attr|
          expect(json_body[attr]).to \
            all( include("can't be blank").or include("must exist"))
        end
      end
    end
  end

  describe 'GET #leaderboard' do
    it 'leaderboard' do
      p1 = create(:user)
      p2 = create(:user)
      
      g1 = create(:game, player: p1, opponent: p2)
      r1 = create(:record, user: p1, game: g1)
      r11 = create(:record, user: p2, game: g1)

      p3 = create(:user)
      g2 = create(:game, player: p1, opponent: p3)
      r2 = create(:record, user: p1, game: g2)
      r22 = create(:record, user: p3, game: g2)

      p4 = create(:user)
      g3 = create(:game, player: p4, opponent: p3)
      r3 = create(:record, user: p4, game: g3)
      r33 = create(:record, user: p3, game: g3)

      get :leaderboard
      puts JSON.parse(response.body)
      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')
      expect(JSON.parse(response.body)
              .map { |player| player['id'] }).to \
              match_array([p1.id, p2.id, p3.id, p4.id])
    end
  end
end
