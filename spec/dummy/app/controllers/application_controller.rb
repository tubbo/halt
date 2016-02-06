class ApplicationController < ActionController::Base
  include Halt

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  halt ActiveRecord::RecordNotFound, with: :not_found
end
