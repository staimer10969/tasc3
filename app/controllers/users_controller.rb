class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @new_book = Book.new
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
    @books = Book.all
    @new_book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
       @user = current_user
       redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @books = @user.books
    if @user.update(user_params)
     redirect_to user_path(current_user.id), notice:'You have updated user successfully.'
    else
     render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image,)
  end

  #def is_matching_login_user
    #user = User.find(params[:id])
    #unless user.id == current_user.id
      #redirect_to new_user_session_path
    #end
  #end

end
