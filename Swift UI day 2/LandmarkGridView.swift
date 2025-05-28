//
//  LandmarkGridView.swift
//  Swift UI day 2
//
//  Created by Kerolos on 28/05/2025.
//

import SwiftUI
import SwiftData


struct LandmarkGridView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var landmarks: [Landmark]
    @State var showAlert = false
    @State var landmarkToDelete : Landmark?
    
    @State var editingLandmarkId: Int? = nil
    @State var editedImageName: String = ""
    
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
                            
                            if (editingLandmarkId == landmark.id){
                                HStack{
                                    TextField("Image Name", text: $editedImageName)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .frame(width: 120)
                                    Button(action: {
                                        landmark.name = editedImageName
                                        editingLandmarkId = nil
                                    }){
                                        Image(systemName: "checkmark.circle.fill")
                                    }
                                    
                                    
                                }
                            }
                           
                            HStack {
                                
                                // Edit button
                                Button(action: {
                                    editingLandmarkId = landmark.id
                                    editedImageName = landmark.imageName
                                }) {
                                    Image(systemName: "pencil.circle.fill")
                                }
                                
                                
                                // Delete button
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
        .onAppear {
            if landmarks.isEmpty {
                addDummyData()
            }
            
        }
    }
    
    
    func deleteLandmark(_ landmark: Landmark) {
        modelContext.delete(landmark)
        
    }
    
    
    
    func addDummyData() {
        let dummyLandmarks = [
            Landmark(id: 1, name: "silversalmoncreekk", imageName: "silversalmoncreek"),
            Landmark(id: 2, name: "silversalmoncreekk", imageName: "silversalmoncreek"),

            Landmark(id: 3, name: "silversalmoncreekk", imageName: "silversalmoncreek"),

            Landmark(id: 4, name: "silversalmoncreekk", imageName: "silversalmoncreek"),

            Landmark(id: 5, name: "silversalmoncreekk", imageName: "silversalmoncreek"),
            
            
        ]
        
        for landmark in dummyLandmarks {
            modelContext.insert(landmark)
        }
    }
}






#Preview {
    LandmarkGridView()
}
