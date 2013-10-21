require 'spec_helper'

describe Study do

  let(:user) { FactoryGirl.create(:user) }
  let(:piece) { FactoryGirl.create(:piece) }
  let(:study) { user.studies.build(piece_id: piece.id) }

  subject { study }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to score" do
      expect do
        Study.new(score: 10)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "study methods" do
    it { should respond_to(:user)}
    it { should respond_to(:piece)}
    its(:user) { should == user }
    its(:piece) { should == piece }
  end

  describe "when user id is not present" do
    before {study.user_id = nil }
    it { should_not be_valid }
  end

  describe "when piece id is not present" do
    before {study.piece_id = nil }
    it { should_not be_valid }
  end

end