//
//  ContentView.swift
//  MySwiftUIProject
//
//  Created by 심지원 on 2021/11/26.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    LandmarkList()
  }
}

// Editor -> Canvas
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ModelData())
  }
}
