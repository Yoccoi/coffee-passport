class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def mypage
    redirect_to user_path(current_user)
  end

  def show
    @notes = Note.where(user_id: params[:id])
  end

  def edit
    # 直リンク編集を避けるための条件分岐
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  # def destroy
  #   if @user == current_user
  #     @user.destroy
  #   else
  #     redirect_to edit_user_path(current_user)
  #   end
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {}).permit(:nickname)
  end
end
