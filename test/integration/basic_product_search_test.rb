require "test_helper"

class BasicProductSearchTest < ActionDispatch::IntegrationTest
  def test_sanity
    visit root_path
    fill_in('search-box', :with => 'sennheiser')
    click_link('search')

    assert_equal current_path, '/search'

    assert page.has_content('result15')
  end
end
