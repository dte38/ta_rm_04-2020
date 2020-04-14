class LoginScreen
  def loginWith(email, password)
    $b.text_field(name: 'username').set(email)
    $b.text_field(name: 'password').set(password)

    $b.button(text: 'Login').click
  end
end