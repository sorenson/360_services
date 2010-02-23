When /^I get all flags$/ do
  @flags = Sorenson::Services::Flag.all
end

Then /^the flag count should be "(.*)"$/ do |count|
  Sorenson::Services::Flag.count.should == count.to_i
end

And /^I assign the (?:flag|flags) "([^\"]*)" to the asset$/ do |arg1|
  @flags = @asset.add_flags(arg1)
end

And /^I find all assets with the flag "([^\"]*)"$/ do |arg1|
  @assets = Sorenson::Services::Asset.find_all_by_flag(arg1)
end

And /^I get the flags for the asset$/ do
  @tags = @asset.flags
end
