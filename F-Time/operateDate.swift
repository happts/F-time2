//
//  operateDate.swift
//  F-Time
//
//  Created by happts on 17/7/30.
//  Copyright © 2017年 jndxttt. All rights reserved.
//

import Foundation
class operateDate{
    struct dateTime {
        var year: Int
        var month: Int
        var day: Int
        var hour: Int
        var minute: Int
        var weekday: Int
    }
    
    func dateTimeExtractive(date: Date) -> dateTime {
        let calendar = Calendar.current
        let a = calendar.component(Calendar.Component.year, from: date)
        let b = calendar.component(Calendar.Component.month, from: date)
        let c = calendar.component(Calendar.Component.day, from: date)
        let d = calendar.component(Calendar.Component.hour, from: date)
        let e = calendar.component(Calendar.Component.minute, from: date)
        let f = calendar.component(Calendar.Component.weekday, from: date)
        let datetime = dateTime(year: a, month: b, day: c, hour: d, minute: e, weekday: f)
        return datetime
    }
    
    func dateStringTranser(date:Date) -> String {
        let dFormatter = DateFormatter()
        dFormatter.dateFormat = "yyyy-MM-dd HH:mm EEEE"
        dFormatter.locale = Locale.current
        return dFormatter.string(from: date)
    }
    
    func StringDateTransfer(dateStr:String) -> Date {
        let dFormatter = DateFormatter()
        dFormatter.dateFormat = "yyyy-MM-dd HH:mm EEEE"
        dFormatter.locale = Locale.current
        return dFormatter.date(from: dateStr)!
    }
    
    func getWeekday(date:Date) -> String {
        let dFormatter = DateFormatter()
        dFormatter.dateFormat = "EEEE"
        dFormatter.locale = Locale.current
        return dFormatter.string(from: date)
    }
}
