class PushController < ApplicationController
	before_filter :admin_only
	def index
		
	end
	def send_go
		par = params[:message]
		p par
		userId = params[:userId]
		res = RestClient.post 'http://139.129.49.111:81/push',{ 'message' => par,'userId' => userId }
		render :text => res
	end
	def save_phone
		
	end
	def phone_install
		phone_name = params[:phone_name]
		phone_install = params[:phone_install]
		Avos.create(:name => phone_name,:installation => phone_install)
	end
end
