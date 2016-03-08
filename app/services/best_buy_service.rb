require 'json'
require 'faraday'

class BestBuyService

  def initialize(params)
    @product = params["subject"]
  end

  def get_data
    response = Faraday.get("https://api.bestbuy.com/v1/products(longDescription=#{@product}*|sku=7619002)?show=sku,name&pageSize=15&page=5&apiKey=#{ENV["BEST_BUY_ID"]}&format=json")
    JSON.parse(response.body)
  end

  # https://api.bestbuy.com/v1/products(longDescription=iphone*|sku=7619002)?show=sku,name&pageSize=15&page=5&apiKey=pr68afecws2rqzs6nppydn5f&format=json
