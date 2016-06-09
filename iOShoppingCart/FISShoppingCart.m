//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Ryan Cohen on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents {
    NSUInteger total = 0;
    
    for (FISItem *item in self.items) {
        total += item.priceInCents;
    }
    
    return total;
}

- (void)addItem:(FISItem *)item {
    [self.items addObject:item];
}

- (void)removeItem:(FISItem *)item {
    for (NSUInteger i = 0; i < self.items.count; i++) {
        FISItem *currentItem = self.items[i];
        
        if ([currentItem isEqual:item]) {
            [self.items removeObjectAtIndex:i];
            break;
        }
    }
}

- (void)removeAllItemsLikeItem:(FISItem *)item {
    for (FISItem *theItem in [self.items copy]) {
        if ([theItem isEqual:item]) {
            [self.items removeObject:theItem];
        }
    }
}

- (void)sortItemsByNameAsc {
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray *sorted = [self.items sortedArrayUsingDescriptors:@[sortAsc]];
    
    self.items = [NSMutableArray arrayWithArray:sorted];
}

- (void)sortItemsByNameDesc {
    NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    NSArray *sorted = [self.items sortedArrayUsingDescriptors:@[sortDesc]];
    
    self.items = [NSMutableArray arrayWithArray:sorted];
}

- (void)sortItemsByPriceInCentsAsc {
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    NSArray *sorted = [self.items sortedArrayUsingDescriptors:@[sortAsc]];
    
    self.items = [NSMutableArray arrayWithArray:sorted];
}

- (void)sortItemsByPriceInCentsDesc {
    NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    NSArray *sorted = [self.items sortedArrayUsingDescriptors:@[sortDesc]];
    
    self.items = [NSMutableArray arrayWithArray:sorted];
}

- (NSArray *)allItemsWithName:(NSString *)name {
    NSMutableArray *items = [NSMutableArray array];
    
    for (FISItem *item in self.items) {
        if ([item.name isEqualToString:name]) {
            [items addObject:item];
        }
    }
    
    return items;
}

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)cents {
    NSMutableArray *items = [NSMutableArray array];
    
    for (FISItem *item in self.items) {
        if (item.priceInCents >= cents) {
            [items addObject:item];
        }
    }
    
    return items;
}

- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)cents {
    NSMutableArray *items = [NSMutableArray array];

    for (FISItem *item in self.items) {
        if (item.priceInCents <= cents) {
            [items addObject:item];
        }
    }
    
    return items;
}

@end
