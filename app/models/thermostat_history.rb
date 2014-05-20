class ThermostatHistory < ActiveRecord::Base
	belongs_to :thermostat
	validate :existence_of_thermostat
	def existence_of_thermostat
		if thermostat==nil
			errors.add(:thermostat, "can't be nil")
		end
	end
end
