//
//  MySwiftUIProjectApp.swift
//  MySwiftUIProject
//
//  Created by 심지원 on 2021/11/26.
//

import SwiftUI

@main
struct MySwiftUIProjectApp: App {
  
  @StateObject private var modelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(modelData)
    }
  }
}
