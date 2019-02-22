class JungleMailer < ApplicationMailer
end


  def jungle_email(user)
    @user = user
    mail(to:  no-reply@jungle.com, subject: 'Thank You for your purchase')
  end