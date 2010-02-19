class Property < ActiveRecord::Base
  validates_presence_of :address, :city, :country, :state, :zip
  validates_uniqueness_of :name, :scope => :landlord_id
  validates_inclusion_of  :country,
                          :in => %w{USA},
                          :message => "The valid countries are USA"
  #validates_attachment_size :photo, :less_than => 5.megabytes, :allow_nil => true
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png'], :allow_nil=>true
  belongs_to :landlord
  has_many :units
  has_many :applications, :through=>:units
  has_attached_file :photo,
                    :styles => { :small => "150x150>", :thumb => "35X35>" },
                    :url => "/assets/properties/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/properties/:id/:style/:basename.:extension",
                    :default =>"/images/property.png"
end
