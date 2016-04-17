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

end
