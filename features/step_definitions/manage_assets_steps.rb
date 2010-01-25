When "I get all assets" do
  @assets = Sorenson::Services::Asset.all
end

And /^I get the asset with id "([^\"]*)"$/ do |arg1|
  @asset = Sorenson::Services::Asset.find(arg1)
end

And "I get the first asset" do
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
end

Then /^the asset count should be "([^\"]*)"$/ do |arg1|
  Sorenson::Services::Asset.count.should == arg1.to_i
end

And /^I create an asset$/ do
  pending # express the regexp above with the code you wish you had
end

And /^I delete the asset$/ do
  @asset.destroy
end

Then /^the asset list should not include the asset$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the preset xml should contain "([^\"]*)"$/ do |arg1|
  @asset.preset_xml.should include(arg1)
end

When /^I deactivate the asset$/ do
  @asset.deactivate
end

When /^I activate the asset$/ do
  @asset.activate
end

When /^I undelete the asset$/ do
  @asset.activate
end

When /^I save the asset$/ do
  @asset.save
end

When /^I reload the asset$/ do
  @asset = Sorenson::Services::Asset.find(@asset.id)
end

Then /^I get the embed codes$/ do
  @embed_codes = @asset.embed_codes
end

Then /^the asset embed codes should contain "([^\"]*)"$/ do |value|
  @asset.embed_codes.each do |embed_code|
    embed_code.should include(value)
  end
end
