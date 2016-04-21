class PushController < ApplicationController
	before_filter :admin_only
	def index
		
	end
	def send_go
		par = params[:message]
		userId = params[:userId]
		res = RestClient.post 'http://localhost:8080/push',{ 'message' => 1 }.to_json, :content_type => :json, :accept => :json
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
