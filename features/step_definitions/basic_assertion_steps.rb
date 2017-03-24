Then(/^I should not see "([^"]*)"$/) do |text|
  page.should have_no_content(text)
end

Then(/^I should see "([^"]*)"$/) do |text|
  ticks = 0
  until page.has_content?(text) || ticks > 30 do
    sleep 0.1
    ticks += 1
  end
  page.should have_content(text)
end

Then(/^I should be on the "([^"]*)" page$/) do |path|
  expect page.current_path == path
end
