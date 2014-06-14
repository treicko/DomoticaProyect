class Issue < ActiveRecord::Base
	validates_presence_of :thermostat_id,:description, :state
	
end
