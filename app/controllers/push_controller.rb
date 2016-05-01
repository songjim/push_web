class PushController < ApplicationController
  before_filter :admin_only
  def index
    @users = User.all
  end
  def send_go
    userId = params[:user]
    par = params[:message]
    title = params[:title]
    begin
      res = RestClient.post 'http://139.129.49.111:81/push',{ 'message' => par,'userId' => userId,'title' => title }
      flash['notice'] = "success"
    rescue Exception => e
      ErrorMailer.error_maile(e,res).deliver
      flash['notice'] = JSON.parse(res)['type'] 
    end
    redirect_to push_path
  end
  def save_phone
    @avos = Avos.new
    @users = User.all
  end
  def phone_install
    phone_name = params[:phone_name]
    phone_install = params[:phone_install]
    @avos = Avos.new
    @avos.name = phone_name
    @avos.installation = phone_install
    @avos.user_id = params[:user]
    begin
      @avos.save
      flash[:notice] = "success"
    rescue Exception => e
      flash[:notice] = "error"
      ErrorMailer.error_maile(e,nil).deliver
    end
    redirect_to push_save_phone_path
  end

  def down_andorid_app
    send_file '/var/www/PushDemo-debug.apk'
  end
  def search
    @avos = Avos.all
  end


  def user_create
    
  end
end
