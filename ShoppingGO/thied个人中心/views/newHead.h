//
//  newHead.h
//  ceshi
//
//  Created by rimi on 16/3/29.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newHead : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, retain) UIImageView * imageView;

@property (nonatomic, retain) UIImage * image;

@property (nonatomic, retain) NSURL * url;

@property (nonatomic, retain) NSDictionary<NSString *,id> * dic;

@end
