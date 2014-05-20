class Thermostat < ActiveRecord::Base
	belongs_to :location
	has_many :Thermostat_histories
	validates_uniqueness_of :serial_number

	has_many :temperatures
end
