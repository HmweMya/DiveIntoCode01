# Preview all emails at http://localhost:3000/rails/mailers/q_amailer
class QAmailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/q_amailer/sendmail_confirm
  def sendmail_confirm
    QAmailer.sendmail_confirm
  end

end
