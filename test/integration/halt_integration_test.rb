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
      assert_includes response.body, 'File Not Found'
    end
  end
end
