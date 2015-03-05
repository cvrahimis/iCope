//
//  BackEndComunicator.m
//  iCope
//
//  Created by Costas Simiharv on 3/4/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import "BackEndComunicator.h"


@implementation BackEndComunicator

@synthesize _managedObjectContext;
@synthesize _responseData;
@synthesize result;

-(id)initWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    if(self = [super init])
    {
        _managedObjectContext = managedObjectContext;
    }
    return self;
}

// Checks if we have an internet connection or not
- (BOOL)testInternetConnection
{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL) loginWithUserName:(NSString*) username andPassword:(NSString*) password{
    NSString *post = [NSString stringWithFormat:@"Username=%@&Password=%@",username,password];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8888/iCopeDBInserts/Login.php"]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSData *serverData = [NSURLConnection sendSynchronousRequest: request returningResponse:nil error:nil];
    return [self insertPatientandTherapistToDevice:serverData];
}

-(Patient*) getPatientOnDevice
{
    if([self isPatientAndTherapistOnDevice]){
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Patient" inManagedObjectContext: _managedObjectContext];
        [fetchRequest setEntity:entity];
        NSError *error = nil;
        Patient *patient = [[_managedObjectContext executeFetchRequest:fetchRequest error: &error] objectAtIndex:0];
        return patient;
    }
    return nil;
}

-(BOOL) insertPatientandTherapistToDevice:(NSData*) data{
    // Append the new data to the instance variable you declared
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [_responseData appendData:data];
    result = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSArray *phpData = [result componentsSeparatedByString: @","];
    if([phpData count] != 8)
    {
        Therapist *therapist = [NSEntityDescription insertNewObjectForEntityForName:@"Therapist" inManagedObjectContext:_managedObjectContext];
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterNoStyle;
        therapist.therapistId = [f numberFromString:[phpData objectAtIndex:1]];
        therapist.therapistFirstName = [phpData objectAtIndex:6];
        therapist.therapistLastName = [phpData objectAtIndex:7];
    
        Patient *patient = [NSEntityDescription insertNewObjectForEntityForName:@"Patient" inManagedObjectContext:_managedObjectContext];
        patient.patientId = [f numberFromString:[phpData objectAtIndex:0]];
        patient.therapistId = [f numberFromString:[phpData objectAtIndex:1]];
        patient.patientLogin = [phpData objectAtIndex:2];
        patient.patientPassword = [phpData objectAtIndex:3];
        patient.patientFirstName = [phpData objectAtIndex:4];
        patient.patientLastName = [phpData objectAtIndex:5];
        patient.therapist = therapist;
        [therapist addPatientObject: patient];
    
        NSError *error;
        if (![_managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            return NO;
        }
        return YES;
    }
    return NO;
}

-(BOOL) isPatientAndTherapistOnDevice{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Patient" inManagedObjectContext: _managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *patient = [_managedObjectContext executeFetchRequest:fetchRequest error: &error];
    
    if ([patient count] > 0)
        return YES;
    return NO;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    /*// Append the new data to the instance variable you declared
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [_responseData appendData:data];
    result = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSArray *phpData = [result componentsSeparatedByString: @","];
    
    Therapist *therapist = [NSEntityDescription
                                      insertNewObjectForEntityForName:@"Therapist"
                                      inManagedObjectContext:_managedObjectContext];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterNoStyle;
    therapist.therapistId = [f numberFromString:[phpData objectAtIndex:1]];
    therapist.therapistFirstName = [phpData objectAtIndex:6];
    therapist.therapistLastName = [phpData objectAtIndex:7];
    
    Patient *patient = [NSEntityDescription insertNewObjectForEntityForName:@"Patient" inManagedObjectContext:_managedObjectContext];
    patient.patientId = [f numberFromString:[phpData objectAtIndex:0]];
    patient.therapistId = [f numberFromString:[phpData objectAtIndex:1]];
    patient.patientLogin = [phpData objectAtIndex:2];
    patient.patientPassword = [phpData objectAtIndex:3];
    patient.patientFirstName = [phpData objectAtIndex:4];
    patient.patientLastName = [phpData objectAtIndex:5];
    patient.therapist = therapist;
    [therapist addPatientObject: patient];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }*/
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"%s", __PRETTY_FUNCTION__);
}




@end
