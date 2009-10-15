require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/goals/show.html.erb" do
  include GoalsHelper
  before(:each) do
    assigns[:goals] = @goals = stub_model(Goals,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end
