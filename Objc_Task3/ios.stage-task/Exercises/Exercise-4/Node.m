//
//  Node.m
//  ios.stage-task
//
//  Created by dzmitry ilyin on 5/23/21.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithValue:(NSNumber *)value
{
    self = [super init];
    if (self) {
        _value = value;
    }
    return self;
}

@end
