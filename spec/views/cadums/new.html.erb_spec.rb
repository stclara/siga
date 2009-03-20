require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cadums/new.html.erb" do
  include CadumsHelper
  
  before(:each) do
    assigns[:cadum] = stub_model(Cadum,
      :new_record? => true,
      :name => "value for name",
      :sex => "value for sex",
      :marital_status => "value for marital_status",
      :birthplace => "value for birthplace",
      :time_residence => "value for time_residence",
      :profession => "value for profession",
      :income => 1,
      :housing => "value for housing",
      :type_housing => "value for type_housing",
      :type_house => "value for type_house",
      :room => 1,
      :revenue => 1,
      :habitantes => 1
    )
  end

  it "renders new cadum form" do
    render
    
    response.should have_tag("form[action=?][method=post]", cadums_path) do
      with_tag("input#cadum_name[name=?]", "cadum[name]")
      with_tag("input#cadum_sex[name=?]", "cadum[sex]")
      with_tag("input#cadum_marital_status[name=?]", "cadum[marital_status]")
      with_tag("input#cadum_birthplace[name=?]", "cadum[birthplace]")
      with_tag("input#cadum_time_residence[name=?]", "cadum[time_residence]")
      with_tag("input#cadum_profession[name=?]", "cadum[profession]")
      with_tag("input#cadum_income[name=?]", "cadum[income]")
      with_tag("input#cadum_housing[name=?]", "cadum[housing]")
      with_tag("input#cadum_type_housing[name=?]", "cadum[type_housing]")
      with_tag("input#cadum_type_house[name=?]", "cadum[type_house]")
      with_tag("input#cadum_room[name=?]", "cadum[room]")
      with_tag("input#cadum_revenue[name=?]", "cadum[revenue]")
      with_tag("input#cadum_habitantes[name=?]", "cadum[habitantes]")
    end
  end
end


