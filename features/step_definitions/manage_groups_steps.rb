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
  @group = Sorenson::Services::Group.find(Sorenson::Services::Group.all.first)
end

And /^I get all groups$/ do
  @groups = Sorenson::Services::Group.all
end

Then /^I delete the group if it was found$/ do
  @group.destroy if @group
end

Then /^I delete the group$/ do
  @group.destroy
end