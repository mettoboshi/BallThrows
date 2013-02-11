//
//  game.m
//  BallThrows
//
//  Created by mettoboshi on 13/02/09.
//  Copyright 2013 mettobo. All rights reserved.
//

#import "gameLayer.h"


@implementation gameLayer

+ (CCScene *) scene
{
    //シーンの追加
    CCScene *scene = [CCScene node];
    gameLayer *layer = [gameLayer node];
    [scene addChild: layer];
    
    return scene;
}

- (id)init {
    self = [super init];
    if (self) {
        //window size
        CGSize winSize =[[CCDirector sharedDirector] winSize];
        
        // ボールの移動開始位置用
        ballStart = [[Ball alloc]initWithPlace: winSize.width / 2 placeY: winSize.height / 2 velocity:CGPointMake(0,0)];
        [self addChild:ballStart];
        
        // タッチイベントを使用するためのおまじない1
        self.isTouchEnabled = YES;
            
        batch = [CCSpriteBatchNode batchNodeWithFile:@"akamaru_mini.png"];
		[self addChild:batch];        
    }
    return self;
}

// タッチイベントを使用するためのおまじない2
-(void) registerWithTouchDispatcher
{
    CCDirector *director = [CCDirector sharedDirector];
    [[director touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

// タッチ開始した場合に呼ばれるメソッド
-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location =[touch locationInView:[touch view]];
    location =[[CCDirector sharedDirector] convertToGL:location];
    
    CGSize winSize =[[CCDirector sharedDirector] winSize];
//    ballImageAka.position = ccp(20, winSize.height/2);
    
    // Determine offset of location to projectile
    int offX = location.x - winSize.width / 2;
    int offY = location.y - winSize.height / 2;

//    if(offX <=0)return;
             
    CGFloat velX = (CGFloat) offX / (fabs(offX) + fabs(offY));
    CGFloat velY = (CGFloat) offY / (fabs(offX) + fabs(offY));
    ballImageAka  = [[Ball alloc]initWithPlace:winSize.width / 2 placeY:winSize.height / 2 velocity:CGPointMake(velX, velY)];
    
    [batch addChild:ballImageAka];
}

-(void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
}

@end
