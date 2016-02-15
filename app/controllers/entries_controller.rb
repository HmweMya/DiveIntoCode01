class EntriesController < ApplicationController
    def new 
        @entry =  Entry.new
        
       
    end
    def confirm
        @confirm = Entry.new(confirm_params)
    end
    def thanks
        @thanks = Entry.new(confirm_params)
            @thanks.save
    end
    private
    def confirm_params
       params.require(:entry).permit(:name, :email, :contact) 
    end
end
