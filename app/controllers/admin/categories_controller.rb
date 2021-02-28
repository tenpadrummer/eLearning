# frozen_string_literal: true

module Admin
  class CategoriesController < AdminController
    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path
      else
        render 'new'
      end
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])
      if @category.update_attributes(category_params)
        redirect_to admin_categories_path
      else
        render 'edit'
      end
    end

    def destroy
      @category = Category.find(params[:id]).destroy
      redirect_to admin_categories_url
    end

    private

    def category_params
      params.require(:category).permit(:title, :description)
    end
  end
end
