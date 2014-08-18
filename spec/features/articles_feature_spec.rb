require 'rails_helper'

describe 'can create an article' do
	context 'if logged out' do
		it 'do not display article form' do
			visit('/')
			fill_in 'article_title', with: "Super title"
			fill_in 'article_content', with: "Awesome content"
			click_button 'Submit post'
			expect(page).to have_content("need")
		end
	end

	context 'if logged in' do

	before(:each) do
		alex = User.create(
			 email: "a@a.com",
			 password: "123456789",
			 password_confirmation: "123456789")
		login_as("a@a.com", "123456789")
	end
		it 'display article form' do
			visit('/')
			fill_in 'article_title', with: "Super title"
			fill_in 'article_content', with: "Awesome content"
			click_button 'Submit post'
			expect(page).to have_content("Super title")
		end
	end

	context 'picture' do

		before(:each) do
		alex = User.create(
			 email: "a@a.com",
			 password: "123456789",
			 password_confirmation: "123456789")
		login_as("a@a.com", "123456789")

	end

		it 'can add a picture' do
			visit('/')
			fill_in 'article_title', with: "Super title"
			fill_in 'article_content', with: "Awesome content"
			attach_file 'article_picture', Rails.root.join('spec/images/Bob_razowski.png')
			click_button 'Submit post'
			expect(page).to have_content("Super title")
		end

	end
end