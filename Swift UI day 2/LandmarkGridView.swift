//
//  LandmarkGridView.swift
//  Swift UI day 2
//
//  Created by Kerolos on 28/05/2025.
//

import SwiftUI

struct LandmarkGridView: View {
    
    let landmarks:[Landmark] = loadLandmarks()
    
    let columns = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100))
        
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
                            
                            Text(landmark.name)
                                .padding(.top,4)
                        }
                    }
                }
                .padding()
            }
            
        }
        .navigationTitle("LandMarks")
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
