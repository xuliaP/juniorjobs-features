# frozen_string_literal: true

Given(/^user logged in as junior$/) do
  @user.roles = ['junior']
  Models::User.create!(
      email:            @user.email,
      crypted_password: @user.crypted_password,
      salt:             @user.salt,
      roles:            @user.roles
  )
  login(@user.email, @user.password)
end

Given(/^user have cv ([^"]*) with ([^"]*)$/) do |field, data|
  data = data.nil? ? '' : Faker::Lorem.characters(data.to_i)
  @cv.send("#{field}=", data)
end

When(/^user fill cv form$/) do
  @current_page.fill_form(@cv)
end

And(/^user see his cv$/) do
  cv_present?
end

Then(/^user see cv form$/) do
  expect(@current_page.new_cv_form_element).to be_visible
end

Given(/^(\d+) default cv exists$/) do |num|
  @cvs = FactoryBot.create_list(:cv, num).map(&:to_h)
  @cvs = Models::Cv.create!(@cvs) do |cv|
    cv.expired_at = 1.week.from_now
  end
end

Given(/^default cv exists$/) do
  steps %( Given 1 default cv exists )
  @cv = @cvs.first
end

Given(/^default own cv exists$/) do
  steps %( Given 1 default cv exists )
  @cv = @cvs.first
  @cv.user_id = Models::User.last.id
  @cv.save!
end

Then(/^user see cvs list$/) do
  @cvs.each do |cv|
    expect(@current_page.text).to be_include(cv[:title])
  end
end

And(/^user see cv$/) do
  steps %( And user see his cv )
end
