//
//  MMYosemiteTabStyle.m
//  MMTabBarView
//
//  Created by Chinh Nguyen on 7/17/14.
//

#import "MMYosemiteTabStyle.h"
#import "MMAttachedTabBarButton.h"
#import "MMTabBarView.h"
#import "NSView+MMTabBarViewExtensions.h"

@interface MMTabBarView(SharedPrivates)

- (NSRect)_addTabButtonRect;
- (NSRect)_overflowButtonRect;

@end

@implementation MMYosemiteTabStyle
+ (NSString *)name {
    return @"Yosemite";
}

- (NSString *)name {
	return [[self class] name];
}

#pragma mark -
#pragma mark Creation/Destruction

- (id) init {
	if ((self = [super init])) {
		[self loadImages];
	}
	return self;
}

- (void) loadImages {
	// Yosemite Tabs Images
	yosemiteTabBg = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabsBackground"]];

	yosemiteTabBgNonKey = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabsBackgroundNonKey"]];

	yosemiteTabBgDown = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabsDown"]];

	yosemiteTabBgDownNonKey = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabsDownNonKey"]];

	yosemiteDivider = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabsSeparator"]];

	yosemiteCloseButton = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabClose_Front"]];
	yosemiteCloseButtonDown = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabClose_Front_Pressed"]];
	yosemiteCloseButtonOver = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabClose_Front_Rollover"]];

	yosemiteCloseDirtyButton = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabCloseDirty_Front"]];
	yosemiteCloseDirtyButtonDown = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabCloseDirty_Front_Pressed"]];
	yosemiteCloseDirtyButtonOver = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabCloseDirty_Front_Rollover"]];

	yosemiteAddTab = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabNew"]];
	yosemiteAddTabRollover = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabNewRollover"]];
	yosemiteAddTabDown = [[NSImage alloc] initByReferencingFile:[[MMTabBarView bundle] pathForImageResource:@"YosemiteTabNewPressed"]];
}

- (void)dealloc {
	[yosemiteTabBg release], yosemiteTabBg = nil;
	[yosemiteTabBgNonKey release], yosemiteTabBgNonKey = nil;
	[yosemiteTabBgDown release], yosemiteTabBgDown = nil;
	[yosemiteDivider release], yosemiteDivider = nil;
	[yosemiteCloseButton release], yosemiteCloseButton = nil;
	[yosemiteCloseButtonDown release], yosemiteCloseButtonDown = nil;
	[yosemiteCloseButtonOver release], yosemiteCloseButtonOver = nil;
	[yosemiteCloseDirtyButton release], yosemiteCloseDirtyButton = nil;
	[yosemiteCloseDirtyButtonDown release], yosemiteCloseDirtyButtonDown = nil;
	[yosemiteCloseDirtyButtonOver release], yosemiteCloseDirtyButtonOver = nil;
	[yosemiteAddTab release], yosemiteAddTab = nil;
	[yosemiteAddTabRollover release], yosemiteAddTabRollover = nil;
	[yosemiteAddTabDown release], yosemiteAddTabDown = nil;

	[super dealloc];
}

#pragma mark -
#pragma mark Tab View Specifics

- (CGFloat)heightOfTabBarButtonsForTabBarView:(MMTabBarView *)tabBarView {
	return 24.0f;
}

- (CGFloat)leftMarginForTabBarView:(MMTabBarView *)tabBarView {
	return 0.0f;
}

- (CGFloat)topMarginForTabBarView:(MMTabBarView *)tabBarView {
	return 0.0f;
}

- (CGFloat)closeButtonLeftMarginForTabBarView:(MMTabBarView *)tabBarView {
	return 4.0f;
}

- (CGFloat)closeButtonRightMarginForTabBarView:(MMTabBarView *)tabBarView {
	return 4.0f;
}

- (CGFloat)closeButtonTopMarginForTabBarView:(MMTabBarView *)tabBarView {
	return 4.0f;
}

- (NSSize)closeButtonSizeForBounds:(NSRect)theRect ofTabCell:(MMTabBarButtonCell *)cell
{
	return NSMakeSize(16.0, 16.0);
}

#pragma mark -
#pragma mark Providing Images

