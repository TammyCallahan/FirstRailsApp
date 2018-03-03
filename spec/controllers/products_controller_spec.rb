require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
  end

  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context 'GET #new' do
    before do
      sign_in @admin
    end

    it "renders new template when user is admin" do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end

  context 'GET #edit' do
    before do
      sign_in @admin
    end

    it "renders edit template when user is admin" do
      get :edit, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end
  end

  context 'POST #create' do
    it "creates valid product" do
      @product = FactoryBot.build(:product)
      post :create, params: { product: {id: @product.id, name: @product.name, description: @product.description, colour: @product.colour, price: @product.price} }
      expect(assigns(:product)).to be_a(Product)
      expect(response).to redirect_to product_path(assigns(:product))
    end

    it "won't create valid product with missing name" do
      @product = FactoryBot.build(:product, name: nil)
      post :create, params: { product: {id: @product.id, name: @product.name, description: @product.description, colour: @product.colour, price: @product.price} }
      expect(assigns(:product)).not_to be_valid
      expect(assigns(:product).errors).to_not be_empty
      expect(response).to be_ok #doesn't redirect, stays on page with error message
    end
  end

  context 'PUT #update' do
    it "updates a product" do
      @update = { name: "NEWname", id: @product.id}
      put :update, params: { id: @product.id, product: @update }
      @product.reload
      expect(@product.name).to eq "NEWname"
      expect(response).to redirect_to product_path(assigns(:product))
    end
  end

  context 'DELETE #destroy' do
    it "deletes a product" do
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to products_path
    end
  end
end
