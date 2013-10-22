class StudiesController < ApplicationController
  before_filter :signed_in_user

  def create
    @piece = Piece.find(params[:study][:piece_id])
    current_user.study!(@piece)
    redirect_to @piece
  end

  def destroy
    @piece = Study.find(params[:id]).studied
    current_user.unfollow!(@piece)
    redirect_to @piece
  end
end