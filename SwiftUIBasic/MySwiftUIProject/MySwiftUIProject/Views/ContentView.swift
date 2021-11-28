//
//  ContentView.swift
//  MySwiftUIProject
//
//  Created by 심지원 on 2021/11/26.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      VStack(alignment: .leading) {
        Text("Doori Rock")
          .font(.headline)
        HStack {
          Text("Doori-doori National Park")
          Spacer()
          Text("California")
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
        
        Divider()
        
        Text("About Doori-Doori Park")
          .font(.title2)
        Text("Descriptive text goes here")
      }
      .padding()
      Spacer()
      
    }
  }
}

// Editor -> Canvas
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
