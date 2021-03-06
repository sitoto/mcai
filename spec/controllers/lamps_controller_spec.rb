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

describe LampsController do

  # This should return the minimal set of attributes required to create a valid
  # Lamp. As you add validations to Lamp, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "emaker" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LampsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all lamps as @lamps" do
      lamp = Lamp.create! valid_attributes
      get :index, {}, valid_session
      assigns(:lamps).should eq([lamp])
    end
  end

  describe "GET show" do
    it "assigns the requested lamp as @lamp" do
      lamp = Lamp.create! valid_attributes
      get :show, {:id => lamp.to_param}, valid_session
      assigns(:lamp).should eq(lamp)
    end
  end

  describe "GET new" do
    it "assigns a new lamp as @lamp" do
      get :new, {}, valid_session
      assigns(:lamp).should be_a_new(Lamp)
    end
  end

  describe "GET edit" do
    it "assigns the requested lamp as @lamp" do
      lamp = Lamp.create! valid_attributes
      get :edit, {:id => lamp.to_param}, valid_session
      assigns(:lamp).should eq(lamp)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Lamp" do
        expect {
          post :create, {:lamp => valid_attributes}, valid_session
        }.to change(Lamp, :count).by(1)
      end

      it "assigns a newly created lamp as @lamp" do
        post :create, {:lamp => valid_attributes}, valid_session
        assigns(:lamp).should be_a(Lamp)
        assigns(:lamp).should be_persisted
      end

      it "redirects to the created lamp" do
        post :create, {:lamp => valid_attributes}, valid_session
        response.should redirect_to(Lamp.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lamp as @lamp" do
        # Trigger the behavior that occurs when invalid params are submitted
        Lamp.any_instance.stub(:save).and_return(false)
        post :create, {:lamp => { "emaker" => "invalid value" }}, valid_session
        assigns(:lamp).should be_a_new(Lamp)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Lamp.any_instance.stub(:save).and_return(false)
        post :create, {:lamp => { "emaker" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested lamp" do
        lamp = Lamp.create! valid_attributes
        # Assuming there are no other lamps in the database, this
        # specifies that the Lamp created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Lamp.any_instance.should_receive(:update).with({ "emaker" => "MyString" })
        put :update, {:id => lamp.to_param, :lamp => { "emaker" => "MyString" }}, valid_session
      end

      it "assigns the requested lamp as @lamp" do
        lamp = Lamp.create! valid_attributes
        put :update, {:id => lamp.to_param, :lamp => valid_attributes}, valid_session
        assigns(:lamp).should eq(lamp)
      end

      it "redirects to the lamp" do
        lamp = Lamp.create! valid_attributes
        put :update, {:id => lamp.to_param, :lamp => valid_attributes}, valid_session
        response.should redirect_to(lamp)
      end
    end

    describe "with invalid params" do
      it "assigns the lamp as @lamp" do
        lamp = Lamp.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Lamp.any_instance.stub(:save).and_return(false)
        put :update, {:id => lamp.to_param, :lamp => { "emaker" => "invalid value" }}, valid_session
        assigns(:lamp).should eq(lamp)
      end

      it "re-renders the 'edit' template" do
        lamp = Lamp.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Lamp.any_instance.stub(:save).and_return(false)
        put :update, {:id => lamp.to_param, :lamp => { "emaker" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested lamp" do
      lamp = Lamp.create! valid_attributes
      expect {
        delete :destroy, {:id => lamp.to_param}, valid_session
      }.to change(Lamp, :count).by(-1)
    end

    it "redirects to the lamps list" do
      lamp = Lamp.create! valid_attributes
      delete :destroy, {:id => lamp.to_param}, valid_session
      response.should redirect_to(lamps_url)
    end
  end

end
