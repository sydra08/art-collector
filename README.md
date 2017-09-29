# About Art Collector

Art Collector is a Sinatra app that allows you to create and manage different art collections. Users can also view all artists and artworks to the database supporting the app.

## Install instructions

To install, clone or fork this repository, then run `bundle install` from the terminal prompt.

## Usage

To create a new verison of the database, populate it with seed data, and get started, run the following commands from the terminal prompt:

```ruby
rake db:rollback STEP=7
rake db:migrate
rake db:seed
shotgun
```

In your browser, navigate to `localhost:9393`.

## Contributions

Bug reports and pull requests are welcome on GitHub at https://github.com/sydra08/art-collector. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

This project is available as open source under the terms of the [MIT License](opensource.org/licenses/MIT).

## Credits

Shout out to Brian Emory and his [Corneal](https://github.com/thebrianemory/corneal) gem.
