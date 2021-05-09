//
//  Task.swift
//  FilteringOperatorsRxSwiftToDoApp
//
//  Created by 大西玲音 on 2021/05/09.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
