//
//  LookupViewController.m
//  HotelManager
//
//  Created by Lacey Vu on 3/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "LookupViewController.h"
#import "Reservation.h"
#import "Guest.h"
#import "Room.h"
#import "Hotel.h"
#import "ReservationService.h"

@interface LookupViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic)NSArray *dataSource;
@property (strong, nonatomic)UITableView *tableView;

@end

@implementation LookupViewController

-(void)setDataSource:(NSArray *)dataSource //overriding setter
{
    _dataSource = dataSource;

    //load table view
    [self.tableView reloadData];
}

-(void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupTableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupLookupViewController];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(void)setupTableView
{
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //add tableview as a subview
    [self.view addSubview:self.tableView];
    
    NSMutableArray *constraints = [[NSMutableArray alloc]init];
    
    NSArray *tableViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[tableView]|" options:NSLayoutFormatAlignAllTop metrics:0 views:@{@"tableView": self.tableView}];
    NSArray *tableViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:NSLayoutFormatAlignAllRight metrics:0 views:@{@"tableView": self.tableView}];
    
    [constraints addObjectsFromArray:tableViewHorizontalConstraints];
    [constraints addObjectsFromArray:tableViewVerticalConstraints];
    
    for (NSLayoutConstraint *constraint in constraints) {
        constraint.active = YES;
    }
    
}

-(void)setupLookupViewController
{
    [self.navigationItem setTitle:@"Search Reservations"];
    
}



#pragma mark - UITableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    Reservation *reservation = self.dataSource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@",reservation.guest.firstName, reservation.guest.lastName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Hotel: %@, Room: %@", reservation.room.hotel.name, reservation.room.number];
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0; //height for search bar usually 44 points.
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.tableView.frame), 44.0);
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:frame];
    
    searchBar.delegate = self;
    
    return searchBar;
}

#pragma mark - UISearchBarDelegate

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(nonnull NSString *)searchText
{
    self.dataSource = [ReservationService fetchReservationsWithGuestName:searchBar.text];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.dataSource = [ReservationService fetchReservationsWithGuestName:searchBar.text];
}


@end
