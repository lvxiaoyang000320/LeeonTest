//
//  ViewController.m
//  RealmTest
//
//  Created by ybt on 2018/1/13.
//  Copyright © 2018年 logDealTeam. All rights reserved.
//

#import "ViewController.h"

#import "Dog.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Dog *dog = [[Dog alloc] init];
    dog.name = @"Rex";
    dog.age = 1;
    
    RLMResults<Dog *>  *results = [Dog objectsWhere:@"age > 2"];
    NSLog(@"%ld", results.count);
    
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    //存储数据
    [realm transactionWithBlock:^{
        [realm addObject:dog];
    }];
    
    NSLog(@"%ld", results.count);
    
    //数据更新操作
     //先找到数据库中的对象
    
    Dog *changeDog = [[Dog objectsWhere:@"age == 1"] firstObject];
    [realm beginWriteTransaction];
    changeDog.age = 3;
    [realm commitWriteTransaction];
    
    NSLog(@"%ld", changeDog.age);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
