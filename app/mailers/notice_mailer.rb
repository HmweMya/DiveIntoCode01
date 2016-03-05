class NoticeMailer < ApplicationMailer
  after_action :mail_receive
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  default from: "user@gmail.com"
  
  def sendmail_confirm(entry)
    @greeting = "こんにちは、"+ entry.name

    #mail to: "to@example.org"
    mail to: entry.email, subject: "ActionMailer test"
  end
  def mail_receive 
    
  end
  # def receive(entry)
  #   entry = Entry
  #   entry.email.create(
  #     subject: email.subject,
  #     body: email.body
  #   )
 
  #   if email.has_attachments?
  #     email.attachments.each do |attachment|
  #       page.attachments.create({
  #         file: attachment,
  #         description: email.subject
  #       })
  #     end
  #   end
  # end
end
