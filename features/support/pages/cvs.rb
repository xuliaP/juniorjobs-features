# frozen_string_literal: true

module Pages
  # this page describe own cvs page
  class Cvs
    include PageObject

    a :cv_title, xpath: "*//h3[contains(@class,'cv-title')]/a"
  end
end