Rails.application.routes.draw do
  devise_for :users
  resources :lighthouse_reports, except: [:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#root'
end
