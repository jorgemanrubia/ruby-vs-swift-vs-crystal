require 'benchmark'

def run(command)
  puts command
  system command
end

def run_and_measure(title, command)
  benchmark_result=Benchmark.measure do
    run command
  end
  puts benchmark_result
  puts "\t#{title} took #{benchmark_result.total}s"

end

namespace :crystal do
  task :build do
    run "crystal build crystal/main.cr -o crystal/main --release"
  end

  task run: "crystal:build" do
    run_and_measure "Crystal", "crystal/main"
  end
end

namespace :swift do
  task :build do
    run "swiftc -O swift/CSVTest/CSVTest/*.swift -o ./swift/main -whole-module-optimization"
  end

  task run: :build do
    run_and_measure "Swift", "swift/main data/data.csv"
  end
end

namespace :ruby do
  task :run do
    run_and_measure "Ruby", "ruby ruby/main.rb"
  end
end

task run_all: ["ruby:run", "crystal:run", "swift:run"]

task default: :run_all
