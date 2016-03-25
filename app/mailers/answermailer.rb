class Answermailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.answermailer.sendmail_confirm.subject
  #
  def sendmail_confirm(answer)
    @greeting = "こんにちは、"+ answer.q.user.name+"さん"
    #mail to: "to@example.org"
    mail to: answer.q.user.email, subject: "あなたの質問にコメントが付きました。"
  end
end
