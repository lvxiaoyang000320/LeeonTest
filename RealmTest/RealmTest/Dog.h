//
//  Dog.h
//  RealmTest
//
//  Created by ybt on 2018/1/13.
//  Copyright © 2018年 logDealTeam. All rights reserved.
//

#import <Realm/Realm.h>

@interface Dog : RLMObject
@property NSString *name;
@property NSInteger age;
@end
