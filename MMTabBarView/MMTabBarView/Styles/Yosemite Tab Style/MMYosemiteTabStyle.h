//
//  MMYosemiteTabStyle.h
//  MMTabBarView
//
//  Created by Chinh Nguyen on 7/17/14.
//

#import <Cocoa/Cocoa.h>
#import "MMTabStyle.h"

@interface MMYosemiteTabStyle : NSObject <MMTabStyle> {
	NSImage									*yosemiteTabBg;
	NSImage									*yosemiteTabBgNonKey;
	NSImage									*yosemiteTabBgDown;
	NSImage									*yosemiteTabBgDownNonKey;
	NSImage									*yosemiteDividerDown;
	NSImage									*yosemiteDivider;
	NSImage									*yosemiteCloseButton;
	NSImage									*yosemiteCloseButtonDown;
	NSImage									*yosemiteCloseButtonOver;
	NSImage									*yosemiteCloseDirtyButton;
	NSImage									*yosemiteCloseDirtyButtonDown;
	NSImage									*yosemiteCloseDirtyButtonOver;
	NSImage									*yosemiteAddTab;
	NSImage									*yosemiteAddTabRollover;
	NSImage									*yosemiteAddTabDown;
}

- (void)loadImages;

- (void)encodeWithCoder:(NSCoder *)aCoder;
- (id)initWithCoder:(NSCoder *)aDecoder;

@end
