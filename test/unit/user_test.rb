require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  setup :activate_authlogic

  test "the truth" do
    assert true
  end

  test "invalid with empty attributes" do
    user = User.new
    assert !user.valid?
    assert user.errors.invalid?(:firstname)
    assert user.errors.invalid?(:lastname)
    assert user.errors.invalid?(:firstname)
    assert user.errors.invalid?(:email)
  end
end
