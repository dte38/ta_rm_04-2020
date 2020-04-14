When("User chooses to book a trip with shortest trip duration") do
  $b.element(xpath: "//div[@id='group_main']//div[@class='go-right']", index: 0).click
  $b.button(class: ['btn', 'btn-primary', 'btn-block', 'theme-search-results-item-price-btn']).wait_until(&:present?)

  routes_time = $b.elements(xpath: '//div[@class="theme-search-results-item-flight-section-path-fly-time"]').map do |item|
    timesResults = item.to_s.scan(/\d+/)
    timesResults[0] * 60 + timesResults[1]
  end

  $b.button(text: 'Book Now', index: routes_time.index(routes_time.min)).click
end

When("User enters personal data with payment details") do
  # personal info
  $b.input(id: 'name').send_keys(Faker::Name.first_name)
  $b.input(id: 'surname').send_keys(Faker::Name.last_name)
  $b.input(id: 'email').send_keys(Faker::Internet.email)
  $b.input(id: 'phone').send_keys(Faker::Number.number(digits: 10))
  $b.input(id: 'birthday').send_keys(Faker::Date.in_date_period(year: 1990, month: 4))
  $b.input(id: 'cardno').send_keys('EE' + (Faker::Number.number(digits: 7)).to_s)
  $b.input(id: 'expiration').send_keys(Faker::Date.in_date_period(year: 2025, month: 4))
  $b.div(id: 's2id_nationality').click
  $b.div(class: ['select2-container', 'form-control', 'select2-container-active', 'select2-dropdown-open']).wait_until(&:present?)
  $b.input(class: 'select2-input').send_keys('Poland')
  $b.element(class: 'select2-match').wait_until(&:present?).click

  # payment info
  $b.select(id: 'cardtype').select('VI')
  $b.input(id: 'card-number').send_keys(Faker::Number.number(digits: 12))
  $b.select(id: 'expiry-month').select('12')
  $b.select(id: 'expiry-year').select('2029')
  $b.input(id: 'cvv').send_keys(Faker::Number.number(digits: 3))
end

When("User finalizes the booking") do
  $b.div(class: ['custom-control', 'custom-checkbox', 'form-group', 'acceptterm']).click
  $b.button(text: 'Complete Booking').wait_until(&:present?).click
end

# Testing site didn't work to that part, this assertion is my own idea and IT WILL FAIL
Then("User sees his booking has been made") do
  $b.h3(text: 'Your booking has been succesfully made!').present?
end
