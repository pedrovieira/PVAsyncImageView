//
//  PVAsyncImageView.h
//
//  Created by Pedro Vieira on 7/11/12
//  Copyright (c) 2012 Pedro Vieira. ( https://twitter.com/W1TCH_ )
//  All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PVAsyncImageView : NSImageView {
    NSURLConnection *imageURLConnection;
    NSMutableData *imageDownloadData;
    NSImage *errorImage;
    
    NSTrackingArea *trackingArea;
}


@property (readonly) BOOL isLoadingImage;
@property (readonly) BOOL userDidCancel;
@property (readonly) BOOL didFailLoadingImage;

@property (readwrite) NSString *toolTipWhileLoading;
@property (readwrite) NSString *toolTipWhenFinished;
@property (readwrite) NSString *toolTipWhenFinishedWithError;


//Loads an image from the web
- (void)downloadImageFromURL:(NSString *)url;

//Loads an image from the web with a placeholder image
- (void)downloadImageFromURL:(NSString *)url withPlaceholderImage:(NSImage *)img;

//Loads an image from the web with a placeholder image and displays another image if there's an error while loading
- (void)downloadImageFromURL:(NSString *)url withPlaceholderImage:(NSImage *)img andErrorImage:(NSImage *)errorImg;

//Stops loading the image
- (void)cancelDownload;

//Method to set all tooltips at once. Just to make things fast and easy
-(void)setToolTipWhileLoading:(NSString *)ttip1 whenFinished:(NSString *)ttip2 andWhenFinishedWithError:(NSString *)ttip3;

//Deletes all the ToolTips
-(void)deleteToolTips;


@end