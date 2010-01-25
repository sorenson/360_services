Then "show me the $object" do |object|
  raise instance_variable_get("@#{object}").inspect
end

Then /^the ([^\"]*) list should contain "([^\"]*)"$/ do |object, value|
  instance_variable_get("@#{object}").should include(value)
end

Then /^the ([^\"]*) list should not contain "([^\"]*)"$/ do |object, arg1|
  instance_variable_get("@#{object}").should_not include(arg1)
end

# the group attribute "name" should be "George"
Then /^the ([^\"]*) attribute "([^\"]*)" should be "([^\"]*)"$/ do |object, field, arg1|
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1
end

When /^I change the ([^\"]*) attribute "([^\"]*)" to "([^\"]*)"$/ do |object, field, value|
  instance_variable_get("@#{text_to_variable(object)}").send("#{text_to_variable(field)}=", value)
end

Then /^the ([^\"]*) list should contain the ([^\"]*) id$/ do |list, object|
  instance_variable_get("@#{list}").should include(instance_variable_get("@#{object}").id)
end

Then /^the ([^\"]*) list should not contain the ([^\"]*) id$/ do |list, object|
  instance_variable_get("@#{list}").should_not include(instance_variable_get("@#{object}").id)
end


def text_to_variable(object)
  object.gsub(" ", "_")
end