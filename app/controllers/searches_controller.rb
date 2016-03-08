class SearchesController < ApplicationController

  def show
  end

  def search
    best_buy = BestBuyService.new(params)
    @products = best_buy.product_search["products"]
  end
end
