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
end
