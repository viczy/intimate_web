class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
        	sign_in user
        	redirect_back_or user
        else
        	flash.now[:error] = 'Invalid email/password combination'
         	render 'new'
        end
	end

	def destroy
		sign_out
    	redirect_to root_path
	end

end






=begin


HTTP请求          	URL地址	              具名路由	            动作	                   目的
GET	                /signin	            signin_path          	new	          创建新 session 的页面（登录）
POST	            /sessions	       sessions_path	       create	           创建 session
DELETE	            /signout	        signout_path	       destroy	        删除 session（退出）
	
=end