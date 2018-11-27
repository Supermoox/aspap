require 'test_helper'

class PeerRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peer_request = peer_requests(:one)
  end

  test "should get index" do
    get peer_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_peer_request_url
    assert_response :success
  end

  test "should create peer_request" do
    assert_difference('PeerRequest.count') do
      post peer_requests_url, params: { peer_request: {  } }
    end

    assert_redirected_to peer_request_url(PeerRequest.last)
  end

  test "should show peer_request" do
    get peer_request_url(@peer_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_peer_request_url(@peer_request)
    assert_response :success
  end

  test "should update peer_request" do
    patch peer_request_url(@peer_request), params: { peer_request: {  } }
    assert_redirected_to peer_request_url(@peer_request)
  end

  test "should destroy peer_request" do
    assert_difference('PeerRequest.count', -1) do
      delete peer_request_url(@peer_request)
    end

    assert_redirected_to peer_requests_url
  end
end
