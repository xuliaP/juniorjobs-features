# frozen_string_literal: true

module Pages
  #  describe Header
  module Header
    include PageObject
    a :add_vacancy, xpath: "*//a[contains(@class,'new-job')]"
    a :profile, xpath: "*//a[contains(@class,'profile-list')]"
    a :cvs, xpath: "*//a[contains(@class,'cvs-link')]"
    a :own_cvs, xpath: "*//a[contains(@class,'own-cvs')]"
  end
end
