//
//  HotelsViewController.m
//  HotelManager
//
//  Created by Lacey Vu on 3/21/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "HotelsViewController.h"
#import "AppDelegate.h"
#import "Hotel.h"
#import "RoomsViewController.h"


@interface HotelsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *dataSource;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation HotelsViewController

-(NSArray *)dataSource
{
    if (!_dataSource) {
        
        AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
        NSManagedObjectContext *context = delegate.managedObjectContext;
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
        NSError *error;
        _dataSource = [context executeFetchRequest:request error:&error];
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        
    }
    
    return _dataSource;
}

-(void)loadView
{
    [super loadView];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupHotelViewController];
    [self setupTableView];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(void)setupHotelViewController
{
    [self.navigationItem setTitle:@"Hotels"];
}

-(void)setupTableView
{
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
 
    
    leading.active = YES;
    top.active = YES;
    trailing.active = YES;
    bottom.active = YES;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Hotel *hotel = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = hotel.name;
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150.0;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImage *headerImage = [UIImage imageNamed:@"hotel"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:headerImage];
    imageView.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.tableView.frame), 150.0);
    
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    
    
    return imageView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString *rooms = self.dataSource[indexPath.row];
    
    
    
    [self.navigationController pushViewController: [[RoomsViewController alloc]init] animated:YES];
    
}




@end
