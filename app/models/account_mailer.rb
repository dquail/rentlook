class AccountMailer < ActionMailer::Base
  default_url_options[:host] = "localhost:3000"

  def password_reset_instructions(user)
    subject    'Password reset instructions'
    recipients user.email
    from       'accounts@rentlook.com'
    sent_on    Time.now

    body       :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end
  def password_verification_instructions(user)
    subject    'Rentlook account verification instructions'
    recipients user.email
    from       'accounts@rentlook.com'
    sent_on    Time.now

    body       :verification_url => user_verification_url(user.perishable_token)
  end
  def new_user_instructions(user, inviting_user)
    subject    inviting_user.firstname + ' ' + inviting_user.lastname + 'invites you to Rentlook'
    recipients user.email
    from       'accounts@rentlook.com'
    sent_on    Time.now

    body       :new_user_instructions_url => new_user_instruction_url(user.perishable_token), :inviting_user=> inviting_user
  end
end
