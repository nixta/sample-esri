sample-esri
===========

Clone project

  git clone https://github.com/bamse16/sample-esri
  cd sample-esri/
  
Edit `Podfile` and uncomment the `ArcGIS-Runtime-SDK-iOS` line.

  pod install
  open "Sample ArcGIS.xcworkspace"
  
Build and run the project. The map should load, but it won't.

Edit `ViewController.m` and comment line 27:

  [self.mapView addMapLayer:[AGSGraphicsLayer graphicsLayer]];
  
Build and run the project again. The map will load.
