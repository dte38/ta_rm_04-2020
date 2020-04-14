SCREENSHOT_PATH = 'output/screenshots'
FileUtils.mkdir_p SCREENSHOT_PATH

After do |scenario|
  if scenario.failed?
    screenshot_name = "#{Time.now}_#{scenario.name}_#{scenario}".gsub(/\W/, '_') + '.png'
    $b.screenshot.save "#{SCREENSHOT_PATH}/#{screenshot_name}"
  end
end