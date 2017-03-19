When(/^I go to the root path$/) do
  visit "/"
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field_name, content|
  begin
    fill_in(field_name, with: content)
  rescue Capybara::ElementNotFound => error
    print page.text
    binding.pry if ENV["debug"]
    raise error
  end
end

When(/^I press the "([^"]*)" button$/) do |button|
  click_button(button)
end

When(/^I click the "([^"]*)" link$/) do |link|
  click_link(link)
end


When(/^I select "([^"]*)" from "([^"]*)"$/) do |option, select_box|
  select(option, from: select_box, match: :first)
end
