require 'spec_helper'

RSpec.feature 'Errors' do
  scenario 'rescue exceptions by rendering error page' do
    visit posts_path id: '0'

    expect(page).to have_content 'File Not Found'
    expect(page).to have_content "The requested file or resource could not be found."
  end

  scenario 'render error page from within the action' do
    visit forbidden_posts_path

    expect(page).to have_content 'Forbidden'
    expect(page).to have_content "No one has access to view this page."
  end
end
