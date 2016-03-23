//
//  ReservationService.m
//  HotelManager
//
//  Created by Lacey Vu on 3/22/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "ReservationService.h"
#import "NSManagedObjectContext+Additions.h"
#import "Reservation.h"

@implementation ReservationService

+(NSArray *)fetchAvailbleRoomsForStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
    NSError *fetchError;
    
    NSFetchRequest *reservationRequest = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
    reservationRequest.predicate = [NSPredicate predicateWithFormat:@"startDate <= %@ AND endDate >= %@", endDate, startDate];
    
    NSMutableArray *unavailableRooms = [[NSMutableArray alloc]init];
    NSArray *reservations = [context executeFetchRequest:reservationRequest error:&fetchError];
    
    for (Reservation *reservation in reservations) {
        [unavailableRooms addObject:reservation.room];
    }
    
    if (fetchError) {
        NSLog(@"Error Fetching. Error: %@", fetchError.localizedDescription);
        
    }
    
    NSFetchRequest *roomRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
    roomRequest.predicate = [NSPredicate predicateWithFormat:@"NOT self IN %@", unavailableRooms];
    roomRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"hotel.name" ascending:YES], [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES]];
    NSArray *result = [context executeFetchRequest:roomRequest error:&fetchError];
    
    if (fetchError) {
        NSLog(@"Error Fetching. Error: %@", fetchError.localizedDescription);
    }
    
    
    return result;
}

+(void)bookReservationWithGuest:(Guest *)guest room:(Room *)room startDate:(NSDate *)start end:(NSDate *)end
{
    NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
    Reservation *reservation= [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:context];
    

    reservation.room = room;
    reservation.startDate = start;
    reservation.endDate = end;
    
    reservation.guest = guest;
    room.reservation = reservation;
    reservation.room = room;
    guest.reservation = reservation;
    
    NSError *saveError;
    [context save:&saveError];
    
    if (saveError) {
        NSLog(@"Save error. Error: %@", saveError.localizedDescription);
    }
    

}

+(NSArray *)fetchReservationsWithGuestName:(NSString *)name
{
    NSManagedObjectContext *context =[NSManagedObjectContext currentContext]; //fetching from core data
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
    request.predicate = [NSPredicate predicateWithFormat:@"guest.firstName CONTAINS %@ OR guest.lastName CONTAINS %@ OR guest.email CONTAINS %@", name, name, name]; //filtering what we want from core data
    
    NSError *error;
    NSArray *reservations = [context executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return reservations;
}

@end
