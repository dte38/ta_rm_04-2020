Then("User sees correct search results") do
  $b.element(xpath: '//h3/span[contains(text(), "EWR")]/span[contains(text(), "To")]').present?
  $b.element(xpath: '//h3/span[contains(text(), "MUC")]').present?
end

Then("Results are sorted by ascending price") do
  price_list = $b.elements(class: 'theme-search-results-item-price-tag').map do |item|
    item.text[4..]
  end

  if (price_list == price_list.sort)
    next
  end
end
