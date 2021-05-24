//
//  Node.h
//  ios.stage-task
//
//  Created by dzmitry ilyin on 5/23/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property NSNumber *value;
@property(nonatomic, strong) Node *leftChild;
@property(nonatomic, strong) Node *rightChild;

-(instancetype)initWithValue:(NSNumber*)value;

@end

NS_ASSUME_NONNULL_END
