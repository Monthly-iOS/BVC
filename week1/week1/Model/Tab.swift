//
//  Tab.swift
//  week1
//
//  Created by 양승혜 on 4/5/24.
//

import SwiftUI

struct Tab: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    // Tab Animation Properties
    var width: CGFloat = 0
    var minX: CGFloat = 0
}

var tabs_: [Tab] = [
    .init(title: "TODAY"),
    .init(title: "DISCOVER")
]
