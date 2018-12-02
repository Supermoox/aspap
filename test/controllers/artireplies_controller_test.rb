require 'test_helper'

class ArtirepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artireply = artireplies(:one)
  end

  test "should get index" do
    get artireplies_url
    assert_response :success
  end

  test "should get new" do
    get new_artireply_url
    assert_response :success
  end

  test "should create artireply" do
    assert_difference('Artireply.count') do
      post artireplies_url, params: { artireply: { articomment_id: @artireply.articomment_id, body: @artireply.body } }
    end

    assert_redirected_to artireply_url(Artireply.last)
  end

  test "should show artireply" do
    get artireply_url(@artireply)
    assert_response :success
  end

  test "should get edit" do
    get edit_artireply_url(@artireply)
    assert_response :success
  end

  test "should update artireply" do
    patch artireply_url(@artireply), params: { artireply: { articomment_id: @artireply.articomment_id, body: @artireply.body } }
    assert_redirected_to artireply_url(@artireply)
  end

  test "should destroy artireply" do
    assert_difference('Artireply.count', -1) do
      delete artireply_url(@artireply)
    end

    assert_redirected_to artireplies_url
  end
end
