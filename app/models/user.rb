class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token #方法引用，创建记忆权标
	validates :name, presence: true, #验证存在性
					   length: { maximum: 50 } #验证长度不超过50
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #邮箱的正则表达式
	validates :email, presence: true,
						format: { with: VALID_EMAIL_REGEX }, #邮箱格式验证
                    uniqueness: { case_sensitive: false } #验证邮箱唯一性，不区分大小写（弱敏感）
    has_secure_password #rails集成函数，用来添加password和password_confirmation 属性，二者都要填写一些内容（非空格），而且要相等；还要定义 authenticate 方法，对比加密后的密码和 password_digest 是否一致，验证用户的身份。以上操作在数据库有 password_digest列后该函数已做到。
  	validates :password, length: { minimum: 6 } #验证密码长度不低于6


#创建记忆权标方法的实现-----------------------------------------------
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
  end

 #-----------------------------------------------------------------
end
