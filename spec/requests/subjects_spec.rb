require 'rails_helper'

RSpec.describe "Subjects", type: :request do
  let (:keyword) { '統計基礎' }
  let (:teacher_name) { '太郎' }
  let (:test) { 'test' }


  describe "GET /api/v1/lectures?keyword=統計基礎&teacher_name=太郎" do

    it "200が返ってくる" do
      get api_v1_lectures_path, params: { keyword: keyword, teacher_name: teacher_name }
      expect(response).to have_http_status(200)
    end

    it "400が返ってくる" do
      get api_v1_lectures_path, params: { keyword: keyword, teacher_name:"" }
      expect(response).to have_http_status(400)
    end

    it "400が返ってくる" do
      get api_v1_lectures_path, params: { keyword: "", teacher_name: teacher_name }
      expect(response).to have_http_status(400)
    end

    it "400が返ってくる" do
      get api_v1_lectures_path, params: { keyword: "", teacher_name:"" }
      expect(response).to have_http_status(400)
    end

    it "404が返ってくる" do
      get api_v1_lectures_path, params: { keyword: keyword, teacher_name: test }
      expect(response).to have_http_status(404)
    end

    it "404が返ってくる" do
      get api_v1_lectures_path, params: { keyword: test, teacher_name: teacher_name }
      expect(response).to have_http_status(404)
    end


  end
end
