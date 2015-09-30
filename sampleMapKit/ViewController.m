//
//  ViewController.m
//  sampleMapKit
//
//  Created by 川端杏奈 on 2015/09/17.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MapViewオブジェクトを生成
    MKMapView *mapView = [[MKMapView alloc] init];
    
    //デリゲートを設定
    mapView.delegate = self;
    
    //大きさ、位置を決定
    mapView.frame = CGRectMake(0,20,self.view.bounds.size.width,self.view.bounds.size.height-20);
    
    //表示位置を決定
    CLLocationCoordinate2D co;
    
    //アヤラの位置を決定
    co.latitude = 10.317347;//緯度
    co.longitude = 123.905759;//軽度
    
    [mapView setCenterCoordinate:co];
    
    //縮尺を指定
    MKCoordinateRegion cr = mapView.region;
    
    //地図の範囲を指定(緯度)
    cr.span.latitudeDelta = 0.5;
    
    //地図の範囲を指定(軽度)
    cr.span.longitudeDelta = 0.5;
    
    cr.center = co;
    
    [mapView setRegion:cr];
    
    //地図の表示種類の設定
    mapView.mapType = MKMapTypeStandard;
    
    //ピンを立てる
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = CLLocationCoordinate2DMake(10.317347,123.905759);
    
    pin.title = @"アヤラ";
    pin.subtitle = @"セブで一番大きい";
    
    [mapView addAnnotation:pin];
    
    //ピンを立てる2
    MKPointAnnotation *pin2 = [[MKPointAnnotation alloc] init];
    pin2.coordinate = CLLocationCoordinate2DMake(10.311715,123.918332);
    
    pin2.title = @"SMモール";
    pin2.subtitle = @"セブで２番目に大きい";
    
    [mapView addAnnotation:pin2];
    
    //ピンを立てる3
    MKPointAnnotation *pin3 = [[MKPointAnnotation alloc] init];
    pin3.coordinate = CLLocationCoordinate2DMake(10.314276,123.90535);
    
    pin3.title = @"2QUAD";
    pin3.subtitle = @"NexSeed";
    
    [mapView addAnnotation:pin3];
    
    //ピンを立てる4
    MKPointAnnotation *pin4 = [[MKPointAnnotation alloc] init];
    pin4.coordinate = CLLocationCoordinate2DMake(10.314564,123.891777);
    
    pin4.title = @"セブ・ドクターズ・ユニバーシティ病院";
    pin4.subtitle = @"ジャパニーズヘルプデスク";
    
    [mapView addAnnotation:pin4];
    
    //ピンを立てる5
    MKPointAnnotation *pin5 = [[MKPointAnnotation alloc] init];
    pin5.coordinate = CLLocationCoordinate2DMake(10.310474,123.890833);
    
    pin5.title = @"チョン・フア病院";
    pin5.subtitle = @"Don Mariano Cui Street, Fuente Osmeña, Cebu City, 6000 フィリピン";
    
    [mapView addAnnotation:pin5];
    
    //現在地を表示させる
    mapView.showsUserLocation = YES;
    
    //表示するためにViewに追加
    [self.view addSubview:mapView];
    
    
}

    //ピンを表示する際に発動されるデリゲートメソッド
    //ピンが降ってくるアニメーションの設定
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
   
    
    //現在地表示なら nil を返す
    if(annotation == mapView.userLocation){
        return nil;
    }
    static NSString *pinIdentifier = @"PinAnnotationID";
    
    //ピン情報の再利用
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinIdentifier];
    
    if(pinView == nil){
        //初期化
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinIdentifier];
        
        //落ちるアニメーションの設定
        pinView.animatesDrop = YES;
      }
    //吹き出し設定
    pinView.canShowCallout = YES;
    
    return pinView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
