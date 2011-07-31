require 'spec_helper'

describe LocalitiesController do

  def valid_attributes
  {
    :name => "Locality test",
    :types => ['route', 'political'],
    :neLat => 22.0,
    :neLng => 23.0,
    :swLat => 24.0,
    :swLng => 25.0
  }
  end

  describe "GET index" do
    it "assigns all localities as @localities" do
      locality = Locality.create! valid_attributes
      get :index
      assigns(:localities).should eq([locality])
    end
  end

  describe "GET show" do
    it "assigns the requested locality as @locality" do
      locality = Locality.create! valid_attributes
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
      locality = Locality.create! valid_attributes
      get :edit, :id => locality.id.to_s
      assigns(:locality).should eq(locality)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Locality" do
        expect {
          post :create, :locality => valid_attributes
        }.to change(Locality, :count).by(1)
      end

      it "assigns a newly created locality as @locality" do
        post :create, :locality => valid_attributes
        assigns(:locality).should be_a(Locality)
        assigns(:locality).should be_persisted
      end

      it "redirects to the created locality" do
        post :create, :locality => valid_attributes
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
        locality = Locality.create! valid_attributes
        Locality.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => locality.id, :locality => {'these' => 'params'}
      end

      it "assigns the requested locality as @locality" do
        locality = Locality.create! valid_attributes
        put :update, :id => locality.id, :locality => valid_attributes
        assigns(:locality).should eq(locality)
      end

      it "redirects to the locality" do
        locality = Locality.create! valid_attributes
        put :update, :id => locality.id, :locality => valid_attributes
        response.should redirect_to(locality)
      end
    end

    describe "with invalid params" do
      it "assigns the locality as @locality" do
        locality = Locality.create! valid_attributes
        Locality.any_instance.stub(:save).and_return(false)
        put :update, :id => locality.id.to_s, :locality => {}
        assigns(:locality).should eq(locality)
      end

      it "re-renders the 'edit' template" do
        locality = Locality.create! valid_attributes
        Locality.any_instance.stub(:save).and_return(false)
        put :update, :id => locality.id.to_s, :locality => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested locality" do
      locality = Locality.create! valid_attributes
      expect {
        delete :destroy, :id => locality.id.to_s
      }.to change(Locality, :count).by(-1)
    end

    it "redirects to the localities list" do
      locality = Locality.create! valid_attributes
      delete :destroy, :id => locality.id.to_s
      response.should redirect_to(localities_url)
    end
  end

end
