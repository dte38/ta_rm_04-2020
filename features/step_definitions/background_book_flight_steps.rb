Given("User is logged in") do
  $b.goto 'https://www.phptravels.net/login'

  $b.text_field(name: 'username').set('user@phptravels.com')
  $b.text_field(name: 'password').set('demouser')
  $b.button(text: 'Login').click

  $b.h3(text: 'Hi, Demo User').wait_until(&:present?)
end

Given("User enters starting and end point") do
  $b.goto 'https://www.phptravels.net/home'
  $b.a(data_name: 'flights').click

  $b.div(id: 's2id_location_from').click
  $b.input(class: ['select2-input', 'select2-focused']).send_keys('New York')
  $b.li(class: ['select2-results-dept-0', 'select2-result', 'select2-result-selectable']).wait_until(&:present?).click
  
  $b.div(id: 's2id_location_to').click
  $b.input(class: ['select2-input', 'select2-focused']).send_keys('Munich')
  $b.li(class: ['select2-results-dept-0', 'select2-result', 'select2-result-selectable']).wait_until(&:present?).click
end

Given("User enters number of passengers") do
  $b.button(class: ['btn', 'btn-white', 'bootstrap-touchspin-up'], index: 3).click
  $b.button(class: ['btn', 'btn-white', 'bootstrap-touchspin-up'], index: 4).click
end

Given("User enters date") do
  # $b.input(id: 'FlightsDateStart')
end

Given("User performs search") do
  # $b.button(text: 'Search').click
end
