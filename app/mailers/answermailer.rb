class Answermailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.answermailer.sendmail_confirm.subject
  #
  def sendmail_confirm(a)
    @greeting = "こんにちは、"+ a.user.name+"さん"

    #mail to: "to@example.org"
    mail to: a.q.user.email, subject: "あなたの質問にコメントが付きました。"
  end
end
