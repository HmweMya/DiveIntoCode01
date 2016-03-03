# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 #Blog.create(
     #[
        # {
            # title: 'myamya'
         #},
         #{
             #content: 'Yangon'
         #},
         #{
             #user_id: 64
        # }])
         #Blog.create(:id => 1, :title => 'myamya', :content => 'Yangon', :user_id => 1)
         #User.create(:id => 1, :email => 'aa@gmail.com', :name => 'myamya', :about_me => 'I am..')
         
         1000.times do |y|
            Blog.create(:id => y+1, :title => "title #{y+1}", :content => "content #{y+1}", :user_id => y+1)
            User.create(:id => y+1, :email => "#{y+1}@gmail.com", :password => "#{y+1}password",:name => "hmwemya#{y+1}", :uid => "user#{y+1}", :provider => "")
        end
        