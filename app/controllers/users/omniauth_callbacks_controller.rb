class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAA"
      puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAA"
          puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAA1"
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def linkedin
    puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAA"
      puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAA"
          puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAA"

    @user = User.find_for_linkedin_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind: "LinkedIn") if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.linkedin_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
