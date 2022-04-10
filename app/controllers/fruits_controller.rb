class FruitsController < ApplicationController
  def index
    fruit = Fruit.all
    render json: fruit
  end

end
