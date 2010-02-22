class Landlord < User
  has_many :properties
  has_many :units, :through=>:properties

  def role_symbols
    [:landlord]
  end

  def applications
    applications = []
    units.each do |unit|
      unit.applications.each do |application|
        applications<< application
      end
    end
    return applications
  end
  def self.create_with_perishable_token(user)

    new_user = Landlord.new(:email=>user[:email], :firstname=>user[:firstname], :lastname=>user[:lastname], :password=>"test")
    new_user.reset_perishable_token!
    return new_user
  end
end