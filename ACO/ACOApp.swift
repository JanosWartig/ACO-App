//
//  ACOApp.swift
//  ACO
//
//  Created by Janos Wartig on 07.06.22.
//

import SwiftUI

@main
struct ACOApp: App {
    var body: some Scene {
        WindowGroup {
            MapView(selectedAnnotation: UUID())
        }
    }
}
