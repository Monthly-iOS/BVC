//
//  Flowers.swift
//  week1
//
//  Created by 양승혜 on 4/5/24.
//

import SwiftUI

// MARK: Plant Model And Sample Data
struct Post: Identifiable,Equatable{
    var id = UUID().uuidString
    var postImage: String
}
