class AuthorsController < ApplicationController
	def index
		@authors = Author.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @author }
		end
	end

	def show
    	@author = Author.find(params[:id])

    	respond_to do |format|
    		format.html # show.html.erb
    		format.json { render json: @piece }
   		end
	end

  # GET /authors/new
  # GET /authors/new.json
	def new
		@author = Author.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @author }
		end
	end

	def create
		@author = Author.new(params[:author])
    
		respond_to do |format|
			if @author.save
        		format.html { redirect_to @author, notice: 'Author was successfully created.' }
        		format.json { render json: @author, status: :created, location: @author }
    		else
    			format.html { render action: "new" }
    			format.json { render json: @author.errors, status: :unprocessable_entity }
      		end
    	end
  	end

end
