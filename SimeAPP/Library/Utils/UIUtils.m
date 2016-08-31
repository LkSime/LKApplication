//
//  UIUtils.m
//  oneping
//
//  Created by jx on 14-11-17.
//  Copyright (c) 2014年 1ping.com. All rights reserved.
//

#import "UIUtils.h"
#import "AppDelegate.h"

@implementation UIUtils

+(UIViewController*)createVC:(NSString*)vcName{
    id myObj = [[NSClassFromString(vcName) alloc] init];
    if (!myObj) {
        NSAssert(myObj != nil, @"%@ 不存在",vcName);
        return nil;
    }
    return myObj;
}




+(void)adjustLabelFrameFromText:(UILabel *)lab{
    lab.numberOfLines = 0;
    CGRect aFrame = lab.frame;
    CGSize aMaxSize = CGSizeMake(aFrame.size.width, 2000);
    CGSize aLabelSize = [lab.text sizeWithFont:lab.font constrainedToSize:aMaxSize lineBreakMode:NSLineBreakByWordWrapping];
//    CGRect aChangeFrame = CGRectMake(aFrame.origin.x, aFrame.origin.y, aFrame.size.width, MAX(aFrame.size.height, aLabelSize.height));
    CGRect aChangeFrame = CGRectMake(aFrame.origin.x, aFrame.origin.y, aFrame.size.width, aLabelSize.height);
    lab.frame = aChangeFrame;
}

+(void)adjustLabelWidthFromText:(UILabel *)lab{
    CGRect aFrame = lab.frame;
    CGSize aDeseaseSize = [lab.text sizeWithFont:lab.font constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
    CGRect aChangeFrame = CGRectMake(aFrame.origin.x, aFrame.origin.y, aDeseaseSize.width, aFrame.size.height);
    lab.frame = aChangeFrame;
}


+(UIImage*)getCapImage:(NSString*)imageName{
    return [UIUtils getCapImage:imageName withEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
}

+(UIImage*)getCapImage:(NSString*)imageName
        withEdgeInsets:(UIEdgeInsets)edgeInsets{
    UIImage *aImage = [UIImage imageNamed:imageName];
    aImage = [aImage resizableImageWithCapInsets:edgeInsets];
    return aImage;
}
+ (UIImage *)creatResizableImageFromImageName:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.5, image.size.height * 0.5, image.size.width * 0.5)];
    return image;
}
@end
