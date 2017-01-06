//
//  UIView+ICDebug.m
//  ImageChat
//
//  Created by FigureWang on 17/1/4.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "UIView+ICDebug.h"

@implementation UIView (ICDebug)


- (CGPoint)ic_origin {
    return self.frame.origin;
}
- (CGFloat)ic_x {
    return self.ic_origin.x;
}
- (CGFloat)ic_y {
    return self.ic_origin.y;
}


- (CGSize)ic_size {
    return self.frame.size;
}

- (CGFloat)ic_height {
    return self.ic_size.height;
}
- (CGFloat)ic_width {
    return self.ic_size.width;
}

- (CGFloat)ic_intrinsicHeight {
    return self.intrinsicContentSize.height;
}
- (CGFloat)ic_intrinsicWidth {
    return self.intrinsicContentSize.width;
}

- (void)setIc_size:(CGSize)size {
    self.frame = CGRectMake(self.ic_x, self.ic_y, size.width, size.height);
}


@end
