//
//  LapItem.swift
//  week2_eunsu
//
//  Created by Eunsu JEONG on 4/23/24.
//

import Foundation

enum LapType {
    case normal, best, worst
}

struct LapItemRecord: Identifiable {
    let id = UUID()
    var lap: String = ""
    var time: String = ""
    var type: LapType = .normal
}
