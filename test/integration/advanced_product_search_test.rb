require "test_helper"

class AdvancedProductSearchTest < ActionDispatch::IntegrationTest
  def test_basic_product_search
      VCR.use_cassette('advanced_product_search') do
      visit root_path

      fill_in('search-box', :with => 'sennheiser headphones white')
      click_button('Submit')

      assert_equal current_path, '/search'

      refute page.has_content?('Product 15')
    end
  end
end
