# Preview all emails at http://localhost:3000/rails/mailers/answermailer
class AnswermailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/answermailer/sendmail_confirm
  def sendmail_confirm
    Answermailer.sendmail_confirm
  end

end
