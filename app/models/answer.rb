class Answer < ActiveRecord::Base
  belongs_to :q
  belongs_to :user
end
