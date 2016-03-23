//
//  ReservationService.h
//  HotelManager
//
//  Created by Lacey Vu on 3/22/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guest.h"
#import "Room.h"

@interface ReservationService : NSObject

+(NSArray *)fetchAvailbleRoomsForStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+(void)bookReservationWithGuest:(Guest *)guest room:(Room *)room startDate:(NSDate *)start end:(NSDate *)end;
+(NSArray *)fetchReservationsWithGuestName:(NSString *)name;


@end
