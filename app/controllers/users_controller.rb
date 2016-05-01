class UsersController < ApplicationController
  before_filter :admin_only
  def new
    @user = User.new
  end
  def create_user
    @user = User.create(user_par)
    if @user
      flash['notice'] = 'success'
    else
      flash['notice'] = 'error'
    end
    redirect_to users_show_path
  end
  def show
    page = params[:page].present? ? params[:page] : 1 
    @users = User.all.order("id asc").paginate(page: page,per_page: 1)
  end
  def destroy
    p params[:id]
    user = User.find params[:id]
    user.destroy
    redirect_to users_show_path
  end

  def update
    @user = User.find params[:id]
  end

  def update_save
    new_user = Hash.new
    new_user['name'] = params[:user][:name] if params[:user][:name].present?
    new_user['email'] = params[:user][:email] if params[:user][:email].present?
    new_user['password'] = params[:user][:password] if params[:user][:password].present?
    begin
      @user = User.update_all(new_user)
      flash['notice'] = 'success'
    rescue Exception => e
      flash['notice'] = e.inspect
    end
    redirect_to users_show_path
  end

  private
  def user_par
    params.require(:user).permit(:email, :password, :name)
  end
end
