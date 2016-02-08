require 'spec_helper'

RSpec.feature 'Controller Integration' do
  scenario 'rescue exceptions by rendering error page' do
    visit '/posts/0'

    expect(page).to have_content 'File Not Found'
    expect(page).to have_content 'The file or resource you requested could not be found.'
  end

  scenario 'render error page from within the action' do
    visit '/posts/forbidden'

    expect(page).to have_content 'Forbidden'
    expect(page).to have_content 'No one has access to view this page.'
  end
end
