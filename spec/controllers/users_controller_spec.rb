require 'spec_helper'

describe UsersController do

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new value to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    it "creates a new user with valid params" do
      expect{post :create, user: attributes_for(:user)}.to change(User, :count).by(1) 
    end
    it "renders #new with invalid params" do
      post :create, user: attributes_for(:invalid_user)
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      user = create(:user)
      get :edit, id: user
      expect(response).to render_template :edit
    end

    it "assigns user to @user" do 
      user = create(:user)
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end
  end

  describe "PATCH #update" do
    context "valid params" do
      it "updates the user in the DB" do
        @user = create(:user)
        patch :update, id: @user, user: attributes_for(:user, name: "asdf")
        @user.reload
        expect(@user.name).to eq('asdf')
      end
      it "redirects to root" do
        user = create(:user, name: 'billy')
        patch :edit, id: user, user: attributes_for(:user, name: 'johnny')
        expect(response).to render_template :edit
      end
    end

    context "invalid params" do
      it "does not update the DB" do
        @user = create(:user, name: "easterbunny")
        patch :update, id: @user, user: attributes_for(:user, name: nil)
        @user.reload
        expect(@user.name). to eq("easterbunny")
      end
      it "redirects to #edit" do
        @user = create(:user, name: "easterbunny")
        patch :update, id: @user, user: attributes_for(:user, name: nil)
        @user.reload
        expect(response).to render_template :edit
      end
    end
  end
end
