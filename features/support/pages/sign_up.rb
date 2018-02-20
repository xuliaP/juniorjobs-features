# frozen_string_literal: true

module Pages
  # this class describe sign up page
  class SignUp
    include PageObject

    text_field   :user_email,   id: 'user_email'
    text_field   :password,     id: 'user_password'
    text_field   :confirm_pass, id: 'user_password_confirmation'
    select_list  :roles,        id: 'user_roles'
    button       :submit,       name: 'commit'
    form         :new_user,     id: 'new_user'

    def fill_form(user)
      self.user_email = user.email
      self.password = user.password
      self.confirm_pass = user.password
      self.roles = user.roles
      submit
    end
  end
end
