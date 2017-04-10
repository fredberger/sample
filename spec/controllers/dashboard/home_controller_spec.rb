require 'rails_helper'

RSpec.describe Dashboard::HomeController, type: :controller do
  context "unauth user" do
    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end
  end

  context "authenticated user" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
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
