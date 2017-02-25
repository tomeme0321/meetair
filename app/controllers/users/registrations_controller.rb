class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]
  before_action :configure_permitted_parameters, only: [:update]

  # POST /resource
  # def create
  #   super
  # end
  #
  # # GET /resource/sign_up
  # def new
  #   super
  # end

  # PUT /resource
  def update
    new_data = params[:user]
    current_user.name = new_data[:name]
    current_user.avatar = new_data[:avatar]
    current_user.age = new_data[:age]
    current_user.gender = new_data[:gender]
    current_user.nationality = new_data[:nationality]
    current_user.language = new_data[:language]
    current_user.occupation = new_data[:occupation]
    current_user.interest = new_data[:interest]
    current_user.freecomment = new_data[:freecomment]
    current_user.save!
    redirect_to edit_user_registration_path
  end

  private

  def configure_permitted_parameters
    keys = [
      :avatar,
      :avatar_cache,
      :email,
      :name,
      :age,
      :gender,
      :occupation,
      :nationality,
      :language,
      :interest,
      :freecomment,
      :password,
      :password_confirmation,
      :current_password,
    ]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
