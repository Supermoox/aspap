require 'test_helper'

class ManuscriptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manuscript = manuscripts(:one)
  end

  test "should get index" do
    get manuscripts_url
    assert_response :success
  end

  test "should get new" do
    get new_manuscript_url
    assert_response :success
  end

  test "should create manuscript" do
    assert_difference('Manuscript.count') do
      post manuscripts_url, params: { manuscript: { abstract: @manuscript.abstract, approval: @manuscript.approval, journal_id: @manuscript.journal_id, title: @manuscript.title } }
    end

    assert_redirected_to manuscript_url(Manuscript.last)
  end

  test "should show manuscript" do
    get manuscript_url(@manuscript)
    assert_response :success
  end

  test "should get edit" do
    get edit_manuscript_url(@manuscript)
    assert_response :success
  end

  test "should update manuscript" do
    patch manuscript_url(@manuscript), params: { manuscript: { abstract: @manuscript.abstract, approval: @manuscript.approval, journal_id: @manuscript.journal_id, title: @manuscript.title } }
    assert_redirected_to manuscript_url(@manuscript)
  end

  test "should destroy manuscript" do
    assert_difference('Manuscript.count', -1) do
      delete manuscript_url(@manuscript)
    end

    assert_redirected_to manuscripts_url
  end
end
