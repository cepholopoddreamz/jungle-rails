class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'
  # :port           => 587,
  # :address        => "smtp.mailgun.org",
  # :domain         => ENV['domain'],
  # :user_name      => ENV['username'],
  # :password       => ENV['password'],
  # :authentication => :plain
end




