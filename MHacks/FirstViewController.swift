//
//  FirstViewController.swift
//  MHacks
//
//  Created by Francis Zamora on 10/7/16.
//  Copyright © 2016 Francis. All rights reserved.
//
import ArcGIS
import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var DoneButton: UIButton!

    @IBOutlet weak var mapView: AGSMapView!
  
    var sketchLyr = AGSSketchGraphicsLayer()
    var myGraphicsLayer = AGSGraphic()
    var point = AGSPoint()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        DoneButton.isHidden=true
        
        NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.respondToGeomChanged(notification:)), name: NSNotification.Name.AGSSketchGraphicsLayerGeometryDidChange, object: nil)
        
        //Add a basemap tiled layer
       // let url = NSURL(string: "http://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base MapServer")
        //let bingLayer =  AGSBingMapLayer(url: url as URL!)
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
        self.mapView.locationDisplay.wanderExtentFactor = 0.50
        
        self.mapView.addMapLayer(sketchLyr, withName: "Sketch Layer")
        //empty geometry for new sketch
        let sketchPolygon = AGSMutablePolygon(spatialReference: self.mapView.spatialReference)
        sketchLyr.geometry = sketchPolygon
        self.mapView.touchDelegate = sketchLyr
        
        // DoneButton.isHidden=false
        // get JSON and convert to latitude and longitude and add to sketch layout
        point = AGSPoint(x:37.788607, y:-122.406211, spatialReference: AGSSpatialReference.wgs84())
        let sms = AGSSimpleMarkerSymbol();
        let graphic = AGSGraphic(geometry: point, symbol: sms)
        sketchLyr.addGraphic(graphic)
        
        //compare sketch layout 
        
       //let x =  sketchPolygon?.contains(point)
        //while(x)! {
          //  print("Out of Bounds")
        //}
        
        
        
        
        // sketchPolygon?.contains(self.mapView.locationDisplay.mapLocation())
        //sketchPolygon
        

        
        //let newgeo = self.mapView.locationDisplay.mapLocation()
        
        //if (AGSGeometryEngine.geometry(<#T##AGSGeometryEngine#>:,sketchLyr)){
       //     print("out of bounds")
     //   }
        
        
    
        
        //or, existing geometry for modifying sketch
        //sketchPolygon = polygon.mutableCopy() as AGSMutablePolygon
        

    //self.map = AGSMap(basemapType: .ImageryWithLabels, latitude: -33.867886, longitude: -63.985,
        
   // func mapViewDidLoad(mapView: AGSMapView!) {
     //       self.mapView.locationDisplay.startDataSource()
       // }
      
    
    
    //3. Implement the layer delegate method
   // func mapViewDidLoad(mapView: AGSMapView!) {
        //do something now that the map is loaded
        //for example, show the current location on the map
       // mapView.locationDisplay.startDataSource()
   // }
  


        
        
    }
    
    func respondToGeomChanged(notification:NSNotification) {
        print("hit")
        
        counter += 1
        if counter == 5 {
            DoneButton.isHidden = false
        }
    }

    @IBAction func SaveSketch(_ sender: Any) {
        
        let geometry = sketchLyr.geometry
       // self.mapView.addMapLayer(sketchLyr, withName:"Graphics Layer")
        self.mapView.touchDelegate = nil

        let geoEngine = AGSGeometryEngine()
        if geoEngine.geometry(geometry, contains: point) {
            print("The point is contained in the geometry")
        } else {
            print("The point is not contained.")
        }
        /*
        let sketchGeometry = self.sketchLyr.geometry.copy() as! AGSGeometry
        //If this is not a new sketch (i.e we are modifying an existing graphic)
        if self.myGraphicsLayer != nil {
            //Modify the existing graphic giving it the new geometry
            self.myGraphicsLayer.geometry = sketchGeometry
            self.myGraphicsLayer = nil
            
       
            
        }else {
            //Add a new graphic to the graphics layer
            let graphic = AGSGraphic(geometry: sketchGeometry, symbol: nil, attributes: nil)
            self.graphicsLayer.addGraphic(graphic)
            
            //enable the select tool if there is atleast one graphic to select
            self.sketchTools.setEnabled(self.graphicsLayer.graphicsCount > 0, forSegmentAtIndex: 3)
            
        }
        
        self.sketchLayer.clear()
        self.sketchLayer.undoManager.removeAllActions()
 */

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

