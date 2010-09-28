//
//  RKSpecResponseLoader.m
//  RestKit
//
//  Created by Blake Watters on 1/14/10.
//  Copyright 2010 Two Toasters. All rights reserved.
//

#import "RKSpecResponseLoader.h"


@implementation RKSpecResponseLoader

@synthesize response = _response;
@synthesize failureError = _failureError;
@synthesize errorMessage = _errorMessage;
@synthesize success = _success;
@synthesize timeout = _timeout;

- (id)init {
	if (self = [super init]) {
		_timeout = 10;
		_awaitingResponse = NO;
	}
	
	return self;
}

- (void)dealloc {
	[_response release];
	[_failureError release];
	[_errorMessage release];
	[super dealloc];
}

- (void)waitForResponse {
	_awaitingResponse = YES;
	NSDate* startDate = [NSDate date];
	
	while (_awaitingResponse) {		
		[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
		if ([[NSDate date] timeIntervalSinceDate:startDate] > self.timeout) {
			[NSException raise:nil format:@"*** Operation timed out after %f seconds...", self.timeout];
			_awaitingResponse = NO;
		}
	}
}

- (void)loadResponse:(id)response {
	NSLog(@"The response: %@", response);
	_response = [response retain];
	_awaitingResponse = NO;
	_success = YES;
}

- (void)resourceLoadRequest:(RKRequest*)request didLoadObjects:(NSArray*)objects response:(RKResponse*)response object:(id<RKObjectMappable>)object {
	[self loadResponse:response];
}

- (void)resourceLoadRequest:(RKRequest*)request didFailWithError:(NSError*)error response:(RKResponse*)response object:(id<RKObjectMappable>)object {
	_awaitingResponse = NO;
	_success = NO;
	_failureError = [error retain];
}

@end
