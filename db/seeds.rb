# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.new({:email => "osvaldo@hotmail.com", :password => "12341234", :password_confirmation => "12341234", :rol =>"Usuario", :user_enable => true}).save(:validate =>false)
User.new({:email => "admin@admin.com", :password => "12341234", :password_confirmation => "12341234", :rol =>"Administrador", :user_enable => true}).save(:validate =>false)
Location.new({:address => "Casa", :user_id => 1, :country => "Bolivia", :region => "Cochabamba"}).save
Thermostat.new({:serial_number => 1, :location_id => 1, :place => "Cuarto", :temperature => 15, :configuration => "true"}).save
Thermostat.new({:serial_number => 2, :location_id => 1, :place => "Cocina", :temperature => 16, :configuration => "false"}).save
thermostat_id1 = Thermostat.first.id
thermostat_id2 = Thermostat.last.id
#fecha = Time.new.strftime("%Y-%m-%d")
#Schedule.new({:day => 'LUNES', :time => "2014-05-28 12:00:00.000000", :temperature => 25, :thermostat_id => thermostat_id}).save

#lista_fecha = [
#	["#{fecha} 12:00:00"],
#	["#{fecha} 13:00:00"],
#	["#{fecha} 14:00:00"],
#	["#{fecha} 15:00:00"],
#	["#{fecha} 16:00:00"]
#]

lista_fecha = [
	"2014-05-28 12:00:00.000000",
	"2014-05-28 13:00:00.000000",
	"2014-05-28 14:00:00.000000",
	"2014-05-28 15:00:00.000000",
	"2014-05-28 16:00:00.000000"
]

lista_fecha.each do |date_time|
  Schedule.new({:day => 'LUNES', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id1}).save
  Schedule.new({:day => 'MARTES', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id1}).save
  Schedule.new({:day => 'MIERCOLES', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id1}).save
  Schedule.new({:day => 'JUEVES', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id1}).save
  Schedule.new({:day => 'VIERNES', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id1}).save
  Schedule.new({:day => 'SABADO', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id1}).save
  Schedule.new({:day => 'DOMINGO', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id1}).save
end

lista_fecha.each do |date_time|
  Schedule.new({:day => 'LUNES', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id2}).save
  Schedule.new({:day => 'MARTES', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id2}).save
  Schedule.new({:day => 'MIERCOLES', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id2}).save
  Schedule.new({:day => 'JUEVES', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id2}).save
  Schedule.new({:day => 'VIERNES', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id2}).save
  Schedule.new({:day => 'SABADO', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id2}).save
  Schedule.new({:day => 'DOMINGO', :time => date_time, :temperature => 25, :thermostat_id => thermostat_id2}).save
end

