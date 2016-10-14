class SessionsController < ApplicationController
  def new
    render 'sessions/new', layout: 'login_layout'
  end

  # 登陆
  def login
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


  # 注册页面
  def sign_up
    render 'sessions/sign_up', layout: 'login_layout'
  end

  # 注册
  def create
    user = User.create(user_params)
    log_in user
    remember user
    redirect_to '/'
  end

  # 退出
  def destroy
    log_out if log_in?
    redirect_to root_url
  end



  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