- (NSImage *)closeButtonImageOfType:(MMCloseButtonImageType)type forTabCell:(MMTabBarButtonCell *)cell
{
    switch (type) {
        case MMCloseButtonImageTypeStandard:
            return yosemiteCloseButton;
        case MMCloseButtonImageTypeRollover:
            return yosemiteCloseButtonOver;
        case MMCloseButtonImageTypePressed:
            return yosemiteCloseButtonDown;
            
        case MMCloseButtonImageTypeDirty:
            return yosemiteCloseDirtyButton;
        case MMCloseButtonImageTypeDirtyRollover:
            return yosemiteCloseDirtyButtonOver;
        case MMCloseButtonImageTypeDirtyPressed:
            return yosemiteCloseDirtyButtonDown;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark Add Tab Button

- (NSSize)addTabButtonSizeForTabBarView:(MMTabBarView *)tabBarView {
    return NSMakeSize([tabBarView frame].size.height,[tabBarView frame].size.height);
}

- (NSRect)addTabButtonRectForTabBarView:(MMTabBarView *)tabBarView {

    NSRect rect = [tabBarView _addTabButtonRect];
    
    rect.origin.x = NSMaxX([tabBarView frame]) - NSWidth(rect);

    return rect;
}

-(void)updateAddButton:(MMRolloverButton *)aButton ofTabBarView:(MMTabBarView *)tabBarView {
    [aButton setImage:yosemiteAddTab];
    [aButton setAlternateImage:yosemiteAddTabDown];
    [aButton setRolloverImage:yosemiteAddTabRollover];
}

#pragma mark -
#pragma mark Drawing

- (void)drawBezelOfTabBarView:(MMTabBarView *)tabBarView inRect:(NSRect)rect {
	if (rect.size.height <= [tabBarView heightOfTabBarButtons]) {
		//Draw for our whole bounds; it'll be automatically clipped to fit the appropriate drawing area
		rect = [tabBarView bounds];

		if ([tabBarView isWindowActive]) {
			NSDrawThreePartImage(rect, NULL, yosemiteTabBg, NULL, NO, NSCompositeSourceOver, 1.0f,[tabBarView isFlipped]);
//			[yosemiteTabBg drawInRect:rect fromRect:NSMakeRect(0.0, 0.0, 1.0, yosemiteTabBg.size.height) operation:NSCompositeSourceOver fraction:1.0 respectFlipped:YES hints:nil];
		}
		else {
			NSDrawThreePartImage(rect, NULL, yosemiteTabBgNonKey, NULL, NO, NSCompositeSourceOver, 1.0f,[tabBarView isFlipped]);
//			[yosemiteTabBgNonKey drawInRect:rect fromRect:NSMakeRect(0.0, 0.0, 1.0, yosemiteTabBgNonKey.size.height) operation:NSCompositeSourceOver fraction:1.0 respectFlipped:YES hints:nil];
		}
	}
}

- (void)drawBezelOfTabCell:(MMTabBarButtonCell *)cell withFrame:(NSRect)frame inView:(NSView *)controlView {

    MMTabBarView *tabBarView = [controlView enclosingTabBarView];
    MMAttachedTabBarButton *button = (MMAttachedTabBarButton *)controlView;
    
	NSRect cellFrame = frame;
    
    NSImage *left = nil;
    NSImage *right = nil;
    NSImage *center = nil;
    
	// Selected Tab
	if ([cell state] == NSOnState) {
		NSRect aRect = NSMakeRect(cellFrame.origin.x, cellFrame.origin.y, cellFrame.size.width, cellFrame.size.height);
        
		if ([tabBarView isWindowActive]) {
			center = yosemiteTabBgDown;
		}
		else {
			center = yosemiteTabBgDownNonKey;
		}

        if ([button shouldDisplayRightDivider]) {
            right = yosemiteDivider;
        }
        
        if ([button shouldDisplayLeftDivider]) {
            left = yosemiteDivider;
        }

        NSDrawThreePartImage(aRect, left, center, right, NO, NSCompositeSourceOver, 1.0f,[controlView isFlipped]);

	} else { // Unselected Tab
		NSRect aRect = NSMakeRect(cellFrame.origin.x, cellFrame.origin.y, cellFrame.size.width, cellFrame.size.height);
        
        if ([button shouldDisplayRightDivider])
            right = yosemiteDivider;
        if ([button shouldDisplayLeftDivider])
            left = yosemiteDivider;
        
        if (![button isOverflowButton]) {
            NSDrawThreePartImage(aRect, left, center, right, NO, NSCompositeSourceOver, 1.0f,[controlView isFlipped]);
        }
	}
}

- (void)drawBezelOfOverflowButton:(MMOverflowPopUpButton *)overflowButton ofTabBarView:(MMTabBarView *)tabBarView inRect:(NSRect)rect {

    MMAttachedTabBarButton *lastAttachedButton = [tabBarView lastAttachedButton];
    MMAttachedTabBarButtonCell *lastAttachedButtonCell = [lastAttachedButton cell];

    if ([lastAttachedButton isSliding])
        return;
    
	NSRect cellFrame = [overflowButton frame];
        
    NSImage *left = nil;
    NSImage *right = nil;
    NSImage *center = nil;
    
        // Draw selected
	if ([lastAttachedButtonCell state] == NSOnState) {
		NSRect aRect = NSMakeRect(cellFrame.origin.x, cellFrame.origin.y, cellFrame.size.width, cellFrame.size.height);
        aRect.size.width += 5.0f;
        
		if ([tabBarView isWindowActive]) {
                center = yosemiteTabBgDownNonKey;
		}
		else {
                center = yosemiteTabBgDown;
		}

        if ([tabBarView showAddTabButton]) {
            right = yosemiteDivider;
        }
        
        NSDrawThreePartImage(aRect, left, center, right, NO, NSCompositeSourceOver, 1.0f,[tabBarView isFlipped]);

        // Draw unselected
	} else {
		NSRect aRect = NSMakeRect(cellFrame.origin.x, cellFrame.origin.y, cellFrame.size.width, cellFrame.size.height);
        aRect.size.width += 5.0f;
        
        if ([tabBarView showAddTabButton])
            right = yosemiteDivider;
        
        NSDrawThreePartImage(aRect, left, center, right, NO, NSCompositeSourceOver, 1.0f,[tabBarView isFlipped]);
	}
}

#pragma mark -
#pragma mark Archiving

- (void)encodeWithCoder:(NSCoder *)aCoder {
	//[super encodeWithCoder:aCoder];
	if ([aCoder allowsKeyedCoding]) {
		[aCoder encodeObject:yosemiteTabBg forKey:@"yosemiteTabBg"];
		[aCoder encodeObject:yosemiteTabBgNonKey forKey:@"yosemiteTabBgNonKey"];
		[aCoder encodeObject:yosemiteTabBgDown forKey:@"yosemiteTabBgDown"];
		[aCoder encodeObject:yosemiteTabBgDownNonKey forKey:@"yosemiteTabBgDownNonKey"];
		[aCoder encodeObject:yosemiteDivider forKey:@"yosemiteDivider"];
		[aCoder encodeObject:yosemiteCloseButton forKey:@"yosemiteCloseButton"];
		[aCoder encodeObject:yosemiteCloseButtonDown forKey:@"yosemiteCloseButtonDown"];
		[aCoder encodeObject:yosemiteCloseButtonOver forKey:@"yosemiteCloseButtonOver"];
		[aCoder encodeObject:yosemiteCloseDirtyButton forKey:@"yosemiteCloseDirtyButton"];
		[aCoder encodeObject:yosemiteCloseDirtyButtonDown forKey:@"yosemiteCloseDirtyButtonDown"];
		[aCoder encodeObject:yosemiteCloseDirtyButtonOver forKey:@"yosemiteCloseDirtyButtonOver"];
	}
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	//self = [super initWithCoder:aDecoder];
	//if (self) {
	if ([aDecoder allowsKeyedCoding]) {
		yosemiteTabBg = [[aDecoder decodeObjectForKey:@"yosemiteTabBg"] retain];
		yosemiteTabBgNonKey = [[aDecoder decodeObjectForKey:@"yosemiteTabBgNonKey"] retain];
		yosemiteTabBgDown = [[aDecoder decodeObjectForKey:@"yosemiteTabBgDown"] retain];
		yosemiteTabBgDownNonKey = [[aDecoder decodeObjectForKey:@"yosemiteTabBgDownNonKey"] retain];
		yosemiteDivider = [[aDecoder decodeObjectForKey:@"yosemiteDivider"] retain];
		yosemiteCloseButton = [[aDecoder decodeObjectForKey:@"yosemiteCloseButton"] retain];
		yosemiteCloseButtonDown = [[aDecoder decodeObjectForKey:@"yosemiteCloseButtonDown"] retain];
		yosemiteCloseButtonOver = [[aDecoder decodeObjectForKey:@"yosemiteCloseButtonOver"] retain];
		yosemiteCloseDirtyButton = [[aDecoder decodeObjectForKey:@"yosemiteCloseDirtyButton"] retain];
		yosemiteCloseDirtyButtonDown = [[aDecoder decodeObjectForKey:@"yosemiteCloseDirtyButtonDown"] retain];
		yosemiteCloseDirtyButtonOver = [[aDecoder decodeObjectForKey:@"yosemiteCloseDirtyButtonOver"] retain];
	}
	//}
	return self;
}

@end
