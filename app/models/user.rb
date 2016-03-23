# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  uid                    :string           default(""), not null
#  provider               :string           default(""), not null
#  image_url              :string
#  image                  :string
#  profile_image_url      :string
#  about_me               :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :blogs, dependent: :destroy
  has_many :comments
  has_many :qs
  has_many :answers
  devise :database_authenticatable, :registerable,#for mail confirm
         :recoverable, :rememberable, :trackable, :validatable,:confirmable, :omniauthable
  mount_uploader :image, ImageUploader       
     #facebook    
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil) 
      user = User.where(provider: auth.provider, uid: auth.uid).first
      unless user 
        user = User.create(name: auth.extra.raw_info.name, 
                           provider: auth.provider, 
                           uid: auth.uid, 
                           email: self.create_unique_email, 
                           password: Devise.friendly_token[0,20]
                          ) 
      end 
      user
  end
  
  
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil) 
      user = User.where(provider: auth.provider, uid: auth.uid).first
      unless user 
        user = User.create(name: auth.info.nickname, 
                           provider: auth.provider, 
                           uid: auth.uid, 
                           email: User.create_unique_email, 
                           password: Devise.friendly_token[0,20],
                           profile_image_url: auth.info.image
                          # profile_image_url: "http://a0.twimg.com/profile_images/#{uid}.jpg"
                          ) 
                          #binding.pry
      end 
      user
  end

  
  def self.create_unique_string 
    SecureRandom.uuid 
  end
  
  def self.create_unique_email 
      User.create_unique_string + "@example.com" 
  end
end
