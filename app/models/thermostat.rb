class Thermostat < ActiveRecord::Base
	belongs_to :location
	has_many :thermostat_histories
	validates_uniqueness_of :serial_number

	has_many :temperatures
	has_many :schedules


	def get_valor(dia,franja, t_id)
		@agenda = Schedule.where(:day => dia, :time => franja, :thermostat_id => t_id).first
		@final = @agenda.temperature

	end
end
