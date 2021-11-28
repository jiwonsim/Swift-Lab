//
//  LandmarkDetail.swift
//  MySwiftUIProject
//
//  Created by 심지원 on 2021/11/28.
//

import SwiftUI

struct LandmarkDetail: View {
  var landmark: Landmark
  var body: some View {
    ScrollView {
      MapView(coordinate: landmark.locationCoordinator)
        .ignoresSafeArea(edges: .top)
        .frame(height: 300)
      
      CircleImage(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)
      
      VStack(alignment: .leading) {
        Text(landmark.name)
          .font(.title)
        HStack {
          Text(landmark.park)
          Spacer()
          Text(landmark.state)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
        
        Divider()
        
        Text("About \(landmark.name)")
          .font(.title2)
        Text(landmark.description)
        
      }
      .padding()
      Spacer()
    }
    .navigationTitle(landmark.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkDetail(landmark: landmarks[0])
  }
}
