Given /^I (?:am logged|should be able to log) in with "([^\"]*)" and "([^\"]*)"$/ do |arg1, arg2|
  @account = Sorenson::Services::Account.login(arg1, arg2)
end

Given "I am logged in" do
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
end

And /^I get an account$/ do
  @account = Sorenson::Services::Account.get_account
end

When /^I change my password to "([^\"]*)"$/ do |arg1|
  @account.set_password(arg1, 'anything')
end

When /^I empty the trash$/ do
  @account.empty_trash
end