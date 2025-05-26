//
//  EmployeeDetailView.swift
//  Swift UI day 2
//
//  Created by Kerolos on 26/05/2025.
//

import SwiftUI



struct EmployeeDetailView: View {
    let employee: Employee
    let url : String = "https://media.istockphoto.com/id/1399565382/photo/young-happy-mixed-race-businessman-standing-with-his-arms-crossed-working-alone-in-an-office.jpg?s=1024x1024&w=is&k=20&c=fRiq_aLd5eX7bjr9Y0umM-b0kIxYDewARvO_9Ykqayc="
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: url)){ result in
                    switch result {
                    case .empty:
                        Image("person_placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120 , height: 120)
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)

                    case .success(let image):
                        image .resizable()
                            .frame(width: 120 , height: 120)
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)

                    case .failure(let error):
                        Image("person_placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120 , height: 120)
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)

                    @unknown default:
                        Image("person_placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120 , height: 120)
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)
                    }
                }
               
                    Text(employee.name)
                        .font(.largeTitle)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.headline)
                            
                        
                        Text(employee.email)
                            .font(.body)
                        
                        Text("About")
                            .font(.headline)
                            
                        
                        Text(employee.about)
                            .font(.body)
                    }
                    
                   
                }
                .padding()
            }
            .navigationTitle("Employee Details")
        }
    }
    
    
#Preview {
    NavigationView {
        EmployeeDetailView(employee: Employee(
            id: "",
            name: " ",
            about: "  ",
            email: ""
        ))
    }
}
