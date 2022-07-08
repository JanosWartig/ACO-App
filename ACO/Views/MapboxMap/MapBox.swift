//
//  MapBox.swift
//  ACO
//
//  Created by Janos Wartig on 08.07.22.
//

/*

struct MapboxMap: View {
    
    @Binding var showEventPreview: Bool
    
    var body: some View {
        MapBoxMapView(showEventPreview: $showEventPreview)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MapBoxMapView: UIViewControllerRepresentable {
    
    @Binding var showEventPreview: Bool
    
    func makeUIViewController(context: Context) -> MapViewController {
        return MapViewController(showEventPreview: $showEventPreview)
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        
    }
}

class MapViewController: UIViewController, LocationPermissionsDelegate {
    
    var showEventPreview: Binding<Bool>
    
    init(showEventPreview: Binding<Bool>) {
        self.showEventPreview = showEventPreview
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    internal var mapView: MapView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.mapSettings()
        mapView.location.delegate = self
        mapView.location.options.activityType = .other
        mapView.location.options.puckType = .puck2D()
        mapView.location.locationProvider.startUpdatingLocation()

        self.addMarker(latitude: 53.553202, longitude: 9.954518, imageName: "red_pin")
        self.addMarker(latitude: 53.551085, longitude: 9.993682, imageName: "red_pin")
        self.addMarker(latitude: 53.547963, longitude: 9.979138, imageName: "red_pin")
        self.view.addSubview(mapView)
/*
        self.addNewImage()
       mapView.mapboxMap.onNext(.mapLoaded) { _ in
           self.addNewImage()
       } */
        }

    
    
    private func mapSettings() {
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1IjoiamFub3MwMDciLCJhIjoiY2wydGlqZ2lpMDRqcjNjcDVkMTdkcXdpeSJ9.pJGa9rNFX7Hfn4tg2sxmTQ")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: CameraOptions(center: CLLocationCoordinate2D(latitude: 53.553202, longitude: 9.954518), zoom: 12), styleURI: StyleURI.streets)
        self.mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        self.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.mapView.gestures.options.pinchRotateEnabled = false
        self.mapView.gestures.options.pitchEnabled = false
        self.mapView.gestures.options.panDecelerationFactor = 0.75
        self.mapView.ornaments.logoView.isHidden = true
        self.mapView.ornaments.attributionButton.isHidden = true
        self.mapView.ornaments.scaleBarView.isHidden = true
    }
    
    private func addMarker(latitude: CLLocationDegrees, longitude: CLLocationDegrees, imageName: String) {
        // Initialize a point annotation with a geometry ("coordinate" in this case)
        var pointAnnotation = PointAnnotation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        // Make the annotation show a red pin
        pointAnnotation.image = .init(image: UIImage(named: imageName)!, name: imageName)
        pointAnnotation.iconAnchor = .bottom
       
        // Create the `PointAnnotationManager` which will be responsible for handling this annotation
        let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
        
        pointAnnotationManager.delegate = self
        
        
        // Add the annotation to the manager in order to render it on the map.
        pointAnnotationManager.annotations = [pointAnnotation]
    }
    
    private func addNewImage() {
        try! mapView.mapboxMap.style.addImage(UIImage(named: "Noho")!.resizeImageTo(size: CGSize(width: 32, height: 32))!,
        id: "noho",
        stretchX: [],
        stretchY: [])
    
    }
}

extension MapViewController: AnnotationInteractionDelegate {
    public func annotationManager(_ manager: AnnotationManager, didDetectTappedAnnotations annotations: [Annotation]) {
        print("Annotations tapped: \(annotations)")
        withAnimation(.easeInOut(duration: 0.4)) {
            self.showEventPreview.wrappedValue.toggle()
        }
        for item in annotations {
            print("Item ID's: \(item.id)")
        }
    
    }
}

extension UIImage {
    func resizeImageTo(size: CGSize) -> UIImage? {
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            self.draw(in: CGRect(origin: CGPoint.zero, size: size))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return resizedImage
        }
}

struct MapBox_Previews: PreviewProvider {
    static var previews: some View {
        MapboxMap(showEventPreview: .constant(true))
    }
}
 */
