# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.new({:email => "osvaldo@hotmail.com", :password => "password", :password_confirmation => "123456789", :rol =>"Usuario", :user_enable => true}).save(:validate =>false)
User.new({:email => "admin@admin.com", :password => "password", :password_confirmation => "12341234", :rol =>"Administrador", :user_enable => true}).save(:validate =>false)