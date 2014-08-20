require 'rails_helper'

describe 'tags' do

	before(:each) do
		alex = User.create(
			 email: "a@a.com",
			 password: "123456789",
			 password_confirmation: "123456789")
		login_as("a@a.com", "123456789")
	end 

	it 'display a tag under the link' do
		visit('/')
		fill_in 'article_tag_list', with: '#swag'
		click_button 'Submit post'
		expect(page).to have_link("#swag")
	end

	context 'clickable hashtags' do
		before(:each) do 
			post1 = Article.create(title: '1', tag_list: '#hash, #yolo')
			post2 = Article.create(title: '2', tag_list: '#hash')
		end

		it 'visit a dedicated page for this hashtag' do
			visit('/')
			click_link '#yolo'
			expect(page).to have_content('Articles with this hashtag:')
		end

		it 'go to a pretty url' do
			visit('/tags/hash')
			expect(page).to have_content('Articles with this hashtag:')
		end
	end

end