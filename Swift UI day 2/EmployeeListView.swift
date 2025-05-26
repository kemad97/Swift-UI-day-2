//
//  EmployeeListView.swift
//  Swift UI day 2
//
//  Created by Kerolos on 26/05/2025.
//

import SwiftUI

struct EmployeeListView: View {
    @State private var employees : [Employee] = []
    
    var body : some View {
        NavigationView{
            List (employees) { employee in
                NavigationLink {
                    EmployeeDetailView(employee: employee)
                } label: {
                    VStack(alignment: .leading) {
                        Text(employee.name)
                            .font(.headline)
                        
                        Text(employee.email)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Employees")
            .onAppear() {
                fetchEmployees()
            }
            
        }
    }
    
    
}




#Preview {
    EmployeeListView()
}
