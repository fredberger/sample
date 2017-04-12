require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  context "admin users" do
    before(:each) do
      @user = create(:admin)
      sign_in @user
    end
    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template(:index)
      end

      it "assigns all users" do
        get :index
        expect(assigns(:users)).to eq(User.all)
      end
    end
    describe "GET #show" do
      it "responds successfully with an HTTP 200 status code" do
        get :show, params: { id: @user }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the show template" do
        get :show, params: { id: @user }
        expect(response).to render_template(:show)
      end

      it "assigns user" do
        get :show, params: { id: @user }
        expect(assigns(:user)).to eq(@user)
      end
    end
    describe "GET #new" do
      it "responds successfully with an HTTP 200 status code" do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the new template" do
        get :new
        expect(response).to render_template(:new)
      end

      it "assigns new user" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end
    end
    describe "POST #create" do
      it "save user" do
        expect {
          post :create, user: { name: "Test", email: "test@example.org", password: "password" }
        }.to change(User, :count).by(1)
        expect(response).to redirect_to(admin_users_path)
      end
      it "dont save, email blank" do
        expect {
          post :create, user: { name: "Test", password: "password" }
        }.to_not change(User, :count)
        expect(response).to render_template(:new)
      end
    end
    describe "GET #edit" do
      it "responds successfully with an HTTP 200 status code" do
        get :edit, params: { id: @user }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the edit template" do
        get :edit, params: { id: @user }
        expect(response).to render_template(:edit)
      end

      it "assign user" do
        get :edit, params: { id: @user }
        expect(assigns(:user)).to eq(@user)
      end
    end
    describe "PUT #update" do
      it "save user" do
        put :update, id: @user, user: { email: "new_email@example.com" }
        expect(assigns(:user)).to eq(@user)
        @user.reload
        expect(@user.email).to eq("new_email@example.com")
        expect(response).to redirect_to(admin_user_path(@user))
      end
      it "dont save, email blank" do
        put :update, id: @user, user: { email: "" }
        @user.reload
        expect(@user.email).to eq(@user.email)
        expect(response).to render_template(:edit)
      end
    end
  end
end
