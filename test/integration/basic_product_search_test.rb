require "test_helper"

class BasicProductSearchTest < ActionDispatch::IntegrationTest
  def test_basic_product_search
      VCR.use_cassette('basic_product_search') do
      visit root_path

      fill_in('search-box', :with => 'sennheiser')
      click_button('Submit')

      assert_equal current_path, '/search'

      assert page.has_content?('Product 15')
      refute page.has_content?('Product 16')
    end
  end
end
