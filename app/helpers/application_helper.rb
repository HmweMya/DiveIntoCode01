module ApplicationHelper
    def profile_img(user)
      
      if user.provider == 'facebook'
        img_url = "https://graph.facebook.com/#{user.uid}/picture?width=320&height=320"
      elsif user.provider == 'twitter'
        img_url = "http://furyu.nazo.cc/twicon/#{user.uid}"
      else
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        img_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      end
      image_tag(img_url, alt: user.name)
    end
    
    
    
  def image(user)
    if user.image.present?
      image_tag user.image
      #image_tag  "images.png"
    elsif user.provider == 'facebook'
      image_tag  "https://graph.facebook.com/#{user.uid}/picture?width=200&height=200"
    elsif user.provider == 'twitter'
      #image_tag = "http://furyu.nazo.cc/twicon/#{user.uid}"
      @image = user.profile_image_url
      @image.slice!("_bigger") || @image.slice!("_normal")
      
      image_tag @image
      #binding.pry
    else
    # Assuming you have a default.jpg in your assets folder
      image_tag  "images.png"
    end
  end
  
end
