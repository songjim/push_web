class AppDownController < ApplicationController
	def down_andorid_app
		send_file '/var/www/PushDemo-debug.apk'
	end
end
