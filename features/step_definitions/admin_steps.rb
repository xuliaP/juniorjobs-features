# frozen_string_literal: true

Given(/^I logged in as admin$/) do
  admin = FactoryBot.create :admin
  login(admin.email, 'secret')
end

And(/^I see admin layout$/) do
  expect(@current_page.text).to be_include 'JuniorJobsAdmin'
end

Then(/^I see users list$/) do
  expect(@current_page.text).to be_include 'Дата регистрации'
end

Then(/^I see subscriptions list$/) do
  expect(@current_page.text).to be_include 'Начало подписки'
end

Then(/^I see jobs list$/) do
  expect(@current_page.text).to be_include 'Одобренные вакансии'
end
