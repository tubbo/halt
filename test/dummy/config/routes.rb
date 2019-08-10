Rails.application.routes.draw do
  get :halted, to: 'application#halted'
  get :missing, to: 'application#missing'
  get :exception, to: 'application#exception'

  root to: 'application#index'
end
