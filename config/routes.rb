Rails.application.routes.draw do
  resources :pages, except: [:create] do
    post 'analyse', on: :collection
  end
  resources :projects
  devise_for :users
  resources :lighthouse_reports, except: [:edit, :update] do
    get 'detail/:strategy', action: :detail, as: :detail
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
end
