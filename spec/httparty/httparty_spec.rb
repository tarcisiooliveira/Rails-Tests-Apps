require 'rails_helper'

describe 'HTTParty' do 
	##Webmock desabilita requisições reais em ambiente de teste
	# it 'HTTParty' do
	# 	response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
	# 	content_type = response.headers['content-type']
	# 	puts content_type
	# 	expect(content_type).to match(/application\/json/)
	# end

	it 'content-type with web-mock' do
		stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/2').
			to_return(status: 200, body: '', headers: {'content-type'=>'application/json'})
		response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
		content_type = response.headers['content-type']
		expect(content_type).to match(/application\/json/)
	end
end