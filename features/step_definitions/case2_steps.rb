When("User selects first result") do
  $b.button(text: 'Book Now', index: 0).click
end

Then("Booking summary is correct") do
  $b.element(xpath: '//p[@class="theme-search-results-item-flight-section-meta-time" and contains(text(), "New York")]').present?
  $b.element(xpath: '//p[@class="theme-search-results-item-flight-section-meta-time" and contains(text(), "Munich")]').present?
  $b.element(xpath: "//p[@class='theme-search-results-item-flight-section-meta-city']/span[contains(text(), '#{$desired_date}')]", index: 0).present?
end
