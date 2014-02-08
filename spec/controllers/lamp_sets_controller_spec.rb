require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe LampSetsController do

  # This should return the minimal set of attributes required to create a valid
  # LampSet. As you add validations to LampSet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LampSetsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all lamp_sets as @lamp_sets" do
      lamp_set = LampSet.create! valid_attributes
      get :index, {}, valid_session
      assigns(:lamp_sets).should eq([lamp_set])
    end
  end

  describe "GET show" do
    it "assigns the requested lamp_set as @lamp_set" do
      lamp_set = LampSet.create! valid_attributes
      get :show, {:id => lamp_set.to_param}, valid_session
      assigns(:lamp_set).should eq(lamp_set)
    end
  end

  describe "GET new" do
    it "assigns a new lamp_set as @lamp_set" do
      get :new, {}, valid_session
      assigns(:lamp_set).should be_a_new(LampSet)
    end
  end

  describe "GET edit" do
    it "assigns the requested lamp_set as @lamp_set" do
      lamp_set = LampSet.create! valid_attributes
      get :edit, {:id => lamp_set.to_param}, valid_session
      assigns(:lamp_set).should eq(lamp_set)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LampSet" do
        expect {
          post :create, {:lamp_set => valid_attributes}, valid_session
        }.to change(LampSet, :count).by(1)
      end

      it "assigns a newly created lamp_set as @lamp_set" do
        post :create, {:lamp_set => valid_attributes}, valid_session
        assigns(:lamp_set).should be_a(LampSet)
        assigns(:lamp_set).should be_persisted
      end

      it "redirects to the created lamp_set" do
        post :create, {:lamp_set => valid_attributes}, valid_session
        response.should redirect_to(LampSet.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lamp_set as @lamp_set" do
        # Trigger the behavior that occurs when invalid params are submitted
        LampSet.any_instance.stub(:save).and_return(false)
        post :create, {:lamp_set => { "name" => "invalid value" }}, valid_session
        assigns(:lamp_set).should be_a_new(LampSet)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        LampSet.any_instance.stub(:save).and_return(false)
        post :create, {:lamp_set => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested lamp_set" do
        lamp_set = LampSet.create! valid_attributes
        # Assuming there are no other lamp_sets in the database, this
        # specifies that the LampSet created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        LampSet.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => lamp_set.to_param, :lamp_set => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested lamp_set as @lamp_set" do
        lamp_set = LampSet.create! valid_attributes
        put :update, {:id => lamp_set.to_param, :lamp_set => valid_attributes}, valid_session
        assigns(:lamp_set).should eq(lamp_set)
      end

      it "redirects to the lamp_set" do
        lamp_set = LampSet.create! valid_attributes
        put :update, {:id => lamp_set.to_param, :lamp_set => valid_attributes}, valid_session
        response.should redirect_to(lamp_set)
      end
    end

    describe "with invalid params" do
      it "assigns the lamp_set as @lamp_set" do
        lamp_set = LampSet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LampSet.any_instance.stub(:save).and_return(false)
        put :update, {:id => lamp_set.to_param, :lamp_set => { "name" => "invalid value" }}, valid_session
        assigns(:lamp_set).should eq(lamp_set)
      end

      it "re-renders the 'edit' template" do
        lamp_set = LampSet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LampSet.any_instance.stub(:save).and_return(false)
        put :update, {:id => lamp_set.to_param, :lamp_set => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested lamp_set" do
      lamp_set = LampSet.create! valid_attributes
      expect {
        delete :destroy, {:id => lamp_set.to_param}, valid_session
      }.to change(LampSet, :count).by(-1)
    end

    it "redirects to the lamp_sets list" do
      lamp_set = LampSet.create! valid_attributes
      delete :destroy, {:id => lamp_set.to_param}, valid_session
      response.should redirect_to(lamp_sets_url)
    end
  end

end