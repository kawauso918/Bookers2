class UsersController < ApplicationController
  def index
    @user =current_user
    @book =Book.new
    @users=User.all
  end

  def create
  @book = Book.new(book_params)
  @books= Book.all
    if @book.save
    redirect_to book_path(@book.id), notice: 'Book was successfully created'
    else
    @user =current_user
    render :index
    end
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book =Book.new
  end



  def edit
    @user =User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
     render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
