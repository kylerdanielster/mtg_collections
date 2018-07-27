# Ruby on Rails MTG application
Ths app is based on https://www.railstutorial.org/ 

Try it out at https://desolate-reaches-18806.herokuapp.com/

## Comand for cloud 9
rails server -b $IP -p $PORT

## License

MIT

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```