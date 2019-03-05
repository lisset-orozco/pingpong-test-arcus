require 'rails_helper'

RSpec.describe Leaderboard, type: :model do
  ATTRIBUTES = %i[id rank first_name last_name email].freeze
  
  subject { FactoryBot.build(:leaderboard) }
  
  describe 'attr_accessor' do
    ATTRIBUTES.each { |attribute| it { should respond_to(attribute) } }

    # others matchers
    it (:first_name){ should be_present }
    it { should allow_value(1).for(:id) }
    it { should allow_value("wonder@woman.ww").for(:email) } 
  end

  describe 'validations' do
    ATTRIBUTES.each { |attribute| it { should validate_presence_of(attribute) } }
  end
end
