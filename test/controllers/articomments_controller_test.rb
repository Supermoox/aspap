require 'test_helper'

class ArticommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @articomment = articomments(:one)
  end

  test "should get index" do
    get articomments_url
    assert_response :success
  end

  test "should get new" do
    get new_articomment_url
    assert_response :success
  end

  test "should create articomment" do
    assert_difference('Articomment.count') do
      post articomments_url, params: { articomment: { article_id: @articomment.article_id, body: @articomment.body } }
    end

    assert_redirected_to articomment_url(Articomment.last)
  end

  test "should show articomment" do
    get articomment_url(@articomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_articomment_url(@articomment)
    assert_response :success
  end

  test "should update articomment" do
    patch articomment_url(@articomment), params: { articomment: { article_id: @articomment.article_id, body: @articomment.body } }
    assert_redirected_to articomment_url(@articomment)
  end

  test "should destroy articomment" do
    assert_difference('Articomment.count', -1) do
      delete articomment_url(@articomment)
    end

    assert_redirected_to articomments_url
  end
end
