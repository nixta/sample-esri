//
//  ViewController.m
//  Sample ArcGIS
//
//  Created by Marius Ursache on 29/10/2014.
//  Copyright (c) 2014 Simple Track. All rights reserved.
//

#import "ViewController.h"
#import <ArcGIS/ArcGIS.h>

@interface ViewController ()<AGSWebMapDelegate>

@property (nonatomic, strong) IBOutlet AGSMapView *mapView;
@property (nonatomic, strong) AGSWebMap *esriWebMap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Adding a blank layer before loading the AGSWebMap will break the loading of the map
    // Also didOpenWebMap is no longer called. 
    [self.mapView addMapLayer:[AGSGraphicsLayer graphicsLayer]];
    
    self.esriWebMap = [AGSWebMap webMapWithItemId:@"d802f08316e84c6592ef681c50178f17" credential:nil];
    self.esriWebMap.delegate = self;
    self.esriWebMap.zoomToDefaultExtentOnOpen = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AGSWebMapDelegate

- (void)webMapDidLoad:(AGSWebMap *)webMap {
    [self.esriWebMap openIntoMapView:self.mapView withAlternateBaseMap:nil resetMapView:NO];
    NSLog(@"webMapDidLoad");
}

- (void)webMap:(AGSWebMap *)webMap didLoadLayer:(AGSLayer *)layer {
    NSLog(@"layer loaded");
}

- (void)didOpenWebMap:(AGSWebMap *)webMap intoMapView:(AGSMapView *)mapView {
    NSLog(@"didOpenWebMap");
}

@end
