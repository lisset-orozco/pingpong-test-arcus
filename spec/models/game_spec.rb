require 'rails_helper'

RSpec.describe Game, type: :model do
  ATTRIBUTES = %i[ player opponent player_score opponent_score played_at ]

  describe 'associations' do
    [:opponent, :player].each { |association| it { should belong_to(association) } }
  end
  
  describe 'validations' do
    ATTRIBUTES.each { |attribute| it { should validate_presence_of(attribute) } }
  end

  describe '.desc_order' do
   xit { expect(Game.desc_order.to_sql).to eq Game.all.order(played_at: :desc).to_sql }
  end
end
