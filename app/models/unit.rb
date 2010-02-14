class Unit < ActiveRecord::Base
  validates_presence_of :property_id, :bedrooms, :bathrooms, :square_feet
  validates_numericality_of :bedrooms, :bathrooms, :square_feet
  validates_uniqueness_of :name, :scope => :property_id
  validate :rent_validation
  has_many :occupants,
            :through=>:occupancies,
            :class_name=>"Tenant"
  has_many :occupancies
  has_many :current_occupancies, :class_name=>'Occupancy', :conditions=>"status='A'"
  has_many :applications

  belongs_to :property
  has_many :leases
  has_one :active_lease,
          :class_name => 'Lease',
          :conditions => "start_date <= '#{DateTime.now}' AND end_date > '#{DateTime.now}'"


protected
  def rent_validation
    errors.add(:base_rent, "Should be at least 1") if base_rent.nil? || base_rent < 1
  end
end
