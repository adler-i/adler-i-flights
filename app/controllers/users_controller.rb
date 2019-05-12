class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account Created!"
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def past_bookings
    @bookings = current_user.bookings
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation)
  end
end
