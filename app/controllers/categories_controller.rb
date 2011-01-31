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

    flash[:notice] = "Category created" unless @category.invalid?
    respond_with @category, :location => categories_path
  end

  def edit
    respond_with @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find params[:id]
    @category.update_attributes params[:category]
    
    flash[:notice] = "Category updated" unless @category.invalid?
    respond_with @category, :location => categories_path
  end

  def destroy
    @category = current_user.categories.find params[:id]
    @category.destroy

    respond_with @category
  end
end
