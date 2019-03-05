require 'rails_helper'

RSpec.describe Record, type: :model do

  describe 'associations' do
    %i[user game].each { |association| it { should belong_to(association) } }
  end

  describe '.ranking_list' do
    xit { expect(Record.ranking_list.to_sql).to eq ().to_sql }
  end
end
