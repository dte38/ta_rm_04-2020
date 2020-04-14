# ta_rm_04/2020

## Prerequisities

### Ruby version

```bash
ruby 2.6.3
```

### Chromedriver

Install desired version for your OS from [here](https://github.com/SeleniumHQ/selenium/wiki/ChromeDriver)
and add it to your `PATH` if needed.

## How to run tests

1. Clone the repo
2. Set proper ruby version
3. Install bundler

```bash
gem install bundler
```

4. Install gems from Gemfile

```bash
bundle
```

5. Run cucumber

```bash
bundle exec cucumber
```

You can specify which case you would run by adding its tag

```bash
bundle exec cucumber --tags @tag
```

After failed scenario screenshot is put to:

```bash
/output/screenshots/
```
