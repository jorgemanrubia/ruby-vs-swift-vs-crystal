The test processes a big CSV file (~4MB) that contains random stock data. First, the test will transform this data into a list of bar objects. And then, it will loop through all the bars and calculate the average close price.

I wasn’t able to find a good CSV parser for Swift. There is no official library for it, and the open source solutions I tried were surprisingly slow. Instead, the test just loops through the file lines and split them using *comma* as a delimiter. To keep things equal, I used the same approach with Ruby and Crystal, instead of using the official (and fast) CSV libraries they implement. In the three cases it processes the file in *streaming* (without loading the full contents into memory).

## Results

| Language | Version | Time |
| ------------- | :---- |-------------:|
| Ruby | 2.4.0 | 0.53s |
| Crystal |0.22.0 |  0.088s |
| Swift | 3.1 | 1.38s |

## Run the tests

```
bundle
rake
```

You can also run specific tests: `rake ruby:run`, `rake crystal:run` and `rake swift:run`.
