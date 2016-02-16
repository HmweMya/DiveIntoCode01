class EntriesController < ApplicationController
    def new 
        @entry =  Entry.new
        if params[:back]
        @entry = Entry.new(confirm_params)
        end
    end
    def confirm
        @entry = Entry.new(confirm_params)
        if @entry.valid?
            render action: 'confirm'
       elsif params[:back]
        render action: 'new'
        else 
           @entry.save
            render action: 'new'
        end
    end
    def thanks
        @entry = Entry.new(confirm_params)
            @entry.save
       # end
    end
    private
    def confirm_params
       params.require(:entry).permit(:name, :email, :contact) 
      
    end
end