When /^I add the asset to the group$/ do
  @group.add_asset(@asset)
end

Then /^the asset should be in the group$/ do
  @group.assets.map(&:id).should include(@asset.id)
end

Then /^the asset should have the group$/ do
  @asset.group.guid.should == @group.guid
  @asset.group.name.should == @group.name
end

Then /^the group should have the asset$/ do
  @group.assets.map(&:id).should include(@asset.id)
end
