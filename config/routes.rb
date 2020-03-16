Rails.application.routes.draw do
  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }

   use_doorkeeper do
    # it accepts :authorizations, :tokens, :token_info, :applications and :authorized_applications
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
