require "csv"

class Bar
  getter :close

  def initialize(@open : Float64, @high : Float64, @low : Float64, @close : Float64)
  end
end

def read_csv_as_bars
  bars = [] of Bar

  File.each_line "data/data.csv" do |line|
    row = line.split(',')
    _, open, high, low, close, _, _ = row
    bars << Bar.new(
        open.to_f/10_000,
        high.to_f/10_000,
        low.to_f/10_000,
        close.to_f/10_000,
    )
  end

  bars
end

def calculate_average(bars)
  total = 0.0

  bars.each do |bar|
    total += bar.close
  end

  total/bars.size
end


result = calculate_average read_csv_as_bars
puts result
