require 'spec_helper'

describe StudiesController do

  let(:user) { FactoryGirl.create(:user) }
  let(:piece) { FactoryGirl.create(:piece) }

  before { sign_in user }

  describe "studying a piece with button using Ajax" do

    it "should increment the Study count" do
      expect do
        xhr :post, :create, study: { studied_id: piece.id }
      end.to change(Study, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, study: { studied_id: piece.id }
      response.should be_success
    end
  end

  describe "abandoning a study with Ajax" do

    before { user.study!(piece) }
    let(:study) { user.studies.find_by_piece_id(piece) }

    it "should decrement the Study count" do
      expect do
        xhr :delete, :destroy, id: study.id
      end.to change(Study, :count).by(-1)
    end

    it "should respond with success" do
      xhr :delete, :destroy, id: study.id
      response.should be_success
    end
  end
end