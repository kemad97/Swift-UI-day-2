//
//  Employee.swift
//  Swift UI day 2
//
//  Created by Kerolos on 26/05/2025.
//

import Foundation

struct Employee: Identifiable , Codable {
    let id: String
    let name: String
    let about: String
    let email: String
}
