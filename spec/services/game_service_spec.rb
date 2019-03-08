require 'rails_helper'

describe GameService do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  
  let(:valid_attributes) {
    attributes_for(:game).merge(player_id: user1.id, opponent_id: user2.id)
  }

  subject(:game) do
    GameService.new(valid_attributes)
  end

  describe "#create_object" do
    it 'create game' do
      expect(Game.count).to eq(0)
      expect{ game.create_object }.to change(Game, :count).by(1)
      expect(game.create_object).to be(true)
      expect(Game.count).to eq(1)
    end
  end

  describe "#object" do
    it "object" do
      expect(game.object).to be_instance_of(Game) 
      expect(game.object).to be_valid
    end
  end

  describe "#errors" do
    it { expect(game.errors).to be_instance_of(ActiveModel::Errors) }
  end

  describe ".ranking_list" do
    it "list" do
      binding.pry
    end
  end

  describe ".send_ranking_list" do

  end

  describe ".validate_rank", :private do

  end

  describe ".build_object", :private do

  end
end
