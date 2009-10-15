require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/goals/index.html.erb" do
  include GoalsHelper

  before(:each) do
    assigns[:goals] = [
      stub_model(Goals,
        :name => "value for name"
      ),
      stub_model(Goals,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of goals" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
