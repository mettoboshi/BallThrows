//
//  game.h
//  BallThrows
//
//  Created by mettoboshi on 13/02/09.
//  Copyright 2013 mettobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Ball.h"

@interface gameLayer : CCLayer {
    Ball* ballStart;
    Ball* ballImageAka;
    CCSpriteBatchNode* batch;
}

+ (CCScene *) scene;

@end
