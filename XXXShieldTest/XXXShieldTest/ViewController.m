//
//  ViewController.m
//  XXXShieldTest
//
//  Created by ybt on 2018/1/13.
//  Copyright © 2018年 logDealTeam. All rights reserved.
//

#import "ViewController.h"
#define KleadWith    30
#define KTopleading  250
#define KButtonSize  100
#define KButttonLeading  10
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr = @[@"KVO",@"Container",@"Unrecoginzed",@"NSNull",@"NSNotication",@"TBC"];
    for (int i = 0; i < 6; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        float x = KleadWith + (KButtonSize + KButttonLeading) * i;
        float y = KTopleading;
        if(x + KButtonSize > self.view.frame.size.width) {
            y = y + KButtonSize + KButttonLeading;
            x = KleadWith + (KButtonSize + KButttonLeading) * (i%3);
        }

        button.frame = CGRectMake(x, y, KButtonSize, KButtonSize);
        button.backgroundColor = [UIColor blueColor];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
            case 0:
        {
        //KVO
            [self KVO];
        }
            break;
            case 1:
        {
            //Container
            [self Container];
        }
            break;
            case 2:
        {
            //Unrecoginzed
            [self Unrecoginzed];
        }
            break;
            case 3:
        {
            //NSNull
            [self NSNull];
        }
            break;
            case 4:
        {
            //NSNotication
            [self NSNotication];
        }
            break;
            case 5:
        {
            [self TBC];
        }
            break;
            
        default:
            break;
    }
}
- (void)KVO {
    [self addObserver:self forKeyPath:@"view" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self removeObserver:self forKeyPath:@"view"];
    [self removeObserver:self forKeyPath:@"view"];

}

- (void)Container {
    NSArray *arr = @[@"1",@"2",@"3",@"4"];
    NSString *str = arr[4];
    NSLog(@"%@",str);
}

- (void)Unrecoginzed {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 500, 50, 50);
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(crashClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)NSNull {
    NSString *str;
//    NSMutableArray *arr = [NSMutableArray array];
//    [arr addObject:str];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:str forKey:@"str"];
    NSLog(@"%@",[dic objectForKey:@"str"]);
}

- (void)NSNotication {
    
    
}

- (void)TBC {
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
