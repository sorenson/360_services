When /^I get all tags$/ do
  @tags = Sorenson::Services::Tag.all
end

Then /^the tag count should be "([^\"]*)"$/ do |count|
  Sorenson::Services::Tag.count.should == count.to_i
end

When /^I assign the (?:tag|tags) "([^\"]*)" to the asset$/ do |arg1|
  @tags = @asset.add_tags(arg1)
end

When /^I find all assets with the tag "([^\"]*)"$/ do |arg1|
  @assets = Sorenson::Services::Asset.find_all_by_tag(arg1)
end

When /^I get the tags for the asset$/ do
  @tags = @asset.tags
end

When /^I find the tag named "([^\"]*)"$/ do |name|
  @tag = Sorenson::Services::Tag.find(name)
end
