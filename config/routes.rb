Rails.application.routes.draw do
  devise_for :users,
             :controllers => { omniauth_callbacks: 'omniauth_callbacks' },
             skip: [:sessions]
  as :user do
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :profiles, except: [:destroy, :show]
  resources :requisitions, except: [:show]

  root 'home#index'
end
