Then("User sees correct search results") do
  $b.element(xpath: '//h3/span[contains(text(), "EWR")]/span[contains(text(), "To")]').present?
  $b.element(xpath: '//h3/span[contains(text(), "MUC")]').present?
end

Then("Results are sorted by ascending price") do
  price_list = []
  results = $b.elements(class: 'theme-search-results-item-price-tag').size

  for i in 0..results do
    price_list.push ($b.element(class: 'theme-search-results-item-price-tag', index: i).text)[4..]
    puts price_list[i]
    break if i == 10
  end

  if (price_list == price_list.sort)
    next
  end
end

When("User selects first result") do
  $b.button(text: 'Book Now', index: 0).click
end

Then("Booking summary is correct") do
  $b.element(xpath: '//p[@class="theme-search-results-item-flight-section-meta-time"][0][contains(text(), "New York")])', index: 0).present?
  $b.element(xpath: '//p[@class="theme-search-results-item-flight-section-meta-time"][1][contains(text(), "Munich")])', index: 1).present?
  $b.element(xpath: "//p[@class='theme-search-results-item-flight-section-meta-city']/span[contains(text(), '#{desired_date}')]", index: 0).present?
end

When("User chooses to book a trip with shortest trip duration") do
  binding.pry
end

When("User enters personal data with payment details") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("User finalizes the booking") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("User sees his booking has been made") do
  pending # Write code here that turns the phrase above into concrete actions
end
