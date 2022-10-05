require 'rails_helper'

describe 'HTTParty' do
  # Webmock desabilita requisições reais em ambiente de teste

  # it 'HTTParty' do
  #   response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
  #   content_type = response.headers['content-type']
  #   puts content_type
  #   expect(content_type).to match(/application\/json/)
  # end

  # it 'content-type with web-mock' do
  #   stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/2').
  #     to_return(status: 200, body: '', headers: {'content-type'=>'application/json'})
  #   response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
  #   content_type = response.headers['content-type']
  #   expect(content_type).to match(/application\/json/)
  # end

  it 'content-type with VCR' do
    VCR.use_cassette('jsonplaceholder/posts') do
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
      content_type = response.headers['content-type']
      expect(content_type).to match(/application\/json/)
    end
  end

  #O nomde do cassete será o nome do teste descrito no it
  it 'content-type with VCR - it define the name', :vcr do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end

  # Passando o cassete_name, o VCR irá usar cassettes já gravados.
  it 'content-type with VCR already recorded', vcr: { cassette_name: 'jsonplaceholder/posts'} do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end
end
