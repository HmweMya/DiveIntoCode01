class Users::RegistrationsController < Devise::RegistrationsController
    before_filter :configure_permitted_parameters
    def build_resource(hash=nil) 
        hash[:uid] = User.create_unique_string 
        super 
    end
    
    def update_resource(resource, params) ##user information skip -->update
       resource.update_without_password(params) 
       #binding.pry
    end
end
