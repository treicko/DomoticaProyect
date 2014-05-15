class Thermostat < ActiveRecord::Base
	belongs_to :location

	has_many :temperatures
end
