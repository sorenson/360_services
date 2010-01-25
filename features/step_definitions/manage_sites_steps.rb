When /^I create a new site with the name "([^\"]*)" and the description "([^\"]*)"$/ do |name, description|
  Sorenson::Services::Site.create(name, :description => description)
end

And /^I get all sites$/ do
  @sites = Sorenson::Services::Site.all
end

And /^I get the site named "([^\"]*)"$/ do |name|
  @site = Sorenson::Services::Site.find_by_name(name)
end

Then /^the site should have an id$/ do
  @site.id.should == '5'
end