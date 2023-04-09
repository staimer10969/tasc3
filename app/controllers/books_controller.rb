class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def new

  end

  def index
    @user = current_user
    @books = Book.all
    @new_book = Book.new
    @new_book.user_id = current_user.id
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @user = @book.user
    if @book.update(book_params)
      redirect_to book_path(@book),notice:'You have updated book successfully.'
    else
      render "edit"
    end
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
     if @new_book.save
       redirect_to book_path(@new_book.id), notice:'You have created book successfully.'
     else
       @books = Book.all
       @user = current_user
       render "index"
     end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def correct_user
    @book = Book.find(params[:id])
    if current_user != @book.user
       redirect_to books_path
    end
  end

  #def is_matching_login_user
    #user = User.find(params[:id])
    #unless user.id == current_user.id
      #redirect_to new_user_session_path
    #end
  #end

end
