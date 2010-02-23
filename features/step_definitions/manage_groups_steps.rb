And /^I find the group with the name "([^\"]*)"$/ do |name|
  @group = Sorenson::Services::Group.find_by_name(name)
end

When /^I create a group named "([^\"]*)"$/ do |name|
  @group = Sorenson::Services::Group.create(name)
end

When /^I reload the group$/ do
  @group = Sorenson::Services::Group.find(@group.id)
end

Then /^I should be able to find the group$/ do
  @group = Sorenson::Services::Group.find(@group.id)
end

Then /^the group's name should be "(.*)"/ do |name|
  @group.name.should == name
end

And /^I get all groups$/ do
  @groups = Sorenson::Services::Group.all
end

Then /^I delete the group if it was found$/ do
  @group.delete if @group
end

Then /^I delete the group$/ do
  @group.delete
end

Then /^the group list should contain the group$/ do
  @groups.include?(@group)
end