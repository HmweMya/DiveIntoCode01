# == Schema Information
#
# Table name: tests
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#ruby -I. unit/person_test.rb
class Test < ActiveRecord::Base
 
end
