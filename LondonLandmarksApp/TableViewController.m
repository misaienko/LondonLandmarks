//
//  TableViewController.m
//  LondonLandmarksApp
//
//  Created by Admin on 09/06/2023.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "DetailViewController.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 120;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Landmarks" ofType:@"plist"];
   
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    //dictionary contains array - it takes data from it
    dataSelect = dict[@"Places"];
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
    //one section displaying cell
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return dataSelect.count;
    //count insert items
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    // To be abble to reference it we need to export this class
    // Configure the cell...
    
    NSDictionary *dict = dataSelect[indexPath.row];
    
    cell.cellTitle.text = dict[@"Title"];
    cell.cellAddress.text =dict[@"Address"];
    cell.cellImage.image = [UIImage imageNamed:dict[@"Image"]];
    // take items from dictionaries
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:@"showDetail"]){
  //connection LondonLandmarks and DetailViewController
        DetailViewController *detailView = [segue destinationViewController];
        NSIndexPath *myIndexpath = [self.tableView indexPathForSelectedRow];
        
        NSDictionary *dict =dataSelect[myIndexpath.row];
        
        detailView.detailModal = @[dict[@"Title"],dict[@"Address"],dict[@"Image"],dict[@"Description"],dict[@"Latitude"],dict[@"Longitude"]];
        //view loading
    }
    
}


@end
