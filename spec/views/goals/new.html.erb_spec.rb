require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/goals/new.html.erb" do
  include GoalsHelper

  before(:each) do
    assigns[:goals] = stub_model(Goals,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new goals form" do
    render

    response.should have_tag("form[action=?][method=post]", goals_path) do
      with_tag("input#goals_name[name=?]", "goals[name]")
    end
  end
end
