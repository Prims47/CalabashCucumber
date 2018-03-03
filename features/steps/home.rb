Given(/^the app has launched$/) do
    wait_for do
      !query("*").empty?
    end
end
  
When(/^I do nothing$/) do
end

Then(/^I should see the button "([^"]*)"$/) do |txt|
    wait_for_element_exists("button marked:'#{txt}'")
end