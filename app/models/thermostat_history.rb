class ThermostatHistory < ActiveRecord::Base
	belongs_to :thermostat
	validate :existence_of_thermostat, :correct_user
	def existence_of_thermostat
		if thermostat==nil
			errors.add(:thermostat, "can't be nil")
		end
	end

	def correct_user
		if thermostat != nil
			if User.current != thermostat.location.user 
				errors.add(:thermostat, "is not yours")
			end
		end		
	end
end
