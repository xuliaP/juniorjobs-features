# frozen_string_literal: true

module Pages
  # this page describe home page
  class Home
    include PageObject
    include Pages::Header

    a :job_title, xpath: ".//*[@id='job-title']/a"
  end
end
