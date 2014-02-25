//
//  XYZToDoItem.m
//  ToDoList
//
//  Created by Maria Montserrat Lozano on 23/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "XYZToDoItem.h"

@implementation XYZToDoItem

- (void)markAsCompleted:(BOOL)isComplete {
    self.completed = isComplete;
    [self setCompletionDate];

}

- (void)setCompletionDate {
    if (self.completed) {
        self.completionDate = [NSDate date];
    }else {
        self.completionDate = nil;
    }
}

@end
