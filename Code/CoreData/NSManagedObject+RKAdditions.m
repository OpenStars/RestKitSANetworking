//
//  NSManagedObject+RKAdditions.m
//  RestKit
//
//  Created by Blake Watters on 3/14/12.
//  Copyright (c) 2009-2012 RestKit. All rights reserved.
//

#import <RestKitSANetworking@MindSea/CoreData/NSManagedObject+RKAdditions.h>
#import <RestKitSANetworking@MindSea/CoreData/NSManagedObjectContext+RKAdditions.h>
#import <RestKitSANetworking@MindSea/CoreData/RKManagedObjectStore.h>
#import <RestKitSANetworking@MindSea/Support/RKLog.h>

@implementation NSManagedObject (RKAdditions)

- (BOOL)hasBeenDeleted
{
    NSManagedObject *managedObjectClone = [[self managedObjectContext] existingObjectWithID:[self objectID] error:nil];
    return (managedObjectClone == nil) ? YES : NO;
}

- (BOOL)isNew
{
    NSDictionary *vals = [self committedValuesForKeys:nil];
    return [vals count] == 0;
}

@end
