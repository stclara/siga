require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CadumsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "cadums", :action => "index").should == "/cadums"
    end
  
    it "maps #new" do
      route_for(:controller => "cadums", :action => "new").should == "/cadums/new"
    end
  
    it "maps #show" do
      route_for(:controller => "cadums", :action => "show", :id => "1").should == "/cadums/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "cadums", :action => "edit", :id => "1").should == "/cadums/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "cadums", :action => "create").should == {:path => "/cadums", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "cadums", :action => "update", :id => "1").should == {:path =>"/cadums/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "cadums", :action => "destroy", :id => "1").should == {:path =>"/cadums/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/cadums").should == {:controller => "cadums", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/cadums/new").should == {:controller => "cadums", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/cadums").should == {:controller => "cadums", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/cadums/1").should == {:controller => "cadums", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/cadums/1/edit").should == {:controller => "cadums", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/cadums/1").should == {:controller => "cadums", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/cadums/1").should == {:controller => "cadums", :action => "destroy", :id => "1"}
    end
  end
end
