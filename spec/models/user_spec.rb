# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validate the user is valid" do
    subject { build(:user) }

    it "should be a valid user" do
      expect(subject).to be_valid
    end
  end

  describe "associations" do
    it { should have_many(:joins).dependent(:destroy) }
    it { should have_many(:projects).through(:joins) }
    it { should have_many(:bugs) }
  end

  describe "enums" do
    it { should define_enum_for(:role).with_values(%i[developer QA manager]) }
  end
end
