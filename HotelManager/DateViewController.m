//
//  DateViewController.m
//  HotelManager
//
//  Created by Lacey Vu on 3/22/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()

@property (strong, nonatomic)UIDatePicker *startPicker;
@property (strong, nonatomic)UIDatePicker *endPicker;

@end

@implementation DateViewController

-(void)loadView
{
    [super loadView];
    [self setupCustomLayout];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupDateViewController];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(void)setupCustomLayout
{
    UIDatePicker *startPicker = [[UIDatePicker alloc]init];
    UIDatePicker *endPicker = [[UIDatePicker alloc]init];
    
    self.startPicker.datePickerMode = UIDatePickerModeDate;
    self.endPicker.datePickerMode = UIDatePickerModeDate;
    
    startPicker.translatesAutoresizingMaskIntoConstraints = NO;
    endPicker.translatesAutoresizingMaskIntoConstraints = NO; //makes it so we can do our constraints
    
    [self.view addSubview:startPicker];
    [self.view addSubview:endPicker];
    
    NSMutableArray *constraints = [[NSMutableArray alloc]init];
    
    NSArray *startPickerHorizontalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|[startPicker]|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(startPicker)];
    
    NSArray *endPickerHorizontalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|[endPicker]|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(endPicker)];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-84-[startPicker]-20-[endPicker]" options:NSLayoutFormatAlignAllRight metrics:nil views:NSDictionaryOfVariableBindings(startPicker, endPicker)];
    
    
    [constraints addObjectsFromArray:startPickerHorizontalConstraint];
    [constraints addObjectsFromArray:endPickerHorizontalConstraint];
    [constraints addObjectsFromArray:verticalConstraints];
    
    for (NSLayoutConstraint *constraint in constraints) {
        constraint.active = YES;
    };
    
    self.startPicker = startPicker;
    self.endPicker = endPicker;
}

-(void)setupDateViewController
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationItem setTitle:@"Select Dates"];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonSelected:)]];

}

-(void)doneButtonSelected:(UIBarButtonItem *)sender
{
    
}

@end
