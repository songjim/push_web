class PushController < ApplicationController
  before_filter :admin_only
  def index

  end
  def send_go
    par = params[:message]
    p par
    userId = params[:userId].to_i
    p userId
    begin
      res = RestClient.post 'http://139.129.49.111:81/push',{ 'message' => par,'userId' => userId }
      flash['notice'] = "success"
    rescue Exception => e
      ErrorMailer.error_maile(e,res).deliver
      flash['notice'] = JSON.parse(res)['type'] 
    end
    render :action => "index"
  end
  def save_phone
  end
  def phone_install
    phone_name = params[:phone_name]
    phone_install = params[:phone_install]
    begin
      Avos.create(:name => phone_name,:installation => phone_install)
      flash[:notice] = "success"
    rescue Exception => e
      flash[:notice] = "error"
      ErrorMailer.error_maile(e,nil).deliver
    end
    
    render action: "save_phone"
  end

  def down_andorid_app
    # send_file '/Users/songjian/Downloads/PushDemo-debug.apk'
    send_file '/var/www/PushDemo-debug.apk'
  end
end
