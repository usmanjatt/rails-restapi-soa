Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :authentication do
        resources :authentication
      end
      namespace :customer do
        resources :customer
      end

    end
  end


end
