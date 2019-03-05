require 'rails_helper'

RSpec.describe Leaderboard, type: :model do
  subject { FactoryBot.build(:leaderboard) }
  let!(:attributes) { %i[ id rank first_name last_name email ] }

  describe 'attr_accessor' do
    it 'check each attribute' do
      attributes.each { |attribute| should respond_to(attribute) }
    end

    # others matchers
    it (:first_name){ should be_present }
    it { should allow_value(1).for(:id) }
    it { should allow_value("wonder@woman.ww").for(:email) } 
  end

  describe 'validations' do
    it 'check presence of each attribute' do
      attributes.each { |attribute| should validate_presence_of(attribute) }
    end
  end
end
