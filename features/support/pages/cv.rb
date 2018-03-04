# frozen_string_literal: true

module Pages
  # this page describe cvs page
  class Cv
    include PageObject

    h1 :cv_name, id: 'cv-name'
    div :cv_employment, id: 'cv-employment'
    h1 :cv_title, id: 'cv-title'
    span :cv_publication_period, id: 'cv-publication-period'
    p :cv_description, xpath: ".//p[@id='cv-description']/following-sibling::p[1]"
    p :cv_education, xpath: ".//p[@id='cv-education']/following-sibling::p[1]"
    p :cv_skills, xpath: ".//p[@id='cv-skills']/following-sibling::p[1]"
    p :cv_work_experience, xpath: ".//p[@id='cv-work-experience']/following-sibling::p[1]"
    
    div :cv_email, id: 'cv-email'
    div :cv_phone, id: 'cv-phone'
    div :cv_address, id: 'cv-address'
    div :cv_web_site, id: 'cv-web-site'

    def cv_presents_property_mapper
      %w[name description education skills work_experience email phone address web_site]
    end

  end
end
