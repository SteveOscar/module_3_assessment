require 'json'
require 'faraday'
require 'uri'



class BestBuyService

  def initialize(params)
    product = params["subject"]
    url = "https://api.bestbuy.com/v1/products(longDescription=#{product}*|sku=7619002)?show=customerReviewAverage.asc&show=customerReviewAverage,shortDescription,image,name,sku,salePrice&facet=salePrice&pageSize=15&page=5&apiKey=#{ENV["BEST_BUY_ID"]}&format=json"
    @uri = URI.parse(URI.encode(url))
  end

  def product_search
    response = Faraday.get(@uri)
    JSON.parse(response.body)
  end
end
  # https://api.bestbuy.com/v1/products(longDescription=iphone*|sku=7619002)?show=sku,name&pageSize=15&page=5&apiKey=pr68afecws2rqzs6nppydn5f&format=json
