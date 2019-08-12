require 'test_helper'

module Halt
  class IntegrationTest < ActionDispatch::IntegrationTest
    test 'halt request in the middle of an action' do
      get halted_path

      assert_response :error
    end

    test 'halt all requests that throw error' do
      get exception_path

      assert_response :unprocessable_entity
    end

    test 'use custom error status' do
      get missing_path

      assert_response :not_found
      assert_includes response.body, 'Not Found'
    end

    test 'internal server error response' do
      message = I18n.t(:internal_server_error, scope: %i[halt errors messages])

      get halt.internal_server_error_path

      assert_includes response.body, message
      assert_equal 500, response.status
    end

    test 'unprocessable entity response' do
      message = I18n.t(:unprocessable_entity, scope: %i[halt errors messages])

      get halt.unprocessable_entity_path

      assert_includes response.body, message
      assert_equal 422, response.status
    end

    test 'not found response' do
      message = I18n.t(:not_found, scope: %i[halt errors messages])

      get halt.not_found_path

      assert_includes response.body, message
      assert_equal 404, response.status
    end

    test 'add custom errors to config' do
      message = I18n.t(:unauthorized, scope: %i[halt errors messages])

      get halt.unauthorized_path

      assert_includes response.body, message
      assert_equal 401, response.status
    end
  end
end
