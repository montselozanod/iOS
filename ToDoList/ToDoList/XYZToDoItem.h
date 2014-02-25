//
//  XYZToDoItem.h
//  ToDoList
//
//  Created by Maria Montserrat Lozano on 23/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property NSDate *creationDate;
@property NSDate *completionDate;

- (void)markAsCompleted:(BOOL)isComplete;


@end
