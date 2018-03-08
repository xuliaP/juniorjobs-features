# frozen_string_literal: true

Given(/^(\d+) default vacancies exists$/) do |num|
  @vacancies = FactoryBot.create_list(:vacancy, num).map(&:to_h)
  @vacancies = Models::Job.create!(@vacancies) do |job|
    job.token      = 'token'
    job.expired_at = 1.week.from_now
  end
end

Given(/^(\d+) default approved vacancies exists$/) do |num|
  @vacancies = FactoryBot.create_list(:vacancy, num).map(&:to_h)
  @vacancies = Models::Job.create!(@vacancies) do |job|
    job.token      = 'token'
    job.expired_at = 1.week.from_now
    job.status = 'approved'
  end
end

Given(/^default approved vacancy exists$/) do
  steps %( Given 1 default approved vacancies exists )
  @vacancy = @vacancies.first
end

When(/^user fill vacancy form$/) do
  @current_page.fill_form(@vacancy)
end

And(/^user see his vacancy$/) do
  vacancy_present?
end

Given(/^user have vacancy ([^"]*) with ([^"]*)$/) do |field, data|
  data = data.nil? ? '' : Faker::Lorem.characters(data.to_i)
  @vacancy.send("#{field}=", data)
end

Then(/^user see vacancy form$/) do
  expect(@current_page.new_job_form_element).to be_visible
end

And(/^user see error message: ([^"]*)$/) do |text|
  expect(@current_page.text).to be_include(text)
end

Then(/^user see jobs list$/) do
  @vacancies.each do |job|
    expect(@current_page.text).to be_include(job[:title])
  end
end

And(/^user see vacancy$/) do
  steps %( And user see his vacancy )
end

And(/^user have published vacancy$/) do
  @vacancy = FactoryBot.create :vacancy
  @vacancy = Models::Job.create!(@vacancy.to_h) do |job|
    job.user_id = @user.id
    job.expired_at = 1.week.from_now
    job.token = 'token'
    job.status = 'approved'
  end
<<<<<<< HEAD
=======
  goto url_for(:vacancy)
>>>>>>> 69b23a0c7ebc339173e7c793fe289375056ab153
end
