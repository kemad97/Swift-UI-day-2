//
//  EmployeeListView.swift
//  Swift UI day 2
//
//  Created by Kerolos on 26/05/2025.
//

import SwiftUI

struct EmployeeListView: View {
    
    @State private var employees: [Employee] = []
    let url : String = "https://media.istockphoto.com/id/1399565382/photo/young-happy-mixed-race-businessman-standing-with-his-arms-crossed-working-alone-in-an-office.jpg?s=1024x1024&w=is&k=20&c=fRiq_aLd5eX7bjr9Y0umM-b0kIxYDewARvO_9Ykqayc="
    
    var body: some View {
        NavigationView {
            List {
                ForEach(employees) { employee in
                    NavigationLink {
                        EmployeeDetailView(employee: employee)
                    } label: {
                        HStack(spacing: 12) {
                            AsyncImage(url: URL(string: url)) { result in
                                switch result {
                                case .empty:
                                    Image("person_placeholder")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50 , height: 50)
                                        .clipShape(Circle())
                                        .aspectRatio(contentMode: .fill)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                case .failure:
                                    Image("person_placeholder")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                @unknown default:
                                    fatalError()
                                }
                            }
                            
                            Text(employee.name)
                                .font(.headline)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .onDelete(perform: deleteEmployees)
            }
            .navigationTitle("Employees")
            .toolbar {
                ToolbarItem() {
                    EditButton()
                }
            }
            .onAppear {
                fetchEmployees()
            }
        }
    }
    
    func deleteEmployees(at offsets: IndexSet) {
        employees.remove(atOffsets: offsets)
    }
    
    func fetchEmployees() {
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/1y7yqdefyayegzo/employeelist.json?dl=0") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data,
               let decodedEmployees = try? JSONDecoder().decode([Employee].self, from: data) {
                DispatchQueue.main.async {
                    self.employees = decodedEmployees
                }
            }
        }.resume()
    }
}

#Preview {
    EmployeeListView()
}
