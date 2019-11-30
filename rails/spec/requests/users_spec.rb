require 'rails_helper'

RSpec.describe 'Users', type: :request do

  before do
    questions = create_list(:question, 5)
    creatures = create_list(:creature, 20)
    create_list(:user, 10).each do |user|
      questions.each do |question|
        create(:answer, user: user, question: question)
      end
      creatures.sample(rand(0..10)).each do |creature|
        create(:pet, user: user, creature: creature)
      end
    end
  end

  it 'displays users list' do
    get '/users'
    expect(response.content_type).to eq('text/html; charset=utf-8')
    expect(response).to have_http_status(:ok)
    expect(response.body).not_to be_empty
  end

  it 'outputs users CSV' do
    get '/users.csv'
    expect(response.content_type).to eq('text/csv')
    expect(response).to have_http_status(:ok)
    expect(response.body).not_to be_empty
  end

end