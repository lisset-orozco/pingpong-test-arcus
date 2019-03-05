require 'rails_helper'

RSpec.describe Record, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:game) }
  end

  describe '.ranking_list' do
    it { expect(Record.ranking_list.to_sql).to eq ().to_sql }
  end
end
