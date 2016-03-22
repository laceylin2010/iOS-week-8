//
//  BookViewController.h
//  HotelManager
//
//  Created by Lacey Vu on 3/22/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"
#import "BookViewController.h"


@interface BookViewController : UIViewController

@property (strong, nonatomic) Room *room;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;


@end
