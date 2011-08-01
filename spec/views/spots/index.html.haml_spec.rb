#encoding: utf-8
require 'spec_helper'

describe "spots/index.html.haml" do
  before do
    assign(:spots, [Factory.stub(:spot, name: 'Śmieci'), Factory.stub(:spot, name: 'Wrak')])
  end

  it "renders a list of spots" do
    render
    rendered.should match(/Śmieci/)
    rendered.should match(/Wrak/)
  end
end