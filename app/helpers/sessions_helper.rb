module SessionsHelper
	def sign_in(user)
    	remember_token = User.new_remember_token #生成token
    	cookies.permanent[:remember_token] = remember_token #保存token到cookies（cookies[:remember_token] = { value:   remember_token, expires: 20.years.from_now.utc }）；取token：User.find_by(remember_token: remember_token)
    	user.update_attribute(:remember_token, User.hash(remember_token)) #更新user的token，保存记忆权标使用的是 update_attribute 方法，这样可以跳过数据验证更新单个属性。
    	self.current_user = user
 	 end

 	def current_user=(user)
    	@current_user = user
    end

    def current_user?(user)
    	user == current_user
  	end

  	def signed_in?
    	!current_user.nil?
  	end

  	def sign_out
    	current_user.update_attribute(:remember_token,
                                  User.hash(User.new_remember_token))
    	self.current_user = nil
  	 	cookies.delete(:remember_token)
  	end

    def current_user
    	remember_token = User.hash(cookies[:remember_token])
    	@current_user ||= User.find_by(remember_token: remember_token) #即使页面跳转了，session失效了依然可以获取当前user
  	end
end
