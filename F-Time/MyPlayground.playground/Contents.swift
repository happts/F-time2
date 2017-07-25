//: Playground - noun: a place where people can play

import UIKit

let currentDate = Date()
print(currentDate)

let dateFormatter = DateFormatter()
dateFormatter.locale = Locale.current

let calendar = Calendar.current

dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
var stringDate = dateFormatter.string(from: currentDate)
print(stringDate)

var dateString = "1998-07-18 12:22:00"
var date1 = dateFormatter.date(from: dateString)

dateString = "2017-07-13 12:22:00"
var date2 = dateFormatter.date(from: dateString)

print((date1! as NSDate).earlierDate(date2!))

if date1?.compare(date2!) == ComparisonResult.orderedAscending {
    print("date1 is earlier")
} else if date1?.compare(date2!) == ComparisonResult.orderedDescending {
    print("date2 is earlier")
} else if date1?.compare(date2!) == ComparisonResult.orderedSame {
    print("Same date!!!")
}

let dateComponents = calendar.component(Calendar.Component.second, from: date2!)
print(dateComponents)

struct dateTime {
    var year: Int
    var month: Int
    var day: Int
    var hour: Int
    var minute: Int
    var second: Int
}


func dateTimeExtractive(date: Date) -> dateTime {
    let a = calendar.component(Calendar.Component.year, from: date)
    let b = calendar.component(Calendar.Component.month, from: date)
    let c = calendar.component(Calendar.Component.day, from: date)
    let d = calendar.component(Calendar.Component.hour, from: date)
    let e = calendar.component(Calendar.Component.minute, from: date)
    let f = calendar.component(Calendar.Component.second, from: date)
    let datetime = dateTime(year: a, month: b, day: c, hour: d, minute: e, second: f)
    return datetime
}

dateTimeExtractive(date: date2!).year