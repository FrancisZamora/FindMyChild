//
//  SecondViewController.swift
//  MHacks
//
//  Created by Francis Zamora on 10/7/16.
//  Copyright © 2016 Francis. All rights reserved.
//
import ArcGIS
import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var mapView: AGSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let bingMapsKey = "ArlAdV3x_irdGyR2dJ_gFaR8vTil3xiyiXvA3HHQZoiB1U_HnV6Tr8uL_Fz9yKkV"
        let layer = AGSBingMapLayer(appID: bingMapsKey, style: .road)
        self.mapView.addMapLayer(layer, withName: "Bing Layer")
        if (layer?.loaded)! {
            print("Spatial Reference : \(layer?.spatialReference)")
        }
        if !self.mapView.locationDisplay.isDataSourceStarted {
            self.mapView.locationDisplay.startDataSource()
            
        }
        self.mapView.locationDisplay.autoPanMode = .navigation
        self.mapView.locationDisplay.wanderExtentFactor = 1.75

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

