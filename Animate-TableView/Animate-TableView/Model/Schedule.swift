//
//  Schedule.swift
//  Animate-TableView
//
//  Created by 심지원 on 2020/08/19.
//  Copyright © 2020 심지원. All rights reserved.
//

import Foundation

struct Schedule {
    let toDo: String
    let motiv: String?
}

class Schedules {
    static var uncheckedSchedules: [Schedule] = initSchdules()
    static var checkedSchedules: [Schedule] = [Schedule]()
    
    
    static func initSchdules() -> [Schedule] {
        var fixedSchedules = [Schedule]()
        
        fixedSchedules.append(Schedule(toDo: "Drink water", motiv: nil))
        fixedSchedules.append(Schedule(toDo: "Watch a JCC", motiv: nil))
        fixedSchedules.append(Schedule(toDo: "Listen to Music of NCT", motiv: nil))
        
        return fixedSchedules
    }
}
