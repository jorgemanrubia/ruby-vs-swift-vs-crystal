# Ruby vs Swift vs Crystal for processing a big CSV file

This test processes a big CSV file (~4MB) that contains stock data. First, the test will transform this data into a list of bar objects. And then, it will loop through all the bars and calculate the average close price.

I wasn’t able to find a good CSV parser for Swift. There is no official library for it, and the open source solutions I tried were surprisingly slow. Instead, the test just loops through the file lines and split them using *comma* as a delimiter. I used the same approach for Swift, Crystal and Ruby, despite of both Crystal and Ruby featuring official (and fast) CSV libraries. In the three cases it processes the file in *streaming* (without loading the full contents into memory).

## Results

| Language | Version | Time |
| ------------- | :---- |-------------:|
| Ruby | 2.4.0 | 0.53s |
| Crystal |0.22.0 |  0.088s |
| Swift | 3.1 | 1.38s |

## Run the tests

Execute:

```
bundle
rake
```

You can also run specific tests: `rake ruby:run`, `rake crystal:run` and `rake swift:run`.

## See

- [Article in my site](http://jorgemanrubia.com/2017/05/02/comparing-ruby-swift-and-crystal-for-processing-a-big-file/)
