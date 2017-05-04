//
//  main.swift
//  CSVTest
//
//  Created by JORGE MANRUBIA DIEZ on 02/05/2017.
//  Copyright © 2017 JORGE MANRUBIA DIEZ. All rights reserved.
//

import Foundation

//var file = CommandLine.arguments[1]
var file = "/Users/jorge/work/ruby-vs-swift-vs-crystal/data/data.csv"

struct Bar{
    var open: Double
    var close: Double
    var high: Double
    var low: Double
    
    init(open: Double, high: Double, low: Double, close: Double){
        self.open = open
        self.close = close
        self.high = high
        self.low = low
    }
}

func readCsvAsBars(file: String, into bars: inout [Bar]) {
    if let aStreamReader = StreamReader(path: file) {
        while let line = aStreamReader.nextLine {
            let row =  line.components(separatedBy: ",")
            let open = Double(row[1])! / 10000
            let high = Double(row[2])! / 10000
            let low = Double(row[3])! / 10000
            let close = Double(row[4])!/10000
            bars.append(Bar(open: open, high: high, low: low, close: close))
        }
    }
}

func calculateAverageCloseOf(bars: inout [Bar]) -> Double{
    var total: Double = 0.0
    for bar in bars{
        total += bar.close
    }
    return total / Double(bars.count)
}

var bars: [Bar] = []
readCsvAsBars(file: file, into: &bars)
let result = calculateAverageCloseOf(bars: &bars)

print(result)


