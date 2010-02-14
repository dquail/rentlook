class Occupancy < ActiveRecord::Base
  validates_presence_of :tenant_id, :unit_id, :start_date
  belongs_to :unit
  belongs_to :tenant, :class_name=> "Tenant", :foreign_key =>"tenant_id"
end
