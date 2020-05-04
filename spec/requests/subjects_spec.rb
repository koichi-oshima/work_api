require 'rails_helper'

RSpec.describe "Subjects", type: :request do
  describe "GET /api/v1/lectures?keyword=統計基礎&teacher_name=太郎" do
    #before do
    #  @user = FactoryBot.create(:name, { name: "太郎"})
    #end

    it "200が返ってくる" do
      post = create(:post, title: 'test-title')

      get "/api/v1/lectures?keyword=" + @user[:keyword].to_s + "&teacher_name=" + @user[:name].to_s
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it "取得したデータのnameが山田太郎" do
      expect(@json["name"]).to eq "山田太郎"
    end
  end
end
