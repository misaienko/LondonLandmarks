//
//  DetailViewController.m
//  LondonLandmarksApp
//
//  Created by Admin on 12/06/2023.
//

#import "DetailViewController.h"
#import "MapPin.h"

@interface DetailViewController ()

@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView.layer.cornerRadius =5;
    self.button.layer.cornerRadius =5;
    
    self.navigationItem.title = self.detailModal[0];
    //display title in navigation bar - 0 / first entry inside the Array
    self.detailTitle.text = self.detailModal[0];
    //  Setting the Title to display same info as in the Navigation
    self.detailAddress.text = self.detailModal[1];
    // 1 - adress has second entry
    self.detailImage.image =[UIImage imageNamed:self.detailModal[2]];
    self.detailDescription.text = self.detailModal[3];
    
MKCoordinateRegion region;
MKCoordinateSpan span;
    // To make map view load a certain location
 span.latitudeDelta = 0.005;
 span.longitudeDelta = 0.005;
    //zoom
    
    CLLocationCoordinate2D location;
    
    location.latitude = [self.detailModal[4]doubleValue];
    location.latitude = [self.detailModal[5]doubleValue];
    
region.span = span;
region.center = location;
    
[self.mapView setRegion:region animated:YES];
    
    MapPin *ann = [[MapPin alloc] init];
    ann.coordinate =location;
    //ann- annotation
    
    [self.mapView addAnnotation:ann];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)directions:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/?daddr=%@,%@",self.detailModal[4],self.detailModal[5]]] options:@{} completionHandler:nil];
    //places latityde and longitude inside of map link
}
@end
