//
//  AppDelegate.h
//  PVAsyncImageView
//
//  Created by Pedro Vieira on 7/11/12
//  Copyright (c) 2012 Pedro Vieira. ( https://twitter.com/W1TCH_ )
//  All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PVAsyncImageView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property IBOutlet NSWindow *window;
@property IBOutlet PVAsyncImageView *imageView;
@property IBOutlet NSTextField *whileLoadingTXT;
@property IBOutlet NSTextField *whenFinishedTXT;
@property IBOutlet NSTextField *whenErrorOccurred;
@property IBOutlet NSTextField *imageURL;

- (IBAction)downloadIMG:(id)sender;
- (IBAction)cancelDownload:(id)sender;

@end
