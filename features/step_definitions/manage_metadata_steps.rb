When /^the asset metadata value for "([^\"]*)" should be "([^\"]*)"$/ do |key, value|
  @asset.get_metadata_value(key).should == value
end

When /^I add the metadata "([^\"]*)" with the value "([^\"]*)" to the asset$/ do |key, value|
  @asset.set_metadata(key, value)
end

When /^I delete the metadata key "([^\"]*)"$/ do |key|
  data = @asset.delete_metadata(key)
  data['status'] if data
end

Then /^the asset should not have a metadata value for "([^\"]*)"$/ do |key|
  @asset.get_metadata_value(key).should == nil
end

And /^I get all the metadata for the asset$/ do
  @metadata = @asset.metadata
end

Then /^the metadata list should include "([^\"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the metadata for the asset should contain "([^\"]*)"$/ do |keyvalue|
  values = keyvalue.split("=")
  @metadata[values[0]].should == values[1]
end