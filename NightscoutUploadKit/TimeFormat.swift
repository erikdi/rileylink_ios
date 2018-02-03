//
//  TimeFormat.swift
//  RileyLink
//
//  Created by Pete Schwamb on 3/8/16.
//  Copyright © 2016 Pete Schwamb. All rights reserved.
//

import Foundation

class TimeFormat: NSObject {
    private static var formatter = DateFormatter()
    
    static func timestampStrFromDate(_ date: Date) -> String {
        formatter.dateFormat = "ZZZZZ"
        let tzString = formatter.string(from: date)

        let cal = Calendar.current
        let comps = cal.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond],
                               from: date)
        let microSeconds = lrint(Double(comps.nanosecond!)/1000) // Divide by 1000 and round

        let formatted = String(format: "%04ld-%02ld-%02ldT%02ld:%02ld:%02ld.%06ld",
                       comps.year!, comps.month!, comps.day!,
                       comps.hour!, comps.minute!, comps.second!,
                       microSeconds) + tzString
        return formatted
    }
}
