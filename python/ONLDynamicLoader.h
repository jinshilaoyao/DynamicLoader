//
//  ONLDynamicLoader.h
//  python
//
//  Created by yao_kooleam on 2019/10/30.
//  Copyright © 2019 yao_kooleam. All rights reserved.
//

#import <Foundation/Foundation.h>

static char * LEVEL_A = "LEVEL_A";
static char * LEVEL_B = "LEVEL_B";
static char * LEVEL_C = "LEVEL_C";

typedef void (*ONLDynamicLoaderInjectFunction)(void);

#define CRDYML_SEGMENTNAME "__DATA"
#define CRDYML_ATTRIBUTE(sectionName) __attribute((used, section(CRDYML_SEGMENTNAME "," #sectionName )))

#define CRDYML_FUNCTIONS_EXPORT_BEGIN(KEY) static void CRDYML_INJECT_##KEY##_FUNCTION(void){

#define CRDYML_FUNCTIONS_EXPORT_END(KEY) } static ONLDynamicLoaderInjectFunction dymlLoader##KEY##function CRDYML_ATTRIBUTE(KEY) = CRDYML_INJECT_##KEY##_FUNCTION;

NS_ASSUME_NONNULL_BEGIN

@interface ONLDynamicLoader : NSObject

+ (void)executeFunctionsForKey:(char *)key;

@end

NS_ASSUME_NONNULL_END
