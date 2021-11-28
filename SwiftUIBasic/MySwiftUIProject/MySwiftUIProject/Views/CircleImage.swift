//
//  CircleImage.swift
//  MySwiftUIProject
//
//  Created by 심지원 on 2021/11/26.
//

import SwiftUI

struct CircleImage: View {
  var image: Image
  var body: some View {
    image
//      .resizable()
//      .frame(width: 150, height: 150, alignment: .center)
      .clipShape(Circle())
      .overlay(
        Circle().stroke(Color.white, lineWidth: 5)
      )
      .shadow(radius: 7)
  }
}

struct CircleImage_Previews: PreviewProvider {
  static var previews: some View {
    CircleImage(image: Image("Doori"))
  }
}
