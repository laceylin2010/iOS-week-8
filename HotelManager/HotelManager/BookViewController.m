//
//  BookViewController.m
//  HotelManager
//
//  Created by Lacey Vu on 3/22/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "BookViewController.h"
#import "ReservationService.h"
#import "NSManagedObjectContext+Additions.h"

@interface BookViewController ()

@property (strong, nonatomic) UITextField *firstNameField;
@property (strong, nonatomic) UITextField *lastNameField;
@property (strong, nonatomic) UITextField *emailField;


@end

@implementation BookViewController

-(void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupCustomAppearance];
    [self setupBookViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(void)setupCustomAppearance
{
    
    UITextField *firstNameTextField = [[UITextField alloc]init];
    UITextField *lastNameTextField = [[UITextField alloc]init];
    UITextField *emailTextField = [[UITextField alloc]init];


    firstNameTextField.placeholder = @"Enter your name";
    firstNameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    firstNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    lastNameTextField.placeholder = @"Enter your last Name";
    lastNameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    lastNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    emailTextField.placeholder = @"Enter your email";
    emailTextField.translatesAutoresizingMaskIntoConstraints = NO;
    emailTextField.borderStyle = UITextBorderStyleRoundedRect;

    
    [self.view addSubview:firstNameTextField];
    [self.view addSubview:lastNameTextField];
    [self.view addSubview:emailTextField];
    
    NSMutableArray *constraints = [[NSMutableArray alloc]init];
    
    NSArray *firstNameHorizontalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[firstNameTextField]-20-|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(firstNameTextField)];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-84-[firstNameTextField]" options:NSLayoutFormatAlignAllRight metrics:nil views:NSDictionaryOfVariableBindings(firstNameTextField)];
    
    NSArray *lastNameHorizontalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[lastNameTextField]-20-|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(lastNameTextField)];
    
    NSArray *lastNameVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-120-[lastNameTextField]" options:NSLayoutFormatAlignAllRight metrics:nil views:NSDictionaryOfVariableBindings(lastNameTextField)];
    
    NSArray *emailHorizontalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[emailTextField]-20-|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(emailTextField)];
    
    NSArray *emailVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-156-[emailTextField]" options:NSLayoutFormatAlignAllRight metrics:nil views:NSDictionaryOfVariableBindings(emailTextField)];
    
    [constraints addObjectsFromArray:firstNameHorizontalConstraint];
    [constraints addObjectsFromArray:verticalConstraints];
    [constraints addObjectsFromArray:lastNameHorizontalConstraint];
    [constraints addObjectsFromArray:lastNameVerticalConstraints];
    [constraints addObjectsFromArray:emailHorizontalConstraint];
    [constraints addObjectsFromArray:emailVerticalConstraints];
    
    for (NSLayoutConstraint *constraint in constraints) {
        constraint.active = YES;
    }
 
    self.firstNameField = firstNameTextField;
    self.lastNameField = lastNameTextField;
    self.emailField = emailTextField;
    
}

-(void)setupBookViewController
{
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonSelected:)]];
}

-(void)saveButtonSelected:(UIBarButtonItem *)sender
{
    if (self.firstNameField.text.length > 0) {
        NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
        Guest *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
        guest.name = self.firstNameField.text;
        guest.lastName = self.lastNameField.text;
        guest.email = self.emailField.text;
        
        //save
        [ReservationService bookReservationWithGuest:guest room:self.room startDate:self.startDate end:self.endDate];
        [self.navigationController popToRootViewControllerAnimated:YES];
         NSLog(@"%@", guest.lastName);
        
    }
    
}

@end

