class ItemsController < ApplicationController


  def index
    @user = User.all
  end

  #def new
  #  @user = User.new
  #end

  #def create
  #  @User = User.new
  #  if @prototype.save
  #    redirect_to root_path
  #  else
  #    render :new
  #  end
  #end

end
