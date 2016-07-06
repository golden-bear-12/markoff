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

  def destroy
    @user = current_user
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was deleted successfully."
    else
      flash[:alert] = "Item couldn't be deleted. Try again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
