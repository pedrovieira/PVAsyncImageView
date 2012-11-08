//
//  AppDelegate.m
//  PVAsyncImageView
//
//  Created by Pedro Vieira on 7/11/12
//  Copyright (c) 2012 Pedro Vieira. ( https://twitter.com/W1TCH_ )
//  All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
}

- (IBAction)downloadIMG:(id)sender {
    [_imageView downloadImageFromURL:_imageURL.stringValue withPlaceholderImage:[NSImage imageNamed:@"loading"] errorImage:[NSImage imageNamed:@"error"] andDisplaySpinningWheel:YES];
    /*You can also download images by:
            [_imageView downloadImageFromURL:_imageURL.stringValue]; 
                    --> Simply download the image
     
            [_imageView downloadImageFromURL:_imageURL.stringValue withPlaceholderImage:[NSImage imageNamed:@"loading"]];
                    --> Download the image and displays a placeholder image on the NSImageView 
     
            [_imageView downloadImageFromURL:_imageURL.stringValue withPlaceholderImage:[NSImage imageNamed:@"loading"] andErrorImage:[NSImage imageNamed:@"error"];
                    --> Download the image, displays a placeholder image on the NSImageView and displays another image if there's an error while loading
     */
    
    //Setting the tooltips to the NSImageView for each Image state. All at one time
    [_imageView setToolTipWhileLoading:_whileLoadingTXT.stringValue whenFinished:_whenFinishedTXT.stringValue andWhenFinishedWithError:_whenErrorOccurred.stringValue];
}

- (IBAction)cancelDownload:(id)sender {
    if ([_imageView isLoadingImage]){ //you want to stop loading the image when it's loading
        [_imageView cancelDownload]; //cancel it!
    }
}
@end
