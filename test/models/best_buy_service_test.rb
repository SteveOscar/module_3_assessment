class BestBuyServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    params = { "utf8"=>"✓",
               "authenticity_token"=>"USzq2PHYU8wHiS7q+I2n0GjgzYL/gW0xFjuCiGjDhMk=",
               "subject"=>"sennheiser headphones",
               "commit"=>"Submit",
               "controller"=>"searches",
               "action"=>"search"}

    @service = BestBuyService.new(params)
  end

  test '#product_search' do
    VCR.use_cassette('best_buy_service_get_data') do
      data = @service.product_search

      assert_equal 15, data["products"].count
    end
  end

end
