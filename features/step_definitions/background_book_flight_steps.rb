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

Given("User enters date") do
  $desired_date = (Time.now + (60 * 60 * 24 * 7 * 2)).to_s
  desired_year = $desired_date[0..3]
  desired_month = (($desired_date[5..6].to_i) - 1).to_s # datepickers month begins with 0
  desired_day = $desired_date[8..9]

  $b.input(name: 'departure_date').click
  $b.div(class: ['datepicker', '-bottom-left-', '-from-bottom-', 'active']).wait_until(&:present?)
  $b.element(xpath: "//div[@class='datepicker -bottom-left- -from-bottom- active']//div[@data-date='#{desired_day}' and @data-month='#{desired_month}' and @data-year='#{desired_year}']").click
end

Given("User enters number of passengers") do
  $b.button(class: ['btn', 'btn-white', 'bootstrap-touchspin-up'], index: 2).click
  $b.button(class: ['btn', 'btn-white', 'bootstrap-touchspin-up'], index: 3).click
  $b.button(class: ['btn', 'btn-white', 'bootstrap-touchspin-up'], index: 3).click
  binding.pry
end

Given("User performs search") do
  $b.element(xpath: "//div[@class='col-xs-12 col-md-12']/button[@type='submit' and contains(text(), 'Search')]").click
end
