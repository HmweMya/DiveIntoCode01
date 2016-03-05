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

class EntriesController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]
    #before_action :logged_in_user, only: [:edit, :update]
    #before_action :correct_user,   only: [:edit, :update]
    before_filter :authenticate_user!
    def new 
        @entry =  Entry.new
        if params[:back]
        @entry = Entry.new(confirm_params)
        end
    end
    def confirm
        @entry = Entry.new(confirm_params)
        if @entry.valid? # if true
            render action: 'confirm'
       elsif params[:back] # back page data remain
        render action: 'new'
        else 
           @entry.save
            render action: 'new'
        end
    end
    def thanks
        @entry = Entry.new(confirm_params)
        
         #render :text => 'send finish'
        @entry.save
        NoticeMailer.sendmail_confirm(@entry).deliver
        # if @entry.deliver
        #   flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
        # else
        #   flash.now[:error] = 'Cannot send message.'
        #   render :new
        # end
       # end
    end
    def detail
        @entry = Entry.all
       #NoticeMailer.receive(@entry)
    end
    private  #protect hacking
    def confirm_params
       params.require(:entry).permit(:name, :email, :contact, :title) 
      
    end
   # def logged_in_user
      #unless logged_in?
       # store_location
        #flash[:danger] = "ログインしてください。."
        #redirect_to login_url
     # end
    #end
    #def correct_user
      #@user = User.find(params[:id])
      ##redirect_to(root_url) unless @user == current_user
      #redirect_to(root_url) unless current_user?(@user)
    #end
end
