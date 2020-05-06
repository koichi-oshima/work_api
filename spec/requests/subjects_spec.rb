require 'rails_helper'

RSpec.describe "Subjects", type: :request do

  ## 変数定義
  # APIで設定するパラメータ
  # subjectsモデルに存在する値
  let (:keyword) { '統計' }
  # teacherモデルに存在する値
  let (:teacher_name) { '太郎' }
  # 存在しないデータ
  let (:test) { 'test' }
  # sunjectsモデルに存在する値
  let (:exist_subject) { '統計基礎' }
  # teacherモデルに存在する値
  let (:exist_teacher) { 'テスト太郎' }


  # APIのステータスコード確認
  # GET /api/v1/lectures?keyword=統計&teacher_name=太郎
  describe "#index" do
    context 'テーブルに存在するパラメータを渡す' do
      it "200が返ってくる" do
        get api_v1_lectures_path, params: { keyword: keyword, teacher_name: teacher_name }
        expect(response.status).to eq(200)
      end
    end
  end

  describe "response_bad_request" do
    context 'パラメータを空白にする' do
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
    end
  end

  describe "response_not_found" do
    context '存在しない値のパラメータを渡す' do
      it "404が返ってくる" do
        get api_v1_lectures_path, params: { keyword: test, teacher_name: test }
        expect(response).to have_http_status(404)
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

  # 取得したjsonの値の確認(部分一致検索)
  describe 'Subject.search' do
    context '2つパラメータを渡す' do
      it '対象のデータが返ってくること' do
        get api_v1_lectures_path, params: { keyword: keyword, teacher_name: teacher_name }
        json = JSON.parse(response.body)
        expect(json['subjects'][0]['teacher']['name']).to eq exist_teacher
        expect(json['subjects'][0]['title']).to eq exist_subject
      end

      it 'パラメータが取得した値に含まれていること' do
        get api_v1_lectures_path, params: { keyword: keyword, teacher_name: teacher_name }
        json = JSON.parse(response.body)
        expect(json['subjects'][0]['teacher']['name']).to include teacher_name
        expect(json['subjects'][0]['title']).to include keyword
      end
    end
  end

end
