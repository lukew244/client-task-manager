Given(/^I have an existing account$/) do
  User.find_by(email: "test@example.com") ||
  User.create!(email: "test@example.com", password: "password", password_confirmation: "password", company: "Test Company")
end

Given(/^I am logged in$/) do
    login_as(User.find_by(email: "test@example.com"), scope: :user)
  end

Given(/^I am an admin$/) do
  user = User.find_by(email: "test@example.com")
  user.update(admin: true)
end

Given(/^there is a client account$/) do
  User.find_by(email: "client@example.com") ||
  User.create!(email: "client@example.com", password: "password", password_confirmation: "password", company: "Client Company")
end
