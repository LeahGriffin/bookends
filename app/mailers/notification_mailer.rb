class NotificationMailer < ApplicationMailer
  default from: "no-reply@bookends.com"

  def media_added
    mail(to: "my@email.com",
        subject: "There's something new on your shelf")
  end
end
