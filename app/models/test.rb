require 'test_helper'
class Test < ActiveRecord::Base
    def setup
    @user = User.new(name: "Example User", email: "user@example.com")
    end

  test "should be valid" do
    assert @user.valid?
  end 
end
