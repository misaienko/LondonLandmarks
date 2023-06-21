//
//  DetailViewController.h
//  LondonLandmarksApp
//
//  Created by Admin on 12/06/2023.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSArray *detailModal;

@property (weak, nonatomic) IBOutlet UILabel *detailTitle;

@property (weak, nonatomic) IBOutlet UILabel *detailAddress;

@property (weak, nonatomic) IBOutlet UIImageView *detailImage;

@property (weak, nonatomic) IBOutlet UITextView *detailDescription;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)directions:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button;



@end

NS_ASSUME_NONNULL_END
