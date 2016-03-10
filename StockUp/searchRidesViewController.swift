//
//  searchRidesViewController.swift
//  StockUp
//
//  Created by Pranav Achanta on 3/10/16.
//  Copyright © 2016 Franky Liang. All rights reserved.
//

import UIKit
import CoreLocation

class searchRidesViewController: UIViewController, CLLocationManagerDelegate{

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Location Manager Instance
    var locationManager : CLLocationManager!
    
    // Current Location
    var currentLocation : CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Get the Location
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 100
        locationManager.requestWhenInUseAuthorization()
    }
    
    // Location Manager Specific Methods
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.stopUpdatingLocation()
            locationManager.startUpdatingLocation()
        }
    }
    
    
    // Location Manager Service
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Try to Do Something here
        if let location = locations.first {
            currentLocation = location
            searchRides()
        }
    }
    
    func locationManager(manager: CLLocationManager,
        didFailWithError error: NSError){
            print("Error while updating location " + error.localizedDescription)
    }
    
    func searchRides(){
        let url = NSURL(string:"http://instagroundup.herokuapp.com/")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    let dataString = NSString(data: data, encoding: NSUTF8StringEncoding)
                    print(dataString!)
                }
        });
        task.resume()
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
