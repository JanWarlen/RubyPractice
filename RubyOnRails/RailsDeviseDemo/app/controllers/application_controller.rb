class ApplicationController < ActionController::Base

  prepend_before_action :devise_action
  before_action :authenticate_user!

  def devise_action
    # 调整顺序，可以先进行自定义的登录拦截
    puts request.headers
    # redirect_to "/login"
  end

end
