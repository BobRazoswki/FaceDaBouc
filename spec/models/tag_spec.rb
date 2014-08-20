require 'rails_helper'

RSpec.describe Tag, :type => :model do

  describe '#tag_list=' do
		let(:article){ Article.create(title: "yataa")}

		context 'tags provided' do 
			it 'no tag' do
				article.tag_list=''
				expect(article.tags).to be_empty
			end
		end
	
		it 'has 1 tag' do
			article.tag_list='#bob'
			expect(article.tags.first.text).to eq('#bob')
		end

		it 'has x tag' do
			article.tag_list='#bob, #yata'
			expect(article.tags.count).to eq(2)
		end

		context 'with existing tags' do 
		  before {Tag.create(text: '#bob')}
			it 'reuses tag' do
				article.tag_list='#bob, #atchoum'
				expect(article.tags.count).to eq(2)
			end
		end
		
	end
end
