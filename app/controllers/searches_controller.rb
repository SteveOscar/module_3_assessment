class SearchesController < ApplicationController

  def show

  end

  def index
    binding.pry
    best_buy = BestBuyService.new(params)
    products = best_buy.product_search
  end
end
