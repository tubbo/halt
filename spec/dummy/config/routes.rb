Rails.application.routes.draw do

  mount Halt::Engine => "/halt"
end
