require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/goals/edit.html.erb" do
  include GoalsHelper

  before(:each) do
    assigns[:goals] = @goals = stub_model(Goals,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit goals form" do
    render

    response.should have_tag("form[action=#{goals_path(@goals)}][method=post]") do
      with_tag('input#goals_name[name=?]', "goals[name]")
    end
  end
end
