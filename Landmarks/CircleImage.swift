//
//  CircleImage.swift
//  Landmarks
//
//  Created by adam janusewski on 6/23/22.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        VStack {
            Image("turtlerock")
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(color: .black, radius: 7)
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
