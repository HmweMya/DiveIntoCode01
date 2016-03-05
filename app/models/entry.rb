# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  contact    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entry < ActiveRecord::Base
    validates :name, presence: true
     #validates :email, presence: true
    #validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: {with: VALID_EMAIL_REGEX}, unless: "email.empty?"
    validates :email, presence: true
    validates :contact,presence: true
    validates :title,presence: true
    # require 'mail'

    # Mail.defaults do
    #   delivery_method :smtp, {
    #     :address => "smtp.gmail.com",
    #     :port => 587,
    #     :domain => 'example.com',
    #     :user_name => 'hmwehmwe.91@gmail.com',
    #     :password => 'handsforeverforevertogether',
    #     :authentication => 'plain',
    #     :enable_starttls_auto => true
    #   }
    # end
    
    # m = Mail.new do
    #   from 'hmwehmwe.91@gmail.com' #"<送信元メールアドレス>"
    #   to   'infant1500@gmail.com'#"<送信先メールアドレス>"
    #   subject "test mail subject"
    #   body "テストメールです"
    # end
    
    # # 本文のエンコーディング設定。これを書かないと実行時にワーニングが出る
    # m.charset = "UTF-8"
    # m.content_transfer_encoding = "8bit"
    # m.deliver
end
