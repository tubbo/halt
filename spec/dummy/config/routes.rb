Rails.application.routes.draw do
  resources :posts do
    collection do
      get :forbidden
    end
  end

  root to: 'posts#index'
end
