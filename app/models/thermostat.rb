class Thermostat < ActiveRecord::Base
	belongs_to :location
	has_many :thermostat_histories
	validates_uniqueness_of :serial_number
	validates_presence_of :serial_number,:temperature, :configuration
	has_many :temperatures
	has_many :schedules
	after_initialize :set_config_to_true
	private
		def set_config_to_true
			self.configuration = true
		end
end
