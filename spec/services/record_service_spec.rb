# frozen_string_literal: true

require 'rails_helper'

describe RecordService do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  let(:game1) { FactoryBot.create(:game, player: user1, opponent: user2) }
  let(:game2) { FactoryBot.create(:game, player: user2, opponent: user1) }

  let(:record_1) { create(:record, user: user1, game: game1) }
  let(:record_1_1) { create(:record, user: user2, game: game1) }

  subject(:record) do
    RecordService.new(game1)
  end

  describe '.create_object' do
    it 'create two records' do
      expect(Record.count).to eq(0)
      expect(record.create_object).to be(true)
      expect(Record.count).to eq(2)

      record2 = RecordService.new(game2)
      expect { record2.create_object }.to change(Record, :count).by(2)
      expect(Record.count).to eq(4)
    end
  end

  describe '.player_won, .player_loser', :private do
    it 'won & loser' do
      user_1 = subject.send(:player_won)
      user_2 = subject.send(:player_loser)

      expect(user_1).to be_instance_of(User)
      expect(user_2).to be_instance_of(User)

      records = subject.as_json.values.first # hash

      expect(records).to include('opponent_id')
      expect(records).to include('player_id')
      expect([user_1.id, user_2.id]).to \
        match_array(records.values_at('player_id', 'opponent_id'))
    end
  end

  describe '.valid?', :private do
    it 'valid record' do
      expect(record_1).to be_valid
      expect(record_1_1).to be_valid

      expect(subject.send(:valid?, record_1)).to be(true)
      expect(subject.send(:valid?, record_1_1)).to be(true)
    end
  end
end
