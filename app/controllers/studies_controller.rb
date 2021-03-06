class StudiesController < ApplicationController
  before_filter :signed_in_user

  def create
    @piece = Piece.find(params[:study][:piece_id])
    current_user.study!(@piece)
    respond_to do |format|
      format.html { redirect_to @piece }
      format.js
    end
  end

  def destroy
    @study = Study.find(params[:id])
    current_user.abandon!(@study)
    respond_to do |format|
      format.html { redirect_to @piece }
      format.js
    end
  end

  def show
    @study = Study.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @study }
    end
  end

  def practise
    @study = Study.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end    
  end

end