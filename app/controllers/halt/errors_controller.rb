module Halt
  class ErrorsController < ActionController::Base
    include Halt

    def show
      expires_in Rails.configuration.halt.cache_expiry, public: true

      @error = Error.new(params[:id])

      respond_to do |format|
        format.html { render 'application/error', status: @error.status, error: @error }
        format.json { render json: @error, status: @error.status }
        format.all  { head @error.status }
      end
    end
  end
end
