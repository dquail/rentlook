require 'test_helper'

class AccountMailerTest < ActionMailer::TestCase
  test "password_reset" do
    @expected.subject = 'AccountMailer#password_reset'
    @expected.body    = read_fixture('password_reset')
    @expected.date    = Time.now

    assert_equal @expected.encoded, AccountMailer.create_password_reset(@expected.date).encoded
  end

  test "account_create" do
    @expected.subject = 'AccountMailer#account_create'
    @expected.body    = read_fixture('account_create')
    @expected.date    = Time.now

    assert_equal @expected.encoded, AccountMailer.create_account_create(@expected.date).encoded
  end

end
