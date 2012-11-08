PVAsyncImageView
================
A simple NSImageView subclass that let's you download images from the web asynchronously on the Mac with some other useful properties.

Features
----------------
* Download images from the Web to the NSImageViews asynchronously with just 1 line of code
* Set a 'Placheholder Image' to be displayed on the NSImageView until the image is downloaded
* Set an 'Error Image' to be displayed when an error occurs while downloading the image
* Set ToolTips on the NSImageView for each state -> Loading Image / Image Loaded / Error Loading Image

How-to-use
----------
1.  Add both .h and .h files of PVAsyncImageView to your project.
2.  Import PVAsyncImageView.h to wherever you want to use it just by `#import "PVAsyncImageView.h"` .
3.  Set PVAsyncImageView class to your NSImageView in Interface Builder (easier) or by code using `PVAsyncImageView *pvImageView = (PVAsyncImageView *)_yourImageView;`
4.  Download an image (there are many methods to load images, but this is the most completed one) by:

``` objective-c
[_imageView downloadImageFromURL:@"mywebsite.com/image.png" withPlaceholderImage:[NSImage imageNamed:@"loading_IMG"] errorImage:[NSImage imageNamed:@"error_IMG"] andDisplaySpinningWheel:YES];
```



Author
----------------
PVAsyncImageView was created by Pedro Vieira.<br>
[@W1TCH_](https://twitter.com/W1TCH_)  
<a href="mailto:pedrovieiradev@hotmail.com?Subject=PVAsyncImageView">pedrovieiradev@hotmail.com</a>

License
----------------
PVAsyncImageView is licensed under the terms of the BSD. Read the LICENSE file for more information.
