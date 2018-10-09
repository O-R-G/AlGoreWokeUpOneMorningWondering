//
//  AlGoreWokeUpOneMorningWonderingView.m
//  AlGoreWokeUpOneMorningWondering
//
//  Created by Eric Li on 10/9/18.
//  Copyright © 2018 O-R-G. All rights reserved.
//

#import "AlGoreWokeUpOneMorningWonderingView.h"

@implementation AlGoreWokeUpOneMorningWonderingView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    
    NSString *cheminQtz;
    QCView *qtz;
    
    cheminQtz = [ [ NSBundle bundleForClass : [ self class ] ] pathForResource: @"Earth-1" ofType: @"qtz" ];
    
    if (cheminQtz)
    {
        // qtz=[[QCView alloc] initWithFrame:frame];
        // Note that it needed a smaller rect to know as its frame or preview drew incorrectly
        // as below here:
        
        qtz=[[QCView alloc] initWithFrame:[self bounds]];
        
        [qtz loadCompositionFromFile:cheminQtz];
        
        if (qtz)
        {
            [self addSubview:qtz];
        }
    }
    
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
    [[[self subviews] lastObject] startRendering];
}

- (void)stopAnimation
{
    [super stopAnimation];
    [[[self subviews] lastObject] stopRendering];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
