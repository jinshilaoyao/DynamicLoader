//
//  ViewController.m
//  python
//
//  Created by yao_kooleam on 2019/10/30.
//  Copyright © 2019 yao_kooleam. All rights reserved.
//

#import "ViewController.h"
#import "ONLDynamicLoader.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [ONLDynamicLoader executeFunctionsForKey:LEVEL_B];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [ONLDynamicLoader executeFunctionsForKey:LEVEL_C];
    // 根据实际的项目需求做到可插拔、解耦合、可复用等等等的问题
}

@end
