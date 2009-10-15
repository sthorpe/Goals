require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GoalsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "goals", :action => "index").should == "/goals"
    end

    it "maps #new" do
      route_for(:controller => "goals", :action => "new").should == "/goals/new"
    end

    it "maps #show" do
      route_for(:controller => "goals", :action => "show", :id => "1").should == "/goals/1"
    end

    it "maps #edit" do
      route_for(:controller => "goals", :action => "edit", :id => "1").should == "/goals/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "goals", :action => "create").should == {:path => "/goals", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "goals", :action => "update", :id => "1").should == {:path =>"/goals/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "goals", :action => "destroy", :id => "1").should == {:path =>"/goals/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/goals").should == {:controller => "goals", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/goals/new").should == {:controller => "goals", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/goals").should == {:controller => "goals", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/goals/1").should == {:controller => "goals", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/goals/1/edit").should == {:controller => "goals", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/goals/1").should == {:controller => "goals", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/goals/1").should == {:controller => "goals", :action => "destroy", :id => "1"}
    end
  end
end
