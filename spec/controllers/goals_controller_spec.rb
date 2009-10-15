require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GoalsController do

  def mock_goals(stubs={})
    @mock_goals ||= mock_model(Goals, stubs)
  end

  describe "GET index" do
    it "assigns all goals as @goals" do
      Goals.stub!(:find).with(:all).and_return([mock_goals])
      get :index
      assigns[:goals].should == [mock_goals]
    end
  end

  describe "GET show" do
    it "assigns the requested goals as @goals" do
      Goals.stub!(:find).with("37").and_return(mock_goals)
      get :show, :id => "37"
      assigns[:goals].should equal(mock_goals)
    end
  end

  describe "GET new" do
    it "assigns a new goals as @goals" do
      Goals.stub!(:new).and_return(mock_goals)
      get :new
      assigns[:goals].should equal(mock_goals)
    end
  end

  describe "GET edit" do
    it "assigns the requested goals as @goals" do
      Goals.stub!(:find).with("37").and_return(mock_goals)
      get :edit, :id => "37"
      assigns[:goals].should equal(mock_goals)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created goals as @goals" do
        Goals.stub!(:new).with({'these' => 'params'}).and_return(mock_goals(:save => true))
        post :create, :goals => {:these => 'params'}
        assigns[:goals].should equal(mock_goals)
      end

      it "redirects to the created goals" do
        Goals.stub!(:new).and_return(mock_goals(:save => true))
        post :create, :goals => {}
        response.should redirect_to(goal_url(mock_goals))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved goals as @goals" do
        Goals.stub!(:new).with({'these' => 'params'}).and_return(mock_goals(:save => false))
        post :create, :goals => {:these => 'params'}
        assigns[:goals].should equal(mock_goals)
      end

      it "re-renders the 'new' template" do
        Goals.stub!(:new).and_return(mock_goals(:save => false))
        post :create, :goals => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested goals" do
        Goals.should_receive(:find).with("37").and_return(mock_goals)
        mock_goals.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :goals => {:these => 'params'}
      end

      it "assigns the requested goals as @goals" do
        Goals.stub!(:find).and_return(mock_goals(:update_attributes => true))
        put :update, :id => "1"
        assigns[:goals].should equal(mock_goals)
      end

      it "redirects to the goals" do
        Goals.stub!(:find).and_return(mock_goals(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(goal_url(mock_goals))
      end
    end

    describe "with invalid params" do
      it "updates the requested goals" do
        Goals.should_receive(:find).with("37").and_return(mock_goals)
        mock_goals.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :goals => {:these => 'params'}
      end

      it "assigns the goals as @goals" do
        Goals.stub!(:find).and_return(mock_goals(:update_attributes => false))
        put :update, :id => "1"
        assigns[:goals].should equal(mock_goals)
      end

      it "re-renders the 'edit' template" do
        Goals.stub!(:find).and_return(mock_goals(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested goals" do
      Goals.should_receive(:find).with("37").and_return(mock_goals)
      mock_goals.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the goals list" do
      Goals.stub!(:find).and_return(mock_goals(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(goals_url)
    end
  end

end
