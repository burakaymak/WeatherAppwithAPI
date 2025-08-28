//
//  ViewController.swift
//  Wwapi
//
//  Created by Burak Kaymak on 28.08.2025.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate{
    
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
        
        let latitude = location.latitude
        let longitude = location.longitude
        
        let urlString = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=f4691278a069a9754e8156436b0e6e9a&units=metric&lang=en")
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlString!) { data, response, error in
            
            if error != nil 
            {
                
                let alert = UIAlertController(title: "Warning", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert,animated: true)
                
            }
            
            else
            {
                if data != nil 
                {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary <String,Any>
                        
                        DispatchQueue.main.async {
                            if let weatherArray = jsonResponse["weather"] as? [[String: Any]] {
                                if let firstWeather = weatherArray.first {
                                    if let description = firstWeather["description"] as? String {
                                        self.descriptionLabel.text = " Description : \(description)"
                                    }
                                }
                            }
                            
                            if let locationName = jsonResponse["name"] as? String {
                                  self.locationLabel.text = "Your Location : \(locationName)"
                              }
                            
                            if let main = jsonResponse["main"] as? [String : Any] {
                                
                                if let temp = main["temp"] as? Double {
                                    self.tempLabel.text = "Temperature : \(temp)"
                                    
                                    if let feelslike = main["feels_like"] as? Double {
                                        self.feelsLikeLabel.text = " Feels Like : \(feelslike)"
                                    }
                                }
                                
                                                                
                            }
                            
                          
                        }
                        
                        
                        
                        
                    } catch{
                        
                        
                    }
                   
                    
                    
                    
                }
                
                
            }
        }
        
        task.resume()
        
    }
    
    


}

