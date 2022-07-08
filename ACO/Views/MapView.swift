//
//  Preview.swift
//  ACO
//
//  Created by Janos Wartig on 07.06.22.
//

import SwiftUI
import MapKit

struct Constant {
    struct Padding {
        static let horizontal: CGFloat = 20
    }
    struct ButtonSize {
        static let size: CGFloat = 32
    }
}

struct MapView: View {
    @State var showEventPreview: Bool = false
    @State var showEventDetailsPage: Bool = false
    @State var selectedAnnotation: UUID
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 53.555252,
                                       longitude: 9.9599259),
        latitudinalMeters: 8000,
        longitudinalMeters: 8000
    )
    @State var selectedCategory: String = "Wasserspeicher"
    
    private func getImageName() -> String {
        var imageName: String = ""
        switch self.selectedCategory {
        case "Wasserspeicher":
                imageName = "house"
        case "Weiterer Filter":
                imageName = "lasso"
        case "Weiterer Filter 2":
                imageName = "opticaldiscdrive.fill"
        case "Weiterer Filter 3":
                imageName = "trash"
        default:
            break
        }
        return imageName
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image("ACO")
                    .resizable()
                    .frame(width: 70, height: 45)
                    .scaledToFit()
                    .clipped()
                    .padding(.top, 40)
                Categories(selectedCategory: $selectedCategory)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                ZStack {
                    Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: Database.data, annotationContent: { data in
                       MapAnnotation(coordinate: data.getCoordinates())  {
                           CustomAnnotation(data: data, selectedAnnotation: $selectedAnnotation, showPreview: $showEventPreview, imageName: self.getImageName())
                        }
                    })
                    .preferredColorScheme(.light)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5)) {
                           // self.showEventPreview = false
                        }
                    }
                    VStack {
                        if (self.showEventPreview) {
                            Spacer()
                            InformationPreview(selectedAnnotation: $selectedAnnotation)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                                        self.showEventDetailsPage = true
                                    }
                                    
                                }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showEventDetailsPage, content: {
            DetailView(selectedAnnotation: $selectedAnnotation, showEventDetailPage: $showEventDetailsPage, imageName: self.getImageName())
        })
        
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        MapView(selectedAnnotation: UUID())
    }
}
