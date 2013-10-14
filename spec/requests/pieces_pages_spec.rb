require 'spec_helper'

describe "Pieces pages" do

	subject { page }

	describe "index" do
    	let(:user) { FactoryGirl.create(:user) }
		before do
#      		sign_in user
      		visit pieces_path
    	end

		it { should have_selector('h1', text: 'Pieces') }

	end

end
