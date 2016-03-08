require 'json'
require 'faraday'
require 'cgi'
require 'uri'



class BestBuyService

  def initialize(params)
    product = params["subject"]
    url = "https://api.bestbuy.com/v1/products(longDescription=#{product}*|sku=7619002)?show=sku,name&pageSize=15&page=5&apiKey=#{ENV["BEST_BUY_ID"]}&format=json"
    # @safeurl = URI.parse(CGI.escape(url).gsub("%3A", ":").gsub("%2F", "/"))
    @uri = URI.parse(URI.encode(url))
  end

  def product_search
    binding.pry
    response = Faraday.get(@uri)
    JSON.parse(response.body)
  end
end
  # https://api.bestbuy.com/v1/products(longDescription=iphone*|sku=7619002)?show=sku,name&pageSize=15&page=5&apiKey=pr68afecws2rqzs6nppydn5f&format=json
