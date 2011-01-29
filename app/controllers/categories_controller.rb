class CategoriesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    respond_with @categories = current_user.categories
  end

  def new
    respond_with @category = Category.new
  end

  def create
    @category = current_user.categories.build params[:category]
    @category.save

    respond_with @category
  end

  def edit
    respond_with @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find params[:id]
    @category.update_attributes params[:category]

    respond_with @category
  end

  def destroy
    @category = current_user.categories.find params[:id]
    @category.destroy

    respond_with @category
  end
end
