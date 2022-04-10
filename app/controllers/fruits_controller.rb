class FruitsController < ApplicationController
  def index
    fruit = Fruit.all
    render json: fruit
  end

  def create
    fruit = Fruit.new(
      name: params[:name],
      color: params[:color],
      price: params[:price]
    )
    fruit.save
    render json: fruit
  end

  def show
    fruit = Fruit.find(params[:id])
    render json: fruit
  end

  def update
    fruit = Fruit.find(params[:id])
    fruit.name = params[:name]
    fruit.color = params[:color]
    fruit.price = params[:price]
    fruit.save
    render json: fruit
  end

end
