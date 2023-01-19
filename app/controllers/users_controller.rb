class UsersController < ApplicationController


  def index
   @book = Book.new
   @users =User.all
  end

  def create
   list = List.new(list_params)
   list.save
   flash[:notice] = "Welcome! You have signed up successfully"
   redirect_to user_path
  end

  def show
   @book = Book.new
   @user = User.find(params[:id])
   @books = @user.books
  end

  def edit
    user_id = params[:id].to_i
   unless user_id == current_user.id
    redirect_to user_path(current_user)
   end
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path
   else
    render :edit
   end
   user = User.new
   user.save
   flash[:notice] = "You have updated user successfully."
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:image)
  end



end
