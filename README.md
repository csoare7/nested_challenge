# Task

For this exercise we’d like you write a simple web service, which will take a price, a ‘from’ date,
a ‘to’ date and the name of a London borough and return the price inflated from the ‘from’ date
to the ‘to’ date. This involves looking up the index value for the two dates and multiplying the
price by their ratio. The date is in column 1, the borough should be matched against column 2
and the index is in column 5 of the CSV, e.g. for a property in Islington the index was 28.25 in
January 2000, and 103.60 in January 2016, so if the price was £100,000 in January 2000, the
inflated price is: £100,000 * (103.60 / 28.25) = £366,726 for January 2016. This is the value that your service should return.

# How to run
```
git clone git@github.com:csoare7/nested_challenge.git
cd nested_challenge
bundle install
rails db:create
rails db:migrate
ruby lib/tasks/import_csv.rb // this will take a while
rails s
```
Should you wish to run the tests, just run
```
rspec spec
```
# Exercise is live on Heroku
```
curl -H "Content-Type: application/json" "https://intense-stream-71078.herokuapp.com/regions/Islington/inflated_price?price=100000&from=01-01-2000&to=01-01-2016"
>> {"inflated_price":366726,"region_name":"Islington"}
```

