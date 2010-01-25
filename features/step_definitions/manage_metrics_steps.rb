Then /^the total plays should be "([^\"]*)"$/ do |total|
  Sorenson::Services::Metric.total_plays.should == total.to_i
end

Then /^the storage used should be "([^\"]*)"$/ do |storage|
  Sorenson::Services::Metric.storage_used.should == storage.to_i
end

And /^I get all metrics$/ do
  @events = Sorenson::Services::Metric.all
end

Then /^the events list should contain an event with a day of "([^\"]*)"$/ do |day|
  @events.select {|event| event.date == Date.parse(day)}.should_not be_empty
end