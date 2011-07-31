require 'spec_helper'

describe LocalitiesController do

  describe "GET index" do
    it "assigns all localities as @localities" do
      locality = Factory(:locality)
      get :index
      assigns(:localities).should eq([locality])
    end
  end

  describe "GET show" do
    it "assigns the requested locality as @locality" do
      locality = Factory(:locality)
      get :show, :id => locality.id.to_s
      assigns(:locality).should eq(locality)
    end
  end

  describe "GET new" do
    it "assigns a new locality as @locality" do
      get :new
      assigns(:locality).should be_a_new(Locality)
    end
  end

  describe "GET edit" do
    it "assigns the requested locality as @locality" do
      locality = Factory(:locality)
      get :edit, :id => locality.id.to_s
      assigns(:locality).should eq(locality)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Locality" do
        expect {
          post :create, :locality => Factory.attributes_for(:locality)
        }.to change(Locality, :count).by(1)
      end

      it "assigns a newly created locality as @locality" do
        post :create, :locality => Factory.attributes_for(:locality)
        assigns(:locality).should be_a(Locality)
        assigns(:locality).should be_persisted
      end

      it "redirects to the created locality" do
        post :create, :locality => Factory.attributes_for(:locality)
        response.should redirect_to(Locality.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved locality as @locality" do
        Locality.any_instance.stub(:save).and_return(false)
        post :create, :locality => {}
        assigns(:locality).should be_a_new(Locality)
      end

      it "re-renders the 'new' template" do
        Locality.any_instance.stub(:save).and_return(false)
        post :create, :locality => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested locality" do
        locality = Factory(:locality)
        Locality.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => locality.id, :locality => {'these' => 'params'}
      end

      it "assigns the requested locality as @locality" do
        locality = Factory(:locality)
        put :update, :id => locality.id, :locality => Factory.attributes_for(:locality)
        assigns(:locality).should eq(locality)
      end

      it "redirects to the locality" do
        locality = Factory(:locality)
        put :update, :id => locality.id, :locality => Factory.attributes_for(:locality)
        response.should redirect_to(locality)
      end
    end

    describe "with invalid params" do
      it "assigns the locality as @locality" do
        locality = Factory(:locality)
        Locality.any_instance.stub(:save).and_return(false)
        put :update, :id => locality.id.to_s, :locality => {}
        assigns(:locality).should eq(locality)
      end

      it "re-renders the 'edit' template" do
        locality = Factory(:locality)
        Locality.any_instance.stub(:save).and_return(false)
        put :update, :id => locality.id.to_s, :locality => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested locality" do
      locality = Factory(:locality)
      expect {
        delete :destroy, :id => locality.id.to_s
      }.to change(Locality, :count).by(-1)
    end

    it "redirects to the localities list" do
      locality = Factory(:locality)
      delete :destroy, :id => locality.id.to_s
      response.should redirect_to(localities_url)
    end
  end

end
