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
    "route": {
      "name": "Route Name",
      "date": "2023-12-07",
      "trips_attributes": [
        {
          "name": "Trip Name",
          "date": "2023-12-07",
          "deliveries_attributes": [
            {
              "delivery_type": "delivery",
              "date": "2023-12-07"
            },
            {
              "delivery_type": "pickup",
              "date": "2023-12-07"
            },
            {
              "delivery_type": "delivery",
              "date": "2023-12-07"
            }
          ]
        }
      ]
    }
  }

  GET api/v1/routes/:id
  [
    {
      "route":
 	    "trips": [
        {
          "deliveries": [
            {
            }
          ]
        }
      ]
    }
  ]
```