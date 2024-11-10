require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    # Use fixture_file_upload to upload an image as the profile_pic
    profile_pic = fixture_file_upload(Rails.root.join("test", "fixtures", "files", "pic.jpeg"), "image/jpeg")

    assert_difference "User.count", 1 do
      post "/users.json", params: { 
          name: "Test", 
          email: "test@test.com", 
          password: "password", 
          password_confirmation: "password", 
          username: "testname",
          bio: "I love pizza",
      } 
      assert_response 201
    end
  end
end
