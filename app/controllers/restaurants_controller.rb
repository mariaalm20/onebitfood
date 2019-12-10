class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: :show
  def index
    @restaurants = Restaurant.near(params[:city] || 'Maringá')
    filter_by_category id params[:category]
    render json: @restaurants
  end

  def show
    render json: @restaurants, product_categories: true

  end

  def search
    @restaurants = Restaurant.search(
       name_or_description_cont: params[:q]
       ).result
   @restaurants = @restaurants.near(params[:city]) if params[:city]
   render json: @restaurants
  end

  private
  def set_restaurant
    @restaurants = Restaurant.find_by(id: params[:id])
  end
  def filter_by_categories
    @restaurants = @restaurants.select do |r|
      r.categories.title == params[:category]
end
end
