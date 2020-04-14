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
  pending # Write code here that turns the phrase above into concrete actions
end

Then("Booking summary is correct") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("User chooses to book a trip with shortest trip duration") do
  pending # Write code here that turns the phrase above into concrete actions
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
