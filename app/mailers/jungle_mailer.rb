class JungleMailer < ApplicationMailer
  #default from: "no-reply@jungle.com"
  def order_email(order)
    @order = order
    mail(to:  @order.email, subject: 'Thank You for your purchase')
    #call the views file?
  end
end

    # mg_client = Mailgun::Client.new ENV['api_key']
    # message_params = {:from    => ENV['gmail_username'],
    #                   :to      => @user.email,
    #                   :subject => 'Confirmation Email for Order',
    #                   :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    # mg_client.send_message ENV['domain'], message_params
