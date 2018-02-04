# frozen_string_literal: true

Given(/^user logged in as admin$/) do
  @user.roles = ['admin']
  Models::User.create!(
      email:            @user.email,
      crypted_password: @user.crypted_password,
      salt:             @user.salt,
      roles:            @user.roles
  )
  login(@user.email, @user.password)
end

And(/^user see admin layout$/) do
  expect(@current_page.text).to be_include 'JuniorJobsAdmin'
end

Given(/^(\d+) default users exists$/) do |num|
  @users = FactoryBot.create_list(:user, num).map(&:to_h)
  @users.each do |user|
    Models::User.create!(
        email:            user[:email],
        crypted_password: user[:crypted_password],
        salt:             user[:salt],
        roles:            user[:roles])
  end
end

Given(/^(\d+) default subscriptions exists$/) do |num|
  @subscriptions = FactoryBot.create_list(:subscription, num).map(&:to_h)
  Models::Subscription.create!(@subscriptions)
end

Given(/^(\d+) default vacancies exists$/) do |num|
  @jobs = FactoryBot.create_list(:vacancy, num).map(&:to_h)
  Models::Job.create!(@jobs) do |job|
    job.token      = 'token'
    job.expired_at = 1.week.from_now
  end
end

Then(/^user see users list$/) do
  @users.each do |user|
    expect(@current_page.text).to be_include user[:email]
  end
end

Then(/^user see subscriptions list$/) do
  @subscriptions.each do |subscription|
    expect(@current_page.text).to be_include subscription[:email]
  end
end

Then(/^user see jobs list$/) do
  @jobs.each do |job|
    expect(@current_page.text).to be_include job[:title]
  end
end
