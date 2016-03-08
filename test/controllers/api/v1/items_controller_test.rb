require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json

    items = JSON.parse(response.body)

    assert_response :success

    assert_equal 2, items.count
    assert_equal items.first["name"], "Heavy Cotton Pants"
    assert_equal items.first["description"], "heavy when wet"
    assert items.first["image_url"]
    refute items.first["created_at"]
    refute items.first["updated_at"]
  end

  # test "#show" do
  #   id = Item.first.id
  #
  #   get :index, id: id, format: :json
  #
  #   items = JSON.parse(response.body)
  #
  #   assert_response :success
  #   assert_equal 2, items.count
  # end

end
