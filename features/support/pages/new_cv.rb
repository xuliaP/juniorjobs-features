# frozen_string_literal: true

module Pages
  # this page describe new cv page
  class NewCv
    include PageObject
    form :new_cv_form, id: 'new_cv'

    text_field :cv_title, id: 'cv_title'
    text_field :cv_name, id: 'cv_name'
    select_list :cv_employment, id: 'cv_employment'

    text_area :cv_description, id: 'cv_description'
    text_area :cv_education, id: 'cv_education'
    text_area :cv_skills, id: 'cv_skills'
    text_area :cv_work_experience, id: 'cv_work_experience'

    text_field :cv_city, id: 'cv_city'
    checkbox :cv_remote, id: 'cv_remote'
    
    text_field :cv_address, id: 'cv_address'
    text_field :cv_phone, id: 'cv_phone'
    text_field :cv_email, id: 'cv_email'
    text_field :cv_web_site, id: 'cv_web_site'

    select_list :cv_currency, id: 'cv_currency'
    text_field :cv_salary_from, id: 'cv_salary_from'
    text_field :cv_salary_to, id: 'cv_salary_to'
    checkbox :cv_salary_by_agreement, id: 'cv_salary_by_agreement'

    select_list :cv_expired_at, id: 'cv_expired_at'
    button :submit, name: 'commit'

    def fill_form(cv)
      fill_all_elements(cv)
      fill_cv_expired_at(cv)
    end

    private

    def fill_all_elements(cv)
      all_elements_mapping.each do |method|
        fill_field(method, cv) if cv.send(method)
      end
    end

    def fill_cv_expired_at(cv)
      options = cv_expired_at_options
      res = nil
      options.each do |option|
        res = option if option.include? cv.expired_at
      end
      self.cv_expired_at = res
    end

    def fill_field(method, cv)
      if element_is?(method, 'TextField') ||
         element_is?(method, 'SelectList') ||
         element_is?(method, 'TextArea')
        elem = "cv_#{method}="
        send(elem, cv.send(method))
      elsif element_is?(method, 'CheckBox')
        send("check_cv_#{method}")
      end
    end

    def element_is?(element, elements_class)
      send("cv_#{element}_element").class.to_s.include?(elements_class)
    end

    def all_elements_mapping
      %w[title
         name
         employment
         description
         education skills work_experience
         city
         remote
         address phone email web_site
         currency
         salary_from salary_to salary_by_agreement]
    end
  end
end
