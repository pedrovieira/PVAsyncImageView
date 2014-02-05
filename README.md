PVAsyncImageView [![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/pedrovieira7/pvasyncimageview/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
================
A simple NSImageView subclass that let's you download images asynchronously from the web on the Mac with some other useful properties.

Features
----------------
* Download images from the Web to the NSImageViews asynchronously with just 1 line of code
* Set a 'Placheholder Image' to be displayed on the NSImageView until the image is downloaded
* Set an 'Error Image' to be displayed when an error occurs while downloading the image
* Set ToolTips on the NSImageView for each state -> Loading Image / Image Loaded / Error Loading Image
* Display a Spinning Wheel on top of the NSImageView while it's downloading the image

How-to-use
----------
1.  Add both .h and .m files of PVAsyncImageView to your project.
2.  Import PVAsyncImageView.h to wherever you want to use it just by `#import "PVAsyncImageView.h"`
3.  Set the PVAsyncImageView class to your NSImageView in Interface Builder or by code
4.  Download an image (there are many methods to load images, but this is the most completed one) by:

``` objective-c
[_imageView downloadImageFromURL:@"mywebsite.com/image.png" withPlaceholderImage:[NSImage imageNamed:@"loading_IMG"] errorImage:[NSImage imageNamed:@"error_IMG"] andDisplaySpinningWheel:YES];
```

Demo Project
----------
This includes a Demo project that explains how to use PVAsyncImageView easily, with almost no lines of code.

Author
----------------
PVAsyncImageView was created by Pedro Vieira.<br>
[@w1tch_](https://twitter.com/w1tch_)  
<a href="mailto:pedrovieiradev@hotmail.com?Subject=PVAsyncImageView">pedrovieiradev@hotmail.com</a>

License
----------------
PVAsyncImageView is licensed under the terms of the BSD. Read the LICENSE file for more information.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/pedrovieira7/pvasyncimageview/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

