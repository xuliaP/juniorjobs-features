# frozen_string_literal: true
require 'sorcery/crypto_providers/bcrypt'

FactoryBot.define do
  sequence :email do |n|
    "admin#{n}@example.com"
  end

  factory :admin, class: User do
    email
    salt { 'asdasdastr4325234324sdfds' }
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt('secret', salt) }
    roles ['admin']
  end
end
