//
//  Landmark.swift
//  Swift UI day 2
//
//  Created by Kerolos on 28/05/2025.
//

import Foundation
import SwiftData


@Model
final class Landmark {
    var id: Int
    var name: String
    var imageName: String
    
    init(id: Int, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
}
