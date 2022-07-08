//
//  CustomAnnotation.swift
//  ACO
//
//  Created by Janos Wartig on 07.06.22.
//

import SwiftUI
import MapKit

struct CustomAnnotation: View {
    
    var selectedAnnotation: Binding<UUID>
    var showPreview: Binding<Bool>
    var data: DataModal
    var imageName: String

    init(data: DataModal, selectedAnnotation: Binding<UUID>, showPreview: Binding<Bool>, imageName: String) {
        self.data = data
        self.selectedAnnotation = selectedAnnotation
        self.showPreview = showPreview
        self.imageName = imageName
    }
    
    var body: some View {
        
        Button {
            // action
            self.selectedAnnotation.wrappedValue = self.data.id
            self.showPreview.wrappedValue = true
        } label: {
            VStack(spacing: 0) {
                Image(systemName: self.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(6)
                    .background(.red)
                    .cornerRadius(36)
                
                Image(systemName: "triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.red)
                    .frame(width: 8, height: 8)
                    .rotationEffect(Angle(degrees: 180))
                    .offset(y: -3)
                    .padding(.bottom, 40)
            }
        }.scaleEffect(self.data.id == selectedAnnotation.wrappedValue ? 1.5 : 1)
    }
}
