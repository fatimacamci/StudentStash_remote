//
//  CameraButton_View.swift
//  StudentStash
//
//  Created by Fatima Camci on 7/26/23.
//

import SwiftUI
struct CameraButton_View: View {
    @Binding var showActionSheet: Bool
    var body: some View {
        Button(action: {
            self.showActionSheet.toggle()
        }) {
            RoundedRectangle (cornerRadius: 30)
                .frame (width: 38, height: 38, alignment: .center)
                .foregroundColor(.white)
                .overlay (
                    RoundedRectangle (cornerRadius: 30)
                        .frame (width: 36, height: 36, alignment: .center)
                        .foregroundColor (Color.init(red: 200/255, green: 200/255, blue: 200/255))
                        .overlay(
                            Image (systemName: "camera.fill")
                                .foregroundColor(.black)
                            )
                    )
                }
        }
    }

struct CameraButton_View_Previews: PreviewProvider {
    static var previews: some View {
        CameraButton_View(showActionSheet: .constant(false))
            .previewLayout (.sizeThatFits)
            .padding ()
    }
}
