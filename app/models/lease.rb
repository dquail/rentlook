class Lease < ActiveRecord::Base
  validates_presence_of :start_date, :unit_id
  validates_numericality_of :rent, :auto_incriment_pct, :rent_due_date
  validate :rent_due_date_validation
  validate :no_lease_within_new_lease
  
  belongs_to :unit
  belongs_to :tenant, :class_name=> "Tenant", :foreign_key =>"tenant_id"
protected
  def rent_due_date_validation
    puts rent_due_date
    errors.add(:rent_due_date, 'Rent due date must be the day of the month when
      rent is due.  This must be between 1 and 28') if rent_due_date.nil? || rent_due_date < 1 || rent_due_date >28
  end
  def no_lease_within_new_lease
    other_leases = unit.leases
    other_leases.each do |existing_lease|
      if start_date >= existing_lease.start_date && start_date <= existing_lease.end_date
        errors.add(:start_date,'An existing lease for this unit is effective
                    within this new leases term.  Lease ID ' +existing_lease.id.to_s + ' starts ' + existing_lease.start_date.to_s +
          ' and ends ' + existing_lease.end_date.to_s)
      elsif end_date >= existing_lease.start_date &&  end_date <= existing_lease.end_date
        errors.add(:end_date,'An existing lease for this unit is effective
                    within this new leases term.  Lease ID ' +existing_lease.id.to_s + ' starts ' + existing_lease.start_date.to_s +
          ' and ends ' + existing_lease.end_date.to_s)
      end
    end
  end
end
