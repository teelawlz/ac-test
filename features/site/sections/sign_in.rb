class SignIn < SitePrism::Section
  element :email_sign_in_button, ".emailSignInButtonWrapper .signInText"
  element :email_field, "input.email"
  element :password_field, "input.password"
  element :submit_button, "button.submitButton"
end
