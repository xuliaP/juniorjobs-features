# frozen_string_literal: true

When(/^I fill the subscription form and submit$/) do
  @current_page.fill_form(@subscription)
end

Then(/^I see subscription form$/) do
  expect(@current_page.new_subscription_form_element).to be_visible
end

Given(/^I try to subscribe with valid email/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^redirect to home page/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I try to subscribe with not valid email/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I try to subscribe without email/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("see success message: {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("see error message: {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
