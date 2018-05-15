class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    binding.pry
  end

  def new
    @category = Category.new
  end
end
