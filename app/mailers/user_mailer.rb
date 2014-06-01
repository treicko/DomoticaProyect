class UserMailer < ActionMailer::Base
   def registration_confirmation(email)  
	mail(:to => "treicko123@gmail.com", :subject => "Alerta de Termostato", :from => "eifion@asciicasts.com")  
  end 
end
