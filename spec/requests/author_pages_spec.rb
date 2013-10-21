require 'spec_helper'

describe "Author pages" do

	subject { page }

	describe "index" do
    	let(:user) { FactoryGirl.create(:user) }
		before do
#      		sign_in user
      		visit authors_path
    	end

		it { should have_selector('h1', text: 'Backups') }

	end

end