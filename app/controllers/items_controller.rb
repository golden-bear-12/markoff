class ItemsController < ApplicationController
  def new
    @user = current_user
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @user = current_user

    @item.user = @user

    if @item.save
      flash.now[:notice] = "Item was saved successfully."
      redirect_to current_user
    else
      flash.now[:alert] = "Error creating item. Please try again."
      render :new
    end
  end
end
