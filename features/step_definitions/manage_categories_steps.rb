When /^I get the category$/ do
  @category = @asset.category
end

When /^I assign the category "([^\"]*)" to the asset$/ do |name|
  @category = @asset.add_category(name)
end

When /^I remove the category from the asset$/ do
  @asset.remove_category
end

Then /^the asset should not have a category$/ do
  @asset.category.should be_nil
end

Then /^the asset category should be "([^\"]*)"$/ do |arg1|
  @asset.category.should == arg1
end

When /^I create a category named "([^\"]*)"$/ do |name|
  @category = Sorenson::Services::Category.create(name)
end

And /^I get all categories$/ do
  @categories = Sorenson::Services::Category.all
end

When /^I find the category named "([^\"]*)"$/ do |name|
  @category = Sorenson::Services::Category.find_by_name(name)
  @category.should_not be_nil
end

And /^I save the category$/ do
  @category.save
end

Then /^the parent of the category should be "([^\"]*)"$/ do |name|
  @category.parent.should == name
end

When /^I delete the category$/ do
  @category.destroy
end

When /^I get the category assets$/ do
  @assets = @category.assets
end

Then /^the assets list should contain the asset$/ do
  @assets.should include(@asset.id)
end

And /^I get the root categories$/ do
  @categories = Sorenson::Services::Category.all_roots
end
