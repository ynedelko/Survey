require('spec_helper')
require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('quizzes path', {:type => :feature}) do
  it('displays index page and adds quiz') do
    visit('/')
    fill_in('name', with: "Blue")
    click_button("Add your quiz!")
    expect(page).to have_content('All quizzes so far!')
  end
end
