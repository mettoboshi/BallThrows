//
//  Ball.m
//  BallThrows
//
//  Created by mettoboshi on 13/02/09.
//  Copyright 2013 mettobo. All rights reserved.
//

#import "Ball.h"

@implementation Ball

@synthesize velocity;


- (id)initWithPlace:(int)x placeY:(int)y velocity:(CGPoint)speed{
    self = [super init];
    self = [super initWithFile:@"akamaru_mini.png"];

    self.velocity = speed;
    self.position = CGPointMake(x,y);
    
    [self scheduleUpdate];
    
    return self;
}

-(void) dealloc
{	
	[super dealloc];
}

-(void) update:(ccTime)delta {

    self.position = ccpAdd(self.position, self.velocity);
/*
    CGPoint pos = self.position;
    pos.x += self.velocity.x;
    pos.y += self.velocity.y;
    self.position = pos;
*/
 }

@end