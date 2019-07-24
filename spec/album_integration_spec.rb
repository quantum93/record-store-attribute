require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an album path', {:type => :feature}) do
  it('creates an album and then goes to the album page') do
    visit('/albums')
    click_on('Add a new album')
    fill_in('album_name', :with => 'Yellow Submarine')
    # fill_in('album_artist', :with => 'Joe')
    # fill_in('album_genre', :with => 'Rock')
    # fill_in('album_year', :with => '2000')
    click_on('add_album')
    expect(page).to have_content('Yellow Submarine')
  end
end
