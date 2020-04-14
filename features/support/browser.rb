$b = Watir::Browser.new ENV['BROWSER'].to_sym

After do |scenario|
  $b.cookies.clear
  $b.refresh
end

at_exit do
  $b.close
end