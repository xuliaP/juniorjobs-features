# frozen_string_literal: true

FactoryBot.define do
  factory :cv, class: OpenStruct do
    Faker::Config.locale = :en
    title { Faker::Job.title }
    employment { %w[full part contract internal][rand(0..3)] }
    description Faker::Lorem.paragraph
    education Faker::Lorem.paragraph
    skills Faker::Lorem.paragraph
    work_experience Faker::Lorem.paragraph
    name { Faker::Name.name }
    city { Faker::Address.city }
    remote { Faker::Boolean.boolean }
    currency { %w[byn rub uah usd][rand(0..3)] }
    salary_from { rand(1000) }
    salary_to { rand(1001..2000) }
    salary_by_agreement { Faker::Boolean.boolean }
    expired_at { ['На неделю', 'На 2 недели', 'На месяц'][rand(0..1)] }
    status { %w[approved not_approved].sample }
    address Faker::Address.street_address
    phone { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    web_site { Faker::Internet.url }
    # user_id { @user.all.last.id }
    user_id { 4 }
  end
end
# 