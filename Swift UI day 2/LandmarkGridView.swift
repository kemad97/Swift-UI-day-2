//
//  LandmarkGridView.swift
//  Swift UI day 2
//
//  Created by Kerolos on 28/05/2025.
//

import SwiftUI

struct LandmarkGridView: View {
    
    @State var landmarks:[Landmark] = loadLandmarks()
    @State var showAlert = false
    @State var landmarkToDelete : Landmark?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible() )
    ]
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns,spacing : 15) {
                    ForEach(landmarks) {landmark in
                        VStack{
                            Image(landmark.imageName)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                            
                            Text(landmark.name)
                                .padding(.top,4)
                            
                            Button(action : {
                                landmarkToDelete = landmark
                                showAlert = true
                                
                            }){
                                Image(systemName: "trash.fill")
                                    .foregroundColor(.red)
                                    .background(Circle().fill(Color.white))
                                    .font(.title2)
                            }
                        }
                    }
                }
                .padding()
            }
            
        }
        .navigationTitle("LandMarks")
        .alert("Delete Landmark", isPresented: $showAlert) {
                        Button("Cancel", role: .cancel) { }
                        Button("Delete", role: .destructive) {
                            if let landmark = landmarkToDelete {
                                deleteLandmark(landmark)
                            }
                        }
                    } message: {
                        Text("Are you sure to delete \(landmarkToDelete?.name)?")
                    }
    }
    
    
    func deleteLandmark(_ landmark: Landmark) {
        landmarks.removeAll { $0.id == landmark.id }
        
    }
}





func loadLandmarks() -> [Landmark]{
    guard let url = Bundle.main.url(forResource: "landmarkData", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let landmarks = try? JSONDecoder().decode([Landmark].self, from: data) else {
        return []
    }
    
    return landmarks
    
}

#Preview {
    LandmarkGridView()
}
