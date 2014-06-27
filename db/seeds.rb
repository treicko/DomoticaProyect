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