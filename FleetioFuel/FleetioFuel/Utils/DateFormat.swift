//
//  DateManager.swift
//  FleetioFuel
//
//  Created by Scott on 7/24/21.
//

import UIKit

public final class DateFormat {
    static let shared = DateFormat()
    
    private init() {}
    
    let fetchedDateFormatter: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.calendar = Calendar(identifier: .iso8601)
        dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        dateFormat.locale = Locale(identifier: "en_US_POSIX")
        dateFormat.amSymbol = "am"
        dateFormat.pmSymbol = "pm"
        return dateFormat
    }()
    
    let dateFormat: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMM dd, YYYY h:mm a"
        dateFormat.amSymbol = "am"
        dateFormat.pmSymbol = "pm"
        return dateFormat
    }()
            
}
