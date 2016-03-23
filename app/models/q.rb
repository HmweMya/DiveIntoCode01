class Q < ActiveRecord::Base
    belongs_to :user
    #has_many :comments, dependent: :destroy
    validates :title,presence: true
    validates :content,presence: true
    validates :category,presence: true
    validates :language,presence: true
end
