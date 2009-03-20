require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CadumsController do

  def mock_cadum(stubs={})
    @mock_cadum ||= mock_model(Cadum, stubs)
  end
  
  describe "GET index" do

    it "exposes all cadums as @cadums" do
      Cadum.should_receive(:find).with(:all).and_return([mock_cadum])
      get :index
      assigns[:cadums].should == [mock_cadum]
    end

    describe "with mime type of xml" do
  
      it "renders all cadums as xml" do
        Cadum.should_receive(:find).with(:all).and_return(cadums = mock("Array of Cadums"))
        cadums.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested cadum as @cadum" do
      Cadum.should_receive(:find).with("37").and_return(mock_cadum)
      get :show, :id => "37"
      assigns[:cadum].should equal(mock_cadum)
    end
    
    describe "with mime type of xml" do

      it "renders the requested cadum as xml" do
        Cadum.should_receive(:find).with("37").and_return(mock_cadum)
        mock_cadum.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new cadum as @cadum" do
      Cadum.should_receive(:new).and_return(mock_cadum)
      get :new
      assigns[:cadum].should equal(mock_cadum)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested cadum as @cadum" do
      Cadum.should_receive(:find).with("37").and_return(mock_cadum)
      get :edit, :id => "37"
      assigns[:cadum].should equal(mock_cadum)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created cadum as @cadum" do
        Cadum.should_receive(:new).with({'these' => 'params'}).and_return(mock_cadum(:save => true))
        post :create, :cadum => {:these => 'params'}
        assigns(:cadum).should equal(mock_cadum)
      end

      it "redirects to the created cadum" do
        Cadum.stub!(:new).and_return(mock_cadum(:save => true))
        post :create, :cadum => {}
        response.should redirect_to(cadum_url(mock_cadum))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved cadum as @cadum" do
        Cadum.stub!(:new).with({'these' => 'params'}).and_return(mock_cadum(:save => false))
        post :create, :cadum => {:these => 'params'}
        assigns(:cadum).should equal(mock_cadum)
      end

      it "re-renders the 'new' template" do
        Cadum.stub!(:new).and_return(mock_cadum(:save => false))
        post :create, :cadum => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested cadum" do
        Cadum.should_receive(:find).with("37").and_return(mock_cadum)
        mock_cadum.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cadum => {:these => 'params'}
      end

      it "exposes the requested cadum as @cadum" do
        Cadum.stub!(:find).and_return(mock_cadum(:update_attributes => true))
        put :update, :id => "1"
        assigns(:cadum).should equal(mock_cadum)
      end

      it "redirects to the cadum" do
        Cadum.stub!(:find).and_return(mock_cadum(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(cadum_url(mock_cadum))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested cadum" do
        Cadum.should_receive(:find).with("37").and_return(mock_cadum)
        mock_cadum.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cadum => {:these => 'params'}
      end

      it "exposes the cadum as @cadum" do
        Cadum.stub!(:find).and_return(mock_cadum(:update_attributes => false))
        put :update, :id => "1"
        assigns(:cadum).should equal(mock_cadum)
      end

      it "re-renders the 'edit' template" do
        Cadum.stub!(:find).and_return(mock_cadum(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested cadum" do
      Cadum.should_receive(:find).with("37").and_return(mock_cadum)
      mock_cadum.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the cadums list" do
      Cadum.stub!(:find).and_return(mock_cadum(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(cadums_url)
    end

  end

end
