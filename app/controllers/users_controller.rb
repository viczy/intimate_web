class UsersController < ApplicationController
  def new 
  	@user = User.new
  end

  def index
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

end





=begin

HTTP请求	         URL	        动作	           具名路由	                     作用
GET	            /users	       index	      users_path	           显示所有用户的页面
GET	           /users/1	        show	     user_path(user)	       显示某个用户的页面
GET	          /users/new	    new	         new_user_path	         创建（注册）新用户的页面
POST	        /users	       create	      users_path	              创建新用户
GET	         /users/1/edit	    edit	  edit_user_path(user)	     编辑 id 为 1 的用户页面
PATCH	       /users/1	       update	     user_path(user)	          更新用户信息
DELETE	       /users/1	       destroy	     user_path(user)	            删除用户

=end