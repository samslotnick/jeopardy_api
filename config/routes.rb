Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login }

    resource :user, only: [:show, :update]
    resources :games, param: :code do 
      resources :contestants
      resources :questions


    end
  end
  # mount ActionCable.server => "/cable"
end
