class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_post.subject
  #
  def sendmail_post(post)
    @post = post
    @greeting = "Hi"

    mail to: "tomeme0321@gmail.com",
         subject: '【MeetAir】A meetup plan got posted!'
  end
end
