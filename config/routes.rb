Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

 devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
 end

 root 'groups#index'

#  resources :users

#  resources :groups, only %i[index show new create destroy] do
#   resources :expenses, only %i[new show create destroy]
#  end
end
