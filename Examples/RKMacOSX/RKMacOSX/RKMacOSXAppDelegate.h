//
//  RKMacOSXAppDelegate.h
//  RKMacOSX
//
//  Created by Blake Watters on 4/10/11.
//  Copyright (c) 2009-2012 RestKit. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <RestKitSANetworking@MindSea/RestKit.h>

@interface RKMacOSXAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) RKObjectManager *objectManager;
@property (unsafe_unretained) IBOutlet NSWindow *window;

@end
