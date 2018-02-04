# frozen_string_literal: true

Given(/^I logged in as admin$/) do
  @user.roles = ['admin']
  Models::User.create!(
      email: @user.email,
      crypted_password: @user.crypted_password,
      salt: @user.salt,
      roles: @user.roles
  )
  login(@user.email, @user.password)
end

And(/^I see admin layout$/) do
  expect(@current_page.text).to be_include 'JuniorJobsAdmin'
end

Given(/^(\d+) default users exists$/) do |num|
  FactoryBot.create_list(:user, num).each do |user|
    Models::User.create!(email: user.email, crypted_password: user.crypted_password, salt: user.salt, roles: user.roles)
  end
end

Given(/^(\d+) default subscriptions exists$/) do |num|
  subscriptions = FactoryBot.create_list(:subscription, num).map(&:to_h)
  Models::Subscription.create!(subscriptions)
end

Given(/^(\d+) default vacancies exists$/) do |num|
  jobs = FactoryBot.create_list(:vacancy, num).map(&:to_h)
  Models::Job.create!(jobs) do |job|
    job.token = 'token'
    job.expired_at = 1.week.from_now
  end
end

Then(/^I see users list$/) do
  expect(@current_page.text).to be_include 'Дата регистрации'
end

Then(/^I see subscriptions list$/) do
  expect(@current_page.text).to be_include 'Начало подписки'
end

Then(/^I see jobs list$/) do
  sleep 10
  expect(@current_page.text).to be_include 'Одобренные вакансии'
end
