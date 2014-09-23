class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception #预防CSRF（跨站请求伪造）。
  include SessionsHelper #sessions模块
end
