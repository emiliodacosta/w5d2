class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if user
      login(user)
      redirect_to subs_url
    else
      flash[:errors] = ['Invalid login']
      render :new
    end
  end

  def destroy
    logout!
    redirect_to subs_urls
  end

end
