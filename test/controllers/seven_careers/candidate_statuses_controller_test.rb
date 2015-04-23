require 'test_helper'

module SevenCareers
  class CandidateStatusesControllerTest < ActionController::TestCase
    setup do
      @candidate_status = candidate_statuses(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:candidate_statuses)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create candidate_status" do
      assert_difference('CandidateStatus.count') do
        post :create, candidate_status: {  }
      end

      assert_redirected_to candidate_status_path(assigns(:candidate_status))
    end

    test "should show candidate_status" do
      get :show, id: @candidate_status
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @candidate_status
      assert_response :success
    end

    test "should update candidate_status" do
      patch :update, id: @candidate_status, candidate_status: {  }
      assert_redirected_to candidate_status_path(assigns(:candidate_status))
    end

    test "should destroy candidate_status" do
      assert_difference('CandidateStatus.count', -1) do
        delete :destroy, id: @candidate_status
      end

      assert_redirected_to candidate_statuses_path
    end
  end
end
