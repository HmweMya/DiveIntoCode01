class QAmailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.q_amailer.sendmail_confirm.subject
  #
  def sendmail_confirm(q)
    @greeting = "こんにちは、"+ q.user.name+"さん"

    #mail to: "to@example.org"
    mail to: q.user.email, subject: "質問の投稿について"
  end
end
