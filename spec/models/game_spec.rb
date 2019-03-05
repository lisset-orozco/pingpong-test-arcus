require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:user){ FactoryBot.build(:user) }
  let!(:attributes) { %i[ player opponent player_score opponent_score played_at ] }

  describe 'associations' do
    [:opponent, :player].each { |association| it { should belong_to(association) } }
  end

  describe 'validations' do
    it 'check presence of each attribute' do
      attributes.each { |attribute| should validate_presence_of(attribute) }
    end
  end

  describe '.desc_order' do
    it { expect(Game.desc_order.to_sql).to eq Game.all.order(played_at: :desc).to_sql }
  end
end
