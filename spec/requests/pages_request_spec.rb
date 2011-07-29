require 'spec_helper'

describe "Request test" do
  it "should show faq site" do
    visit faq_path
    page.should have_content("Lorem ipsum!")
  end
  
  it "should show about site" do
    visit about_path
    page.should have_content("Welcome to Treashery.com!")
  end
  
  it "should show contact site" do
    visit contact_path
    page.should have_content("Contact with administrators")
  end
end