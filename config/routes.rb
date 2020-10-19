Rails.application.routes.draw do
  # send email by button click on show  form...
  get :product_email, to: 'products#product_email', as: :product_email

  namespace :api, defaults: { format: :json } do
    resources :examples, controller: '/examples'
    devise_for :users, controllers: { sessions: 'users/sessions' }
    devise_scope :user do
      get 'users/current', to: 'users/sessions#show'
    end
  end

  # namespace :''  , defaults: {format: :html} do
  #   # devise_for :users, controllers: { sessions: 'users/sessions' } do
  #   devise_for :users, controllers: { sessions: 'users/sessions' }
  #   resources :examples
  # end

  # scope :module => "api" , defaults: {format: :json} do
  #     resources :examples
  #     devise_for :users, controllers: {sessions: 'sessions'}
  #     devise_scope :user do
  #         get 'users/current', to: 'sessions#show'
  #     end
  # end

  resources :examples

  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    # get 'users/current', to: 'user2s#show'
    get 'users/current', to: 'users/sessions#show'
  end

  resources :product_features
  resources :products do
    get :autocomplete_pfeature_name, on: :collection
  end

  resources :pfeatures
  resources :country_of_origins do
    member do
      delete :delete_document_attachment
    end
    get :autocomplete_pfeature_name, on: :collection
  end

  mount RailsAdmin::Engine => '/radmin', as: 'rails_admin'
  resources :roles

  root 'home#index'

  get 'home/index'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
