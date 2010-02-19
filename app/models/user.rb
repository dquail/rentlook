class User < ActiveRecord::Base

  has_attached_file :photo,
                  :styles => { :small => "150x150>", :thumb => "35X35>" },
                  :url => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension",
                  :default =>"/images/user.png"

  acts_as_authentic do |c|
    login_field :email
    validate_login_field :false
  end
  
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png'], :allow_nil=>true
  validates_presence_of :firstname, :lastname, :email, :type
  validates_uniqueness_of :email

  def verify!
    self.verified = true
    self.save
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    AccountMailer.deliver_password_reset_instructions(self)
  end
  
  def deliver_verification_instructions!
    reset_perishable_token!
    AccountMailer.deliver_password_verification_instructions(self)
  end
  
  def deliver_new_user_instructions!(inviting_user)
    reset_perishable_token!
    AccountMailer.deliver_new_user_instructions(self, inviting_user)
  end

end