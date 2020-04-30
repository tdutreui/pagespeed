Rails.application.routes.draw do
  get 'lighthouse_reports/index'
  get 'lighthouse_reports/new'
  get 'lighthouse_reports/show'
  get 'lighthouse_reports/create'
  get 'lighthouse_reports/destroy'
  devise_for :users
  resources :lighthouse_reports, except: :edit
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#root'
end
