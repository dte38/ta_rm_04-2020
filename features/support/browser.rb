$b = Watir::Browser.new ENV['BROWSER'].to_sym

# close the browser using ruby global hook
at_exit do
  $b.close
end