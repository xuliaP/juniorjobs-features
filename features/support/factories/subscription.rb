# frozen_string_literal: true

FactoryBot.define do
  factory :subscription, class: OpenStruct do
    Faker::Config.locale = :en
    email
    active { Faker::Boolean.boolean }
  end
end
