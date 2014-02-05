class UserMailer < ActionMailer::Base
  default from: "admin@somesite.com"

  def quiz_mail(user)
  	@user = user
  	@url = 'http://www.mysite.com'
  	mail(to: @user.email, subject: "You completed another set of quizzes!")
  end
end
