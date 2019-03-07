require 'rails_helper'

RSpec.describe Record, type: :model do
  subject { FactoryBot.create(:record) }
  let(:attributes) { attributes_for(:record) }

  describe 'associations' do
    %i[user game].each { |association| it { should belong_to(association) } }
  end

  describe 'validations' do
    it { attributes.each { |attribute| should validate_presence_of(attribute.first) } }
  end

  describe '.ranking_list' do
    xit { expect(Record.ranking_list.to_sql).to eq ().to_sql }
  end
end
