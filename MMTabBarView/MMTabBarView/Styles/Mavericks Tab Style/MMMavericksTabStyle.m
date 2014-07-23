//
//  MMMavericksTabStyle.m
//  MMTabBarView
//
//  Created by Michael Monscheuer on 9/20/12.
//  Copyright 2011 Marrintech. All rights reserved.
//

#import "MMMavericksTabStyle.h"

#import "MMTabBarView.h"
#import "MMAttachedTabBarButton.h"
#import "NSView+MMTabBarViewExtensions.h"

@interface MMTabBarView(SharedPrivates)

- (NSRect)_addTabButtonRect;
- (NSRect)_overflowButtonRect;

@end

@implementation MMMavericksTabStyle

StaticImage(MavericksAWAddTabButton)
StaticImage(MavericksAWAddTabButtonPushed)
StaticImage(MavericksAWAddTabButtonRolloverPlus)

+ (NSString *)name {
    return @"Mavericks";
}

- (NSString *)name {
	return [[self class] name];
}

#pragma mark -
#pragma mark Tab View Specific

- (CGFloat)heightOfTabBarButtonsForTabBarView:(MMTabBarView *)tabBarView {
	return 24.0f;
}

#pragma mark -
#pragma mark Add Tab Button

- (NSRect)addTabButtonRectForTabBarView:(MMTabBarView *)tabBarView {

    NSRect rect = [tabBarView _addTabButtonRect];
    
    rect.origin.x = NSMaxX([tabBarView frame]) - NSWidth(rect);

    return rect;
}

-(void)updateAddButton:(MMRolloverButton *)aButton ofTabBarView:(MMTabBarView *)tabBarView {

    [aButton setImage:_staticMavericksAWAddTabButtonImage()];
    [aButton setAlternateImage:_staticMavericksAWAddTabButtonPushedImage()];
    [aButton setRolloverImage:_staticMavericksAWAddTabButtonRolloverPlusImage()];
}
@end
