module Pages
# This page describe edit vacancy page
  class EditVacancy
    include PageObject

    form :edit_job_form, id: 'edit_job_:id'
    link :delete_job, href: '/jobs/:id'

  end
end
