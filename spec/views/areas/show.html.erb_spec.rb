require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/areas/show.html.erb" do
  include AreasHelper
  before(:each) do
    assigns[:area] = @area = stub_model(Area,
      :name => "value for name",
      :kind => "value for kind",
      :geom => 
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ kind/)
    response.should have_text(//)
  end
end

