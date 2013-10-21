require 'spec_helper'

describe "Pieces pages" do

	subject { page }

	describe "index" do
    let(:user) { FactoryGirl.create(:user) }
   	let(:author) { FactoryGirl.create(:author) }
    let(:piece) { FactoryGirl.create(:piece) }

		before(:each) do
      @piece = FactoryGirl.create(:piece)
      visit pieces_path
    end

		it { should have_selector('h1', text: 'Sets') }
    it { should have_selector('td', text: @piece.title) }    
    it { should have_link(@piece.title) }

    describe "pagination" do

        before(:all) { 50.times { FactoryGirl.create(:piece) } }
        after(:all)  { Piece.delete_all }

        it { should have_selector('div.pagination') }

#        it "should list each piece" do
#          Piece.paginate(page: 1).each do |piece|
#            page.should have_selector('td', text: piece.title)
#          end
#        end
    end

		describe "delete links" do
			it { should_not have_link('Delete') }

      		describe "as an admin user" do
        		let(:admin) { FactoryGirl.create(:admin) }

        		before do
          			sign_in admin
          			visit pieces_path
        		end

        		it { should have_link('Delete'), href: pieces_path(Piece.first) }
        		it "should be able to delete a piece" do
          			expect { click_link('Delete') }.to change(Piece, :count).by(-1)
        		end
      		end
    	end

	end

end
