require 'rails_helper'

RSpec.describe MediaController, type: :controller do

  describe "media#edit action" do
    it "should successfully show the edit form if the medium is found" do
      medium = FactoryBot.create(:medium)
      get :edit, params: { id: medium.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error message if the medium is not found" do
      get :edit, params: { id: 'UNICORN' }
      expect(response).to have_http_status(:not_found)
    end
  end


  describe "media#show action" do
    it "should successfully show the page if the medium is found" do
      medium = FactoryBot.create(:medium)
      get :show, params: { id: medium.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the medium is not found" do
      get :show, params: { id: 'CUTIEPIE' }
      expect(response).to have_http_status(:not_found)
    end
  end


  describe "media#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "media#new action" do
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new form" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end
  describe "media#create action" do

    it "should require users to be logged in" do
      post :create, params: { medium: { title: "New Book" } }
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully create a new medium in our database" do
      user = FactoryBot.create(:user) 
      sign_in user


      post :create, params: { medium: { title: 'New Book' } }
      expect(response).to redirect_to root_path

      medium = Medium.last
      expect(medium.title).to eq("New Book")
      expect(medium.user).to eq(user)
    end


    it "should properly deal with validation errors" do
      user = FactoryBot.create(:user)
      sign_in user

      medium_count = Medium.count
      post :create, params: { medium: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Medium.count).to eq Medium.count
    end
  end
end
