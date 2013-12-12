//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Nijat Zeynalov on 11/21/13.
//  Copyright (c) 2013 Nijat Zeynalov. All rights reserved.
//

#import "BNRImageStore.h"

//To Store the Images captures
@implementation BNRImageStore
@synthesize dictionary;
+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

+ (BNRImageStore *)sharedStore
{
    static BNRImageStore *sharedStore = nil;
    if (!sharedStore)
    {
        sharedStore = [[super allocWithZone:NULL] init];
    }
    return sharedStore;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        dictionary = [[NSMutableArray alloc] init];
    }
    return self;
}

- (UIImage *)getImage
{
        return [dictionary objectAtIndex:0];
}
- (void)setImage:(UIImage *)i
{
    [dictionary removeAllObjects];
    [dictionary addObject:i];
}
@end
