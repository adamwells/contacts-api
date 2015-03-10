class FavoriteContactsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @favorites = @user.favorite_contacts
    render json: @favorites
  end

  def create
    @favorite = FavoriteContact.new(favorite_params)
    if @favorite.save
      render json: @favorite
    else
      render json: @favorite.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite = FavoriteContact.find(params[:id]).destroy
    render json: @favorite
  end

  private

  def favorite_params
    params.require(:favorite_contact).permit(:user_id, :contact_id)
  end
end
