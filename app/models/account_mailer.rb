class AccountMailer < ActionMailer::Base
  #default_url_options[:host] = "localhost:3000"
  default_url_options[:host] = "rentlook.com"

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
    subject    inviting_user.firstname + ' ' + inviting_user.lastname + ' invites you to Rentlook'
    recipients user.email
    from       'accounts@rentlook.com'
    sent_on    Time.now

    body       :new_user_instructions_url => new_user_instruction_url(user.perishable_token), :inviting_user=> inviting_user
  end

  def application_for_unit(user, inviting_user, application)
    subject    inviting_user.firstname + ' ' + inviting_user.lastname + ' has sent you a Rentlook application'
    recipients user.email
    from       'accounts@rentlook.com'
    sent_on    Time.now

    body       :application => application, :inviting_user=> inviting_user
  end

  def application_update_for_unit(editing_user, notified_user, application)
    subject    editing_user.firstname + ' ' + editing_user.lastname + ' has updated your application on Rentlook'
    recipients notified_user.email
    from       'accounts@rentlook.com'
    sent_on    Time.now

    body       :application => application, :editing_user=> editing_user
  end

  def application_rejected_for_unit(application)
    subject    application.unit.property.landlord.firstname + ' ' + application.unit.property.landlord.firstname + ' rejected your application'
    recipients application.tenant.email
    from       'accounts@rentlook.com'
    sent_on    Time.now

    body       :application => application
  end

  def lease_for_unit(user, inviting_user, lease)
    subject    inviting_user.firstname + ' ' + inviting_user.lastname + ' has sent you a Rentlook lease'
    recipients user.email
    from       'accounts@rentlook.com'
    sent_on    Time.now

    body       :lease => lease, :inviting_user=> inviting_user
  end

  def lease_update_for_unit(user, inviting_user, lease)
    subject    inviting_user.firstname + ' ' + inviting_user.lastname + ' has updated your Rentlook lease'
    recipients user.email
    from       'accounts@rentlook.com'
    sent_on    Time.now

    body       :lease => lease, :inviting_user=> inviting_user
  end


end
