class StudiesController < ApplicationController
  before_filter :signed_in_user

  def create
    @piece = Piece.find(params[:study][:piece_id])
    current_user.study!(@piece)
    redirect_to current_user
  end

  def destroy
    @study = Study.find(params[:id])
    current_user.abandon!(@study)
    redirect_to current_user
  end
end