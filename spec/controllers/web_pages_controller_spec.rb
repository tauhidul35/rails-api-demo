require 'rails_helper'

RSpec.describe WebPagesController, type: :controller do
  let(:valid_attributes) do
    { url: 'http://example.com' }
  end

  let(:invalid_attributes) do
    { url: nil }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WebPagesController. As we have no authentication yet session set empty
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all web_pages as @web_pages' do
      web_page = WebPage.create! valid_attributes
      get :index, params: { web_page: valid_attributes }, session: valid_session
      expect(assigns(:web_pages)).to eq([web_page])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested web_page as @web_page' do
      web_page = WebPage.create! valid_attributes
      get :show, params: { id: web_page.to_param }, session: valid_session
      expect(assigns(:web_page)).to eq(web_page)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new WebPage' do
        expect do
          post :create, params: { web_page: valid_attributes }, session: valid_session
        end.to change(WebPage, :count).by(1)
      end

      it 'failed to create WebPage without url' do
        expect do
          post :create, params: { web_page: invalid_attributes }, session: valid_session
        end.to change(WebPage, :count).by(0)
      end

      it 'assigns a newly created web_page as @web_page' do
        post :create, params: { web_page: valid_attributes }, session: valid_session
        expect(assigns(:web_page)).to be_a(WebPage)
        expect(assigns(:web_page)).to be_persisted
      end

      it 'status created' do
        post :create, params: { web_page: valid_attributes }, session: valid_session
        expect(response.status).to eq 201
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved web_page as @web_page' do
        post :create, params: { web_page: invalid_attributes }, session: valid_session
        expect(assigns(:web_page)).to be_a_new(WebPage)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { url: 'http://example.com' }
      end

      it 'updates the requested web_page' do
        web_page = WebPage.create! valid_attributes
        put :update, params: { id: web_page.to_param, web_page: new_attributes }, session: valid_session
        web_page.reload
        expect(assigns(:web_page)).to eq(web_page)
      end

      it 'assigns the requested web_page as @web_page' do
        web_page = WebPage.create! valid_attributes
        put :update, params: { id: web_page.to_param, web_page: valid_attributes }, session: valid_session
        expect(assigns(:web_page)).to eq(web_page)
      end

      it 'responce after create' do
        web_page = WebPage.create! valid_attributes
        put :update, params: { id: web_page.to_param, web_page: valid_attributes }, session: valid_session
        expect(response.status).to eq 200
      end
    end

    context 'with invalid params' do
      it 'assigns the web_page as @web_page' do
        web_page = WebPage.create! valid_attributes
        put :update, params: { id: web_page.to_param, web_page: invalid_attributes }, session: valid_session
        expect(assigns(:web_page)).to eq(web_page)
      end

      it 'responce Unprocessable Entity' do
        web_page = WebPage.create! valid_attributes
        put :update, params: { id: web_page.to_param, web_page: invalid_attributes }, session: valid_session
        expect(response.status).to eq 422
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested web_page' do
      web_page = WebPage.create! valid_attributes
      expect do
        delete :destroy, params: { id: web_page.to_param }, session: valid_session
      end.to change(WebPage, :count).by(-1)
    end

    it 'responce after redirect' do
      web_page = WebPage.create! valid_attributes
      delete :destroy, params: { id: web_page.to_param }, session: valid_session
      expect(response.status).to eq 200
    end
  end
end
