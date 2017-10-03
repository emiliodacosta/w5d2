class SubsController < ApplicationController

  before_action :redirect_unless_moderator, only: [:edit, :update, :destroy]

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
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

  def update
    @sub = Sub.find(params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  def redirect_unless_moderator
    moderator = Sub.find(params[:id]).moderator
    if moderator != current_user
      redirect_to subs_url
      flash[:errors] = ["Hey you can't do that, man."]
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
