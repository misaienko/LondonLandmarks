//
//  TableViewCell.h
//  LondonLandmarksApp
//
//  Created by Admin on 09/06/2023.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellAddress;
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;


@end

NS_ASSUME_NONNULL_END
