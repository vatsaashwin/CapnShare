class FoodShare < ApplicationMailer    
    def food_request(food_post,current_user_email,current_user_name)
        @food_post_details = food_post
        @current_user_email = current_user_email
        @current_user_name =current_user_name
        mail(to: @food_post_details.contact,subject: 'Someone is Interested in Your Food Post - CapnShare',:template_path => "food_share",:template_name => "food_request")            
    end    
 end
 