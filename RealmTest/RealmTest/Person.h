//
//  Person.h
//  RealmTest
//
//  Created by ybt on 2018/1/13.
//  Copyright © 2018年 logDealTeam. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"

RLM_ARRAY_TYPE(Dog)
@interface Person : RLMObject
@property NSString *name;
@property RLMArray<Dog *><Dog>  *dogs;
@end
