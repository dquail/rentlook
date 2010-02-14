class Landlord < User
  has_many :properties
  has_many :units, :through=>:properties
  has_many :applications, :through=>:units, :source=>"Landlord"
  def self.create_with_perishable_token(user)

    new_user = Landlord.new(:email=>user[:email], :firstname=>user[:firstname], :lastname=>user[:lastname], :password=>"test")
    new_user.reset_perishable_token!
    return new_user
  end
end