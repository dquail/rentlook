class Status < ActiveRecord::Base
  validates_presence_of :status
  validates_inclusion_of  :status,
                          :in => %w{'Rented', 'Listed','Vacant'},
                          :message => "Statuses are Rented, Listed, Vacant"
end
