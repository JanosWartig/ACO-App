//
//  MapFilter.swift
//  ACO
//
//  Created by Janos Wartig on 08.06.22.
//

import SwiftUI

struct MapFilter: View {
    var body: some View {
        Text("2")
    }
}

struct Category: View {
    
    let icon: String
    let name: String
    let backgroundColor: Color
    let foregroundColor: Color
    @Binding var selectedCategory: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .font(.headline)
                .foregroundColor(foregroundColor)
                .padding(6)
                .background(backgroundColor)
                .cornerRadius(36)
            Text(name)
                .font(.system(size: 14))
                .foregroundColor(selectedCategory == name ? Color.black : Color.gray)
        }.onTapGesture {
            self.selectedCategory = name
        }
    }
}

struct Categories: View {
    
    @Binding var selectedCategory: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                Category(icon: "house", name: "Wasserspeicher", backgroundColor: Color.red, foregroundColor: Color.white, selectedCategory: $selectedCategory)
                Category(icon: "lasso", name: "Weiterer Filter", backgroundColor: Color.red, foregroundColor: Color.white, selectedCategory: $selectedCategory)
                Category(icon: "opticaldiscdrive.fill", name: "Weiterer Filter 2", backgroundColor: Color.red, foregroundColor: Color.white, selectedCategory: $selectedCategory)
                Category(icon: "trash", name: "Weiterer Filter 3", backgroundColor: Color.red, foregroundColor: Color.white, selectedCategory: $selectedCategory)
            }
        }.padding(.horizontal, Constant.Padding.horizontal)
    }
}

struct MapFilter_Previews: PreviewProvider {
    static var previews: some View {
        MapFilter()
    }
}
