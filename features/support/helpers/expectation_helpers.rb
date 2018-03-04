# frozen_string_literal: true

# module contain methods for expectation on pages
module ExpectationHelpers
  def vacancy_present?
    @current_page.vacancies_presents_property_mapper.each do |property|
      expect(@current_page.send("job_#{property}"))
        .to be_include(@vacancy.send(property))
        .and be_present
    end
  end

  def cv_present?
    @current_page.cv_presents_property_mapper.each do |property|
      expect(@current_page.send("cv_#{property}"))
        .to be_include(@cv.send(property))
        .and be_present
    end
  end
end
