class CleverContact < ActionMailer::Base
  default to: "team@clevercode.net"

  def contact_email(params)
    @name    = params[:name]
    @email   = params[:email]
    @message = params[:message]
    email_with_name = "#{@name} <#{@email}>"
    mail from: email_with_name, subject: 'New cleverContact recieved.'
  end
end
