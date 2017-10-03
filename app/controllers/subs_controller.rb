class SubsController < ApplicationController

  before_action :redirect_unless_moderator, only: [:edit, :update]

  def new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def delete
  end

  def redirect_unless_moderator
    moderator = Sub.find(params[:id]).moderator
    redirect_to subs_url unless moderator == current_user
  end
end
