require 'rails_helper'

RSpec.describe Admin::HomeController, type: :controller do
  context "forbidden user" do
    describe "unauthenticated GET #index" do
      it "redirect to root path" do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end
    describe "unauthorized GET #index" do
      it "redirect to dashboard root path" do
        user = create(:user)
        sign_in user
        get :index
        expect(response).to redirect_to(dashboard_root_path)
      end
    end
  end

  context "admin user" do
    before(:each) do
      user = create(:admin)
      sign_in user
    end
    describe "GET #index" do
      it "responds successfully with an HTTP 300 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end
  end
end
