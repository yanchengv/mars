class SessionsController < ApplicationController
  def new
    render 'sessions/new', layout: 'login_layout'
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      log_in user
      remember user
      if user.is_admin
        redirect_to '/admin'
      else
        redirect_to '/'
      end
    else
      # 创建一个错误消息
      flash[:notice] = '用户名或密码错误'
      render 'sessions/new', layout: 'login_layout'
    end
  end


end
