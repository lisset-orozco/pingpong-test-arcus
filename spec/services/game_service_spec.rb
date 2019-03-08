# frozen_string_literal: true

require 'rails_helper'

describe GameService do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  let(:game1) { FactoryBot.create(:game, player: user1, opponent: user2) }
  let(:game2) { FactoryBot.create(:game, player: user2, opponent: user1) }

  let(:record_1) { create(:record, user: user1, game: game1) }
  let(:record_1_1) { create(:record, user: user2, game: game1) }

  let(:valid_attributes) {
    attributes_for(:game).merge(player_id: user1.id, opponent_id: user2.id)
  }

  subject(:game) do
    GameService.new(valid_attributes)
  end

  describe '#create_object' do
    it 'create game' do
      expect(Game.count).to eq(0)
      expect { game.create_object }.to change(Game, :count).by(1)
      expect(game.create_object).to be(true)
      expect(Game.count).to eq(1)
    end
  end

  describe '#object' do
    it 'object' do
      expect(game.object).to be_instance_of(Game)
      expect(game.object).to be_valid
    end
  end

  describe '#errors' do
    it { expect(game.errors).to be_instance_of(ActiveModel::Errors) }
  end

  describe '.ranking_list' do
    it 'list' do
      game.create_object
      ranking = GameService.ranking_list

      expect(ranking).not_to be_empty
      expect(ranking.first).to be_instance_of(Leaderboard)
      expect(ranking.size).to be > 1
    end
  end

  describe '.send_ranking_list_to_users' do
    it 'ranking' do
      game.create_object
      user_ids = GameService.send_ranking_list_to_users

      expect(user_ids).not_to be_empty
      expect(User.all.ids).to match_array(user_ids)
    end
  end

  describe '.build_object', :private do
    it 'rank' do
      v = GameService.new(valid_attributes)
      v.create_object
      list = Record.ranking_list

      list.map do |rank|
        obj = GameService.send(:build_object, rank)
        expect(obj).to be_instance_of(Leaderboard)
        expect(obj).to be_valid
      end
    end
  end
end
