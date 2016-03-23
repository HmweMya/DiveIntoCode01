class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  PERMISSIBLE_ATTRIBUTES = %(name image_url image about_me).freeze
  
  protected

    def configure_permitted_parameters
      #devise_parameter_sanitizer.for(:account_update) {|h| h.permit(:name, :image_url)}
       devise_parameter_sanitizer.for(:account_update) do |u| u.permit(:name, :image_url, :image, :about_me)
       end
      #devise_parameter_sanitizer.for(:account_update) << PERMISSIBLE_ATTRIBUTES
    end
    
    protected

    def configure_permitted_parameters
      #devise_parameter_sanitizer.for(:account_update) {|h| h.permit(:name, :image_url)}
       devise_parameter_sanitizer.for(:sign_up) << :name
      
      #devise_parameter_sanitizer.for(:account_update) << PERMISSIBLE_ATTRIBUTES
    end
end
