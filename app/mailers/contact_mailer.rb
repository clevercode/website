class ContactMailer < ActionMailer::Base
  default from: 'site@clevercode.net'

  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
