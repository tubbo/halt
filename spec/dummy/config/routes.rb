Rails.application.routes.draw do

  resources :posts
  mount Halt::Engine => "/halt"
end
