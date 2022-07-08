//
//  Buttons.swift
//  ACO
//
//  Created by Janos Wartig on 08.06.22.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ButtonRow: View {
    
    @Binding var showEventDetailsPage : Bool
    
    var body: some View {
        HStack {
            CrossButton()
                .onTapGesture {
                    self.showEventDetailsPage.toggle()
                }
            Spacer()
            SendButton()
            LikeButton()
                .padding(.leading, 7.0)
            
        }.padding(.horizontal, Constant.Padding.horizontal)
            .padding(.top, 40)
    }
}

class ButtonSize {
    static let SIZE: CGFloat = 12
}

struct CrossButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .foregroundColor(.black)
            .padding(ButtonSize.SIZE)
            .background(Circle().stroke(Color.gray, lineWidth: 0.5).background(Circle().foregroundColor(Color.white)))
    }
}

struct SendButton: View {
    var body: some View {
        Image(systemName: "square.and.arrow.up")
            .foregroundColor(.black)
            .padding(ButtonSize.SIZE)
            .background(Circle().stroke(Color.gray, lineWidth: 0.5).background(Circle().foregroundColor(Color.white)))
    }
}

struct LikeButton: View {
    var body: some View {
        Image(systemName: "heart")
            .foregroundColor(.black)
            .padding(ButtonSize.SIZE)
            .background(Circle().stroke(Color.gray, lineWidth: 0.5).background(Circle().foregroundColor(Color.white)))
    }
}



struct ProfileButton: View {
    var body: some View {
        Image(systemName: "person")
            .foregroundColor(.black)
            .font(.system(size: 60))
            .padding(30)
            .background(Circle().stroke(Color.gray, lineWidth: 0.5).background(Circle().foregroundColor(Color.white)))
    }
}

struct EventPreviewButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1)
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
