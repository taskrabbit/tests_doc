# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  with_options except: %i[new edit] do |r|
    r.resources :posts
    r.resources :users do
      r.resources :posts
    end
  end
end
