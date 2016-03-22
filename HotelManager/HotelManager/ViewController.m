//
//  ViewController.m
//  HotelManager
//
//  Created by Lacey Vu on 3/21/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "ViewController.h"
#import "HotelsViewController.h"
#import "DateViewController.h"

@interface ViewController ()



@end

@implementation ViewController

-(void)loadView
{
    [super loadView];
    [self setupCustomLayout];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViewController];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(void)setupViewController
{
    [self.navigationItem setTitle:@"H & M"];
}

-(void)setupCustomLayout
{
    float navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    UIButton *browseButton = [[UIButton alloc]init];
    UIButton *reserveButton = [[UIButton alloc]init];
    UIButton *lookupButton = [[UIButton alloc]init];
    
    [browseButton setTitle:@"Hotels" forState:UIControlStateNormal];
    [reserveButton setTitle:@"Book a Hotel" forState:UIControlStateNormal];
    [lookupButton setTitle:@"Lookup Reservation" forState:UIControlStateNormal];
    
    [browseButton setBackgroundColor:[UIColor colorWithRed:4.0/255.0 green:196.0/255.0 blue:217.0/255.0 alpha:1.0]];
    [reserveButton setBackgroundColor:[UIColor colorWithRed:242.0/255.0 green:61.0/255.0 blue:61.0/255.0 alpha:1.0]];
    [lookupButton setBackgroundColor:[UIColor colorWithRed:128.0/255.0 green:32.0/255.0 blue:140/255.0 alpha:1.0]];
    
    [browseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [reserveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [lookupButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [browseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [reserveButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lookupButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:browseButton];
    [self.view addSubview:reserveButton];
    [self.view addSubview:lookupButton];
    


    NSLayoutConstraint *browseLeading = [NSLayoutConstraint constraintWithItem: browseButton
                                                               attribute:NSLayoutAttributeLeading
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeLeading
                                                              multiplier:1.0
                                                                constant:0.0];
    
    NSLayoutConstraint *browseTop = [NSLayoutConstraint constraintWithItem: browseButton
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0.0];
    
    NSLayoutConstraint *browseTrailing = [NSLayoutConstraint constraintWithItem:browseButton
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.view
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:0.0];
    

    NSLayoutConstraint *browsingHeight = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:reserveButton attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    browseLeading.active = YES;
    browseTop.active = YES;
    browseTrailing.active = YES;
    browsingHeight.active = YES;
    
 
    
    
    NSLayoutConstraint *reserveLeading = [NSLayoutConstraint constraintWithItem: reserveButton
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeLeading
                                                                    multiplier:1.0
                                                                      constant:0.0];
    
    NSLayoutConstraint *reserveTop = [NSLayoutConstraint constraintWithItem: reserveButton
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:browseButton
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:0.0];
    
    NSLayoutConstraint *reserveTrailing = [NSLayoutConstraint constraintWithItem:reserveButton
                                                                      attribute:NSLayoutAttributeTrailing
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeTrailing
                                                                     multiplier:1.0
                                                                       constant:0.0];
    
    NSLayoutConstraint *reservingHeight = [NSLayoutConstraint constraintWithItem:reserveButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:lookupButton attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];

    reserveLeading.active = YES;
    reserveTop.active = YES;
    reserveTrailing.active = YES;
    reservingHeight.active = YES;
    
    
    
    NSLayoutConstraint *lookupLeading = [NSLayoutConstraint constraintWithItem: lookupButton
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeLeading
                                                                    multiplier:1.0
                                                                      constant:0.0];
    
    NSLayoutConstraint *lookupTop = [NSLayoutConstraint constraintWithItem: lookupButton
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:reserveButton
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:0.0];
    
    NSLayoutConstraint *lookupTrailing = [NSLayoutConstraint constraintWithItem:lookupButton
                                                                      attribute:NSLayoutAttributeTrailing
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeTrailing
                                                                     multiplier:1.0
                                                                       constant:0.0];
    
    NSLayoutConstraint *lookupBottom = [NSLayoutConstraint constraintWithItem:lookupButton
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0.0];
    
    NSLayoutConstraint *lookupHeight = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:reserveButton attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
     
    lookupLeading.active = YES;
    lookupTrailing.active = YES;
    lookupTop.active = YES;
    lookupBottom.active = YES;
    lookupHeight.active = YES;
    
    [browseButton addTarget:self action:@selector(browseButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [reserveButton addTarget:self action:@selector(reserveButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [lookupButton addTarget:self action:@selector(lookupButtonSelected:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)browseButtonSelected:(UIButton *)sender
{
    [self.navigationController pushViewController:[[HotelsViewController alloc]init] animated:YES];
}


-(void)reserveButtonSelected:(UIButton *)sender
{

    [self.navigationController pushViewController:[[DateViewController alloc]init] animated:YES];
    
}

-(void)lookupButtonSelected:(UIButton *)sender
{
//    [self.navigationController pushViewController:[[LookupViewController alloc]init] animated:YES];
}



@end
