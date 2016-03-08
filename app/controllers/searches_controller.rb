class SearchesController < ApplicationController

  def show

  end

  def index
    best_buy = BestBuyService.new(params)
    products = best_buy.product_search
    binding.pry
  end
end
