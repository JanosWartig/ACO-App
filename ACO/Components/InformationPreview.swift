//
//  InformationPreview.swift
//  ACO
//
//  Created by Janos Wartig on 08.06.22.
//

import SwiftUI

struct InformationPreview: View {
    
    var selectedAnnotation: Binding<UUID>
    var dataModal: DataModal?
    
    init(selectedAnnotation: Binding<UUID>) {
        self.selectedAnnotation = selectedAnnotation
        for data in Database.data {
            if data.id == selectedAnnotation.wrappedValue {
                self.dataModal = data
            }
        }
    }
    
    var body: some View {
        HStack {
            Image((self.dataModal?.getImageName())!)
                .resizable()
                .frame(width: 110, height: 115)
            VStack() {
                HStack {
                    Text("Tag: " + (self.dataModal?.getTag().rawValue)!)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "heart")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }.padding(.top, 10.0)
                Spacer()
                Text("Ort: " + (self.dataModal?.getName())!)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .font(.footnote)
                    .foregroundColor(.black)
                Spacer()
                Text("Füllstand: " + String((self.dataModal?.getFuellstand())!) + "%")
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .font(.footnote)
                    .foregroundColor(.black)
                Spacer()
                Text("Letzte Wartung: " + (self.dataModal?.getLetzteWartung())!)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .font(.footnote)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
            }
            Spacer()
        }
        .frame(width: 340, height: 115)
        .background(.white)
        .cornerRadius(15)
        .padding()
        .shadow(color: .gray, radius: 5, x: 0, y: 0)
        //.buttonStyle(EventPreviewButtonStyle())
    }
}
