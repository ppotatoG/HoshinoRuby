require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  describe 'GET /api/users' do
    it 'returns a list of users' do
      # 테스트 디비 작성
      User.create(name: 'John', email: 'john@example.com')
      User.create(name: 'Jane', email: 'jane@example.com')

      # GET
      get '/api/users'

      # 응답 상태
      expect(response).to have_http_status(200)

      # JSON 으로 파싱 후 데이터의 길이와 0번째 데이터의 이름을 확인
      users = JSON.parse(response.body)
      expect(users).to be_an(Array)
      expect(users.length).to eq(2)
      expect(users.first['name']).to eq('John')
    end
  end
end