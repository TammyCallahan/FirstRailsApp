require "rails_helper"

describe UsersController, type: :controller do
  let(:user) { User.create!(email: "hello@tammycallahan.com", password: "password") }
  let(:user2) { User.create!(email: "maya@tammycallahan.com", password: "12345678") }

  describe "GET #show" do
    context "when a user is logged in" do
      before do
        sign_in user
      end

      it "loads correct user details" do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end

    context "when a user is not logged in" do
      it "redirects to login" do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when a user tries to access info for another" do
      before do
        sign_in user
      end
      it "redirects to the root path" do
        get :show, params: { id: user2.id }
        expect(response).to redirect_to(root_path)
        expect(response).to have_http_status(302)
      end
    end
  end

end
