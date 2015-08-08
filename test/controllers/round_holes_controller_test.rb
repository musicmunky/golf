require 'test_helper'

class RoundHolesControllerTest < ActionController::TestCase
  setup do
    @round_hole = round_holes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:round_holes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create round_hole" do
    assert_difference('RoundHole.count') do
      post :create, round_hole: { course_hole_id: @round_hole.course_hole_id, putts: @round_hole.putts, round_id: @round_hole.round_id, score: @round_hole.score }
    end

    assert_redirected_to round_hole_path(assigns(:round_hole))
  end

  test "should show round_hole" do
    get :show, id: @round_hole
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @round_hole
    assert_response :success
  end

  test "should update round_hole" do
    patch :update, id: @round_hole, round_hole: { course_hole_id: @round_hole.course_hole_id, putts: @round_hole.putts, round_id: @round_hole.round_id, score: @round_hole.score }
    assert_redirected_to round_hole_path(assigns(:round_hole))
  end

  test "should destroy round_hole" do
    assert_difference('RoundHole.count', -1) do
      delete :destroy, id: @round_hole
    end

    assert_redirected_to round_holes_path
  end
end
