//
//  ONLDynamicLoader.m
//  python
//
//  Created by yao_kooleam on 2019/10/30.
//  Copyright © 2019 yao_kooleam. All rights reserved.
//

#import "ONLDynamicLoader.h"
#import "ONLDynamicLoader.h"
#include <mach-o/getsect.h>
#include <mach-o/loader.h>
#include <mach-o/dyld.h>
#include <dlfcn.h>

static void ONLDynamicLoader_invoke_method(void *key){
    Dl_info info;
    int ret = dladdr(ONLDynamicLoader_invoke_method, &info);
    if(ret == 0){
        // fatal error
    }
#ifndef __LP64__
    const struct mach_header *mhp = (struct mach_header*)info.dli_fbase;
    unsigned long size = 0;
    uint32_t *memory = (uint32_t*)getsectiondata(mhp, QWLoadableSegmentName, QWLoadableSectionName, & size);
#else /* defined(__LP64__) */
    const struct mach_header_64 *mhp = (struct mach_header_64*)info.dli_fbase;
    unsigned long size = 0;
    uint64_t *memory = (uint64_t*)getsectiondata(mhp, CRDYML_SEGMENTNAME, key, &size);
#endif /* defined(__LP64__) */
    
    for(int idx = 0; idx < size/sizeof(void*); ++idx){
        ONLDynamicLoaderInjectFunction func = (ONLDynamicLoaderInjectFunction)memory[idx];
        func(); //crash tofix
    }
}


@implementation ONLDynamicLoader

+ (void)executeFunctionsForKey:(char *)key
{
    ONLDynamicLoader_invoke_method(key);
}
// 示例 编译阶段注册的启动项
CRDYML_FUNCTIONS_EXPORT_BEGIN(LEVEL_A)
NSLog(@"=====LEVEL_A==========");
CRDYML_FUNCTIONS_EXPORT_END(LEVEL_A)

CRDYML_FUNCTIONS_EXPORT_BEGIN(LEVEL_B)
NSLog(@"=====LEVEL_B==========");
CRDYML_FUNCTIONS_EXPORT_END(LEVEL_B)

CRDYML_FUNCTIONS_EXPORT_BEGIN(LEVEL_C)
NSLog(@"=====LEVEL_C==========");
CRDYML_FUNCTIONS_EXPORT_END(LEVEL_C)


@end
