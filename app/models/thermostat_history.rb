class ThermostatHistory < ActiveRecord::Base
	belongs_to :thermostat
	validates_presence_of :thermostat,:temperature, :humidity, :consumption
	validates :temperature, numericality: { greater_than_or_equal_to: -20,less_than_or_equal_to: 60 }
	validates :humidity, numericality: { greater_than_or_equal_to: 0,less_than_or_equal_to: 100 }
	validates :consumption, numericality: { greater_than_or_equal_to: 0,less_than_or_equal_to: 1000 }
	validate :existence_of_thermostat, :correct_user
	def existence_of_thermostat
		if thermostat==nil
			errors.add(:thermostat, "doesn't exist")
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

class Status
  def initialize
    #@status_label = 'status'
    @status= 'OK'
    @message='Thermostat History saved correctly!'
  end
  
  attr_accessor :status, :message
end

