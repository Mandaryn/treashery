require 'spec_helper'

describe SpotsController do
  describe "GET index" do
    it "assigns all spots as @spots" do
      spot = Factory(:spot)
      get :index
      assigns(:spots).to_a.should eq([spot])
    end
  end

  describe "GET show" do
    it "assigns the requested spot as @spot" do
      spot = Factory(:spot)
      get :show, :id => spot.id.to_s
      assigns(:spot).should eq(spot)
    end
  end

  describe "GET new" do
    it "assigns a new spot as @spot" do
      get :new
      assigns(:spot).should be_a_new(Spot)
    end
  end

  describe "GET edit" do
    it "assigns the requested spot as @spot" do
      spot = Factory(:spot)
      get :edit, :id => spot.id.to_s
      assigns(:spot).should eq(spot)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Spot" do
        expect {
          post :create, :spot => Factory.attributes_for(:spot)
        }.to change(Spot, :count).by(1)
      end

      it "assigns a newly created spot as @spot" do
        post :create, :spot => Factory.attributes_for(:spot)
        assigns(:spot).should be_a(Spot)
        assigns(:spot).should be_persisted
      end

      it "redirects to the created spot" do
        post :create, :spot => Factory.attributes_for(:spot)
        response.should redirect_to(Spot.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved spot as @spot" do
        Spot.any_instance.stub(:save).and_return(false)
        post :create, :spot => {}
        assigns(:spot).should be_a_new(Spot)
      end

      it "re-renders the 'new' template" do
        Spot.any_instance.stub(:save).and_return(false)
        post :create, :spot => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested spot" do
        spot = Factory(:spot)
        Spot.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => spot.id, :spot => {'these' => 'params'}
      end

      it "assigns the requested spot as @spot" do
        spot = Factory(:spot)
        put :update, :id => spot.id, :spot => Factory.attributes_for(:spot)
        assigns(:spot).should eq(spot)
      end

      it "redirects to the spot" do
        spot = Factory(:spot)
        put :update, :id => spot.id, :spot => Factory.attributes_for(:spot)
        response.should redirect_to(spot)
      end
    end

    describe "with invalid params" do
      it "assigns the spot as @spot" do
        spot = Factory(:spot)
        Spot.any_instance.stub(:save).and_return(false)
        put :update, :id => spot.id.to_s, :spot => {}
        assigns(:spot).should eq(spot)
      end

      it "re-renders the 'edit' template" do
        spot = Factory(:spot)
        Spot.any_instance.stub(:save).and_return(false)
        put :update, :id => spot.id.to_s, :spot => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested spot" do
      spot = Factory(:spot)
      expect {
        delete :destroy, :id => spot.id.to_s
      }.to change(Spot, :count).by(-1)
    end

    it "redirects to the spots list" do
      spot = Factory(:spot)
      delete :destroy, :id => spot.id.to_s
      response.should redirect_to(spots_url)
    end
  end

end
