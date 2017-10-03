class SubsController < ApplicationController

  before_action :redirect_unless_moderator, only: [:edit, :update]

  def new
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

  def redirect_unless_moderator
    moderator = Sub.find(params[:id]).moderator
    redirect_to subs_url unless moderator == current_user
  end
end
