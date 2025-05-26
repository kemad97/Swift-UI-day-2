//
//  EmployeeDetailView.swift
//  Swift UI day 2
//
//  Created by Kerolos on 26/05/2025.
//

import SwiftUI



struct EmployeeDetailView: View {
    let employee: Employee
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(employee.name)
                    .font(.largeTitle)
                    .bold()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text(employee.email)
                        .font(.body)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("About")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text(employee.about)
                        .font(.body)
                }
            }
            .padding()
        }
        .navigationTitle("Employee Details")
    }
}

