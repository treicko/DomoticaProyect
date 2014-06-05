require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  setup do
    @issue = issues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue" do
    assert_difference('Issue.count') do
<<<<<<< HEAD
      post :create, issue: { description: @issue.description, resolution: @issue.resolution, state: @issue.state, thermostat_id: @issue.thermostat_id }
=======
      post :create, issue: { description: @issue.description, resolution: @issue.resolution, status: @issue.status, thermostat_id: @issue.thermostat_id }
>>>>>>> 14ec02d6ab8edcf7325845df6814134b1178ee8a
    end

    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should show issue" do
    get :show, id: @issue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue
    assert_response :success
  end

  test "should update issue" do
<<<<<<< HEAD
    patch :update, id: @issue, issue: { description: @issue.description, resolution: @issue.resolution, state: @issue.state, thermostat_id: @issue.thermostat_id }
=======
    patch :update, id: @issue, issue: { description: @issue.description, resolution: @issue.resolution, status: @issue.status, thermostat_id: @issue.thermostat_id }
>>>>>>> 14ec02d6ab8edcf7325845df6814134b1178ee8a
    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should destroy issue" do
    assert_difference('Issue.count', -1) do
      delete :destroy, id: @issue
    end

    assert_redirected_to issues_path
  end
end
