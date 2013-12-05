# Apptopia Test Assignment

## Requirments

RVM (or another ruby version manager) and Bundler must be installed.

## Installation

1. Go to the project folder in terminal.
2. Run `bundle install`
3. If you on OS X, you may install [Pow](http://pow.cx) for convinience. After link project folder (`ln -s /path/to/project ~/.pow/parcel_delivery`) as *parcel_delivery*. 

## Usage
### RSpec
Run RSpec examples:

```
rspec .
```

### Guard
```
bundle exec guard
```

### Web app
Open [http://parcel_delivery.dev](http://parcel_delivery.dev) if you use Pow or `/path/to/project/public/index.html` file in browser.