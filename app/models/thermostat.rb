class Thermostat < ActiveRecord::Base
	belongs_to :location
	has_many :thermostat_histories
	validates_uniqueness_of :serial_number

	has_many :temperatures
	has_many :schedules


	def get_valor(dia,franja)
		50
	end
end
