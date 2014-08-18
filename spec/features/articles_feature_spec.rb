require 'rails_helper'

describe 'can create an article' do
	context 'if logged out' do
		it 'display article form' do
			visit('/')
			fill_in 'title', with: "Super title"
			fill_in 'content', with: "Awesome content"
			click_button 'Submit post'
			expect(page).to have_content(errors)
		end
	end

	context 'if logged out' do
		it 'display article form' do
			visit('/')
			fill_in 'title', with: "Super title"
			fill_in 'content', with: "Awesome content"
			click_button 'Submit post'
			expect(page).to have_content("bob")
		end
		
	end
end