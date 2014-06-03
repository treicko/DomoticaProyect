class Temperature < ActiveRecord::Base
	belongs_to :thermostat
	before_create :set_default_configuration
	
end
