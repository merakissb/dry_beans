# dry_beans

API build

## Installation

Make sure to have all the necessary stuff to start building this up.

### Pre Requisites
- Ruby 3.2.2
- Rails 7.0.8
- Bundler >= 2.4.21
- Postgresql >= 13

```bash
bundle install
rake db:create
rake db:migrate
```

To test, use postman or similar (create the resources and then query the route)

```bash
  POST api/v1/routes/
  {
    "name": "Ruta 1",
    "date": "2023-12-04"
  }

  POST api/v1/trips
  {
    "trip": {
      "name": "Trip 1 Route 1",
      "date": "2023-12-04",
      "route_id": "1"
    }
  }

  POST api/v1/deliveries/
  {
    "delivery": {
      "delivery_type": "pickup",
      "date": "2023-12-05",
      "trip_id": "1"
    }
  }

  GET api/v1/routes/:id
  {
  "route":
	  "trips": [
      "deliveries": [
      ]
	  ]
  }
```