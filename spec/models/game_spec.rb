require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:attributes) { attributes_for(:game) }

  describe 'associations' do
    %i[opponent player].each { |association| it { should belong_to(association) } }
  end
  
  describe 'validations' do
    it { attributes.each { |attribute| should validate_presence_of(attribute.first) } }
  end

  describe '.desc_order' do
   xit { expect(Game.desc_order.to_sql).to eq Game.all.order(played_at: :desc).to_sql }
  end
end
