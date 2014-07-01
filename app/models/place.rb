class Place < ActiveRecord::Base
	validates :name, presence: true
	validates :code, presence: true
	validates :code, length: {maximum: 2}
	has_many :thermostats
end
