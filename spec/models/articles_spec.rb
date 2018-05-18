require 'rails_helper'

feature Admin::Articles, '.new' do

  scenario 'can create an article' do
    visit('/admin/articles')

    click_link('Write a new article')

    fill_in('title', :with => 'Test Article')

    click_button('Create Article')


    expect(page).to have_content('Test Article')
  end

end
