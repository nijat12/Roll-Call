//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Nijat Zeynalov on 11/21/13.
//  Copyright (c) 2013 Nijat Zeynalov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject

@property (strong, nonatomic) NSMutableArray *dictionary;
+ (BNRImageStore *)sharedStore;

- (void)setImage:(UIImage *)i;
- (UIImage *)getImage;

@end
