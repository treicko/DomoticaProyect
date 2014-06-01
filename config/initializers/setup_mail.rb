ActionMailer::Base.smtp_settings = {  
:address              => "smtp.gmail.com",  
:port                 => 587,  
:domain               => "gmail.com",  
:user_name            => "treicko123@gmail.com",  
:password             => "treicko12345",  
:authentication       => "plain",  
:enable_starttls_auto => true  
}  