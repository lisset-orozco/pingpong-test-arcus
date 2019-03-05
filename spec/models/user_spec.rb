# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string           not null
#  last_name       :string           not null
#  email           :string(320)      not null
#  password_digest :string(60)       not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'extensions' do
    it { should have_secure_password }
  end

  context 'validations' do
    describe 'first_name' do
      it { should validate_presence_of(:first_name) }
    end

    describe 'last_name' do
      it { should validate_presence_of(:last_name) }
    end

    describe 'email' do
      subject { build(:user) }

      it { should validate_presence_of(:email) }
      it { should validate_uniqueness_of(:email) }
    end
  end

  context 'instance methods' do
    describe 'full_name' do
      subject { create(:user) }

      it 'should contain first_name' do
        expect(subject.full_name).to include(subject.first_name)
      end

      it 'should contain last_name' do
        expect(subject.full_name).to include(subject.last_name)
      end
    end
  end
end
