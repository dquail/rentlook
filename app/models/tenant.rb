class Tenant < User  
  has_many :leases
  has_many :occupancies
  
  def self.create_with_perishable_token(user)
    @existing_user = User.find_by_email(user.email)
    if @existing_user
      return @existing_user
    else
      new_user = Tenant.new(:email=>user.email, :firstname=>user.firstname, :lastname=>user.lastname, :password=>user.password)
      new_user.reset_perishable_token!
      return new_user
    end


  end
end