//
//  PVAsyncImageView.m
//
//  Created by Pedro Vieira on 7/11/12
//  Copyright (c) 2012 Pedro Vieira. ( https://twitter.com/W1TCH_ )
//  All rights reserved.
//

#import "PVAsyncImageView.h"

@interface PVAsyncImageView ()
    @property (readwrite) BOOL isLoadingImage;
    @property (readwrite) BOOL userDidCancel;
    @property (readwrite) BOOL didFailLoadingImage;
@end


@implementation PVAsyncImageView

- (void)downloadImageFromURL:(NSString *)url{
    [self downloadImageFromURL:url withPlaceholderImage:nil andErrorImage:nil];
}

- (void)downloadImageFromURL:(NSString *)url withPlaceholderImage:(NSImage *)img{
    [self downloadImageFromURL:url withPlaceholderImage:img andErrorImage:nil];
}

- (void)downloadImageFromURL:(NSString *)url withPlaceholderImage:(NSImage *)img andErrorImage:(NSImage *)errorImg{
    [self cancelDownload];
    
    self.isLoadingImage = YES;
    self.didFailLoadingImage = NO;
    self.userDidCancel = NO;
    
    self.image = img;
    errorImage = errorImg;
    imageDownloadData = [NSMutableData data];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] delegate:self];
    imageURLConnection = conn;
}

- (void)cancelDownload{
    self.userDidCancel = YES;
    
    self.isLoadingImage = NO;
    self.didFailLoadingImage = NO;
    
    [imageURLConnection cancel];
    imageURLConnection = nil;
    imageDownloadData = nil;
    errorImage = nil;
    self.image = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [imageDownloadData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    self.isLoadingImage = NO;
    self.didFailLoadingImage = YES;
    self.userDidCancel = NO;
    
    imageDownloadData = nil;
    imageURLConnection = nil;
    
    self.image = errorImage;
    errorImage = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.didFailLoadingImage = NO;
    self.userDidCancel = NO;
    
    NSData *data = imageDownloadData;
    
    imageDownloadData = nil;
    imageURLConnection = nil;
    errorImage = nil;
    
    NSImage *img = [[NSImage alloc] initWithData:data];
    self.image = img;
    self.isLoadingImage = NO;
}

-(void)setToolTipWhileLoading:(NSString *)ttip1 whenFinished:(NSString *)ttip2 andWhenFinishedWithError:(NSString *)ttip3{
    self.toolTipWhileLoading = ttip1;
    self.toolTipWhenFinished = ttip2;
    self.toolTipWhenFinishedWithError = ttip3;
}

- (void)deleteToolTips{
    self.toolTipWhileLoading = @"";
    self.toolTipWhenFinished = @"";
    self.toolTipWhenFinishedWithError = @"";
}


#pragma mark Mouse Enter Events to display tooltips
- (void)mouseEntered:(NSEvent *)theEvent{
    if (!self.userDidCancel){ //if the user didn't cancel the operation show the tooltips
        
        if (self.isLoadingImage){ //if is loading image
        
            if(self.toolTipWhileLoading != nil && ![self.toolTipWhileLoading isEqualToString:@""]){
                self.toolTip = self.toolTipWhileLoading;
            }else{
                self.toolTip = @"";
            }
            
        }else if(self.didFailLoadingImage){ //if connection did fail
            
            if(self.toolTipWhenFinishedWithError != nil && ![self.toolTipWhenFinishedWithError isEqualToString:@""]){
                self.toolTip = self.toolTipWhenFinishedWithError;
            }else{
                self.toolTip = @"";
            }
            
        }else if(!self.isLoadingImage){ //if it's not loading image
        
            if(self.toolTipWhenFinished != nil && ![self.toolTipWhenFinished isEqualToString:@""]){
                self.toolTip = self.toolTipWhenFinished;
            }else{
                self.toolTip = @"";
            }
            
        }
        
    }
}

- (void)updateTrackingAreas{
    if(trackingArea != nil) {
        [self removeTrackingArea:trackingArea];
    }
    
    int opts = (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways);
    trackingArea = [ [NSTrackingArea alloc] initWithRect:[self bounds]
                                                 options:opts
                                                   owner:self
                                                userInfo:nil];
    [self addTrackingArea:trackingArea];
}

@end

