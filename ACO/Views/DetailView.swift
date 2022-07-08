//
//  DetailView.swift
//  ACO
//
//  Created by Janos Wartig on 08.06.22.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    var showEventDetailPage: Binding<Bool>
    var selectedAnnotation: Binding<UUID>
    var dataModal: DataModal?
    var imageName: String
    @State var region2 = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 53.555252,
                                       longitude: 9.9599259),
        latitudinalMeters: 8000,
        longitudinalMeters: 8000
    )
    
    init(selectedAnnotation: Binding<UUID>, showEventDetailPage: Binding<Bool>, imageName: String) {
        self.selectedAnnotation = selectedAnnotation
        self.showEventDetailPage = showEventDetailPage
        self.imageName = imageName
        for data in Database.data {
            if data.id == selectedAnnotation.wrappedValue {
                self.dataModal = data
            }
        }
        /*
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: (self.dataModal?.getCoordinates().latitude.binade)!,
                                           longitude: (self.dataModal?.getCoordinates().longitude.binade)!),
            latitudinalMeters: 8000,
            longitudinalMeters: 8000
        ) */
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image((self.dataModal?.getImageName())!)
                    .resizable()
                    .ignoresSafeArea()
                    .frame(height: 310)
                    .overlay(ButtonRow(showEventDetailsPage: self.showEventDetailPage), alignment: .top)
                Place(dataModal: self.dataModal)
                Messungen(dataModal: self.dataModal)
                HStack {
                    Text("Letzte Wartung: ")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text((self.dataModal?.getLetzteWartung())!)
                    Spacer()
                }.padding(.horizontal, Constant.Padding.horizontal)
                Divider()
                    .padding(.bottom, 10)
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: (self.dataModal?.getCoordinates())!, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))), annotationItems: [(self.dataModal)!], annotationContent: { location in
                    MapAnnotation(coordinate: location.getCoordinates())  {
                        CustomAnnotation(data: self.dataModal.unsafelyUnwrapped, selectedAnnotation: .constant(UUID()), showPreview: .constant(false), imageName: self.imageName)
                     }
                })
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .padding(.horizontal, Constant.Padding.horizontal)
                    .padding(.bottom, 30)
                /*
                Map(coordinateRegion: $region2, annotationItems: [(self.dataModal)!]) { location in
                    MapAnnotation(coordinate: location.getCoordinates())  {
                        CustomAnnotation(data: self.dataModal.unsafelyUnwrapped, selectedAnnotation: .constant(UUID()), showPreview: .constant(false), imageName: (self.dataModal?.getImageName())!)
                     }
                } */
            }
        }.ignoresSafeArea()
    }
}

struct Place: View {
    
    var dataModal: DataModal?
    
    var body: some View {
        HStack {
            Text("Tag: ")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text((self.dataModal?.getTag().rawValue)!)
            Spacer()
        }.padding(.horizontal, Constant.Padding.horizontal)
        Divider()
            .padding(.bottom, 10)
        HStack {
            Text("Ort: ")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text((self.dataModal?.getName())!)
            Spacer()
        }.padding(.horizontal, Constant.Padding.horizontal)
        Divider()
            .padding(.bottom, 10)
        HStack {
            Text("Koordinaten: ")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text((self.dataModal?.getCoordinates().latitude.formatted())! + " " + (self.dataModal?.getCoordinates().longitude.formatted())!)
            Spacer()
        }.padding(.horizontal, Constant.Padding.horizontal)
        Divider()
            .padding(.bottom, 10)
    }
}

struct Messungen: View {
    
    var dataModal: DataModal?
    
    var body: some View {
        HStack {
            Text("Füllstand: ")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(String((self.dataModal?.getFuellstand())!) + "%")
            Spacer()
        }.padding(.horizontal, Constant.Padding.horizontal)
        Divider()
            .padding(.bottom, 10)
        HStack {
            Text("Trübheit: ")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(String((self.dataModal?.getTruebheit())!) + "%")
            Spacer()
        }.padding(.horizontal, Constant.Padding.horizontal)
        Divider()
            .padding(.bottom, 10)
        HStack {
            Text("Salzhaltigkeit: ")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(String((self.dataModal?.getSalzhaltigkeit())!) + "%")
            Spacer()
        }.padding(.horizontal, Constant.Padding.horizontal)
        Divider()
            .padding(.bottom, 10)
    }
}
