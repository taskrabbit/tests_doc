Rails.application.routes.draw do
  resources :posts, except: [:new, :edit]
  resources :users, except: [:new, :edit] do
    resources :posts
  end
end
