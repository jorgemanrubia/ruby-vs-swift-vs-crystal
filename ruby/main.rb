class Bar
  attr_reader :open, :high, :low, :close

  def initialize(open: 0, high: 0, low: 0, close: 0)
    @open = open
    @high = high
    @low = low
    @close = close
  end
end

def read_csv_as_bars
  bars = []

  File.foreach 'data/data.csv' do |line|
    row = line.split(',')
    _, open, high, low, close, _, _ = row
    bars << Bar.new(
        open: open.to_f/10_000,
        high: high.to_f/10_000,
        low: low.to_f/10_000,
        close: close.to_f/10_000,
    )
  end

  bars
end

def calculate_average(bars)
  total = 0.0

  bars.each do |bar|
    total += bar.close
  end

  total/bars.length
end


result = calculate_average read_csv_as_bars
puts result
