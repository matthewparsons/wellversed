require 'spec_helper'

describe "Pieces pages" do

	subject { page }

	describe "index" do
    	let(:user) { FactoryGirl.create(:user) }
		before { visit pieces_path }

		it { should have_selector('h1', text: 'Sets') }

	end

end
