# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'jk rowling'
        fill_in 'Price', with: 6.98
        fill_in 'Published date', with: '19970607'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
        expect(page).to have_content('jk rowling')
        expect(page).to have_content("6.98")
        expect(page).to have_content("1997-06-07")
    end
end

RSpec.describe 'Creating a book with a price to round up', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'jk rowling'
        fill_in 'Price', with: 6.987
        fill_in 'Published date', with: '19970607'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
        expect(page).to have_content('jk rowling')
        expect(page).to have_content("6.99")
        expect(page).to have_content("1997-06-07")
    end
end

RSpec.describe 'Creating a book with a price to round down', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'jk rowling'
        fill_in 'Price', with: 6.983
        fill_in 'Published date', with: '19970607'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
        expect(page).to have_content('jk rowling')
        expect(page).to have_content("6.98")
        expect(page).to have_content("1997-06-07")
    end
end