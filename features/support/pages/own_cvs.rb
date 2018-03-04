# frozen_string_literal: true

module Pages
  # this page describe own cvs page
  class OwnCvs
    include PageObject

    a :add_cv, xpath: "*//a[contains(@class,'new-cv')]"
    a :cv_title, xpath: "*//h3[contains(@class,'cv-title')]/a"
  end
end