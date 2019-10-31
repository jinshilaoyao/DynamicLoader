//
//  ONLMoudleA.m
//  python
//
//  Created by yao_kooleam on 2019/10/31.
//  Copyright © 2019 yao_kooleam. All rights reserved.
//

#import "ONLMoudleA.h"
#import "ONLDynamicLoader.h"
@implementation ONLMoudleA

+ (instancetype)shareMoudeleA {
    static id shareMoudeleA = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        // alloc & init work
        shareMoudeleA = [[self alloc]init];
    });
    
    return shareMoudeleA;
}

- (void)setUP{
    NSLog(@"ONLMoudleA 启动了");
}

// 根据实际的项目需求做到可插拔、解耦合、可复用等等等的问题
CRDYML_FUNCTIONS_EXPORT_BEGIN(LEVEL_C)
[[ONLMoudleA shareMoudeleA]setUP];
CRDYML_FUNCTIONS_EXPORT_END(LEVEL_C)

@end
