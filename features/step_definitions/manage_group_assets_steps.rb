When /^I add the asset to the group$/ do
  @group.add_asset(@asset)
end

Then /^the asset should be in the group$/ do
  @group.assets.should include(@asset.id)
end

Then /^the asset should have the group$/ do
  @asset.groups.should include(@group.id)
end

Then /^the group should have the asset$/ do
  @group.assets.should include(@asset.id) # express the regexp above with the code you wish you had
end
