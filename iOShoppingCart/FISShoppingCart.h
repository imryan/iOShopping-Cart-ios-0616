//
//  FISShoppingCart.h
//  iOShoppingCart
//
//  Created by Ryan Cohen on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISItem.h"

@interface FISShoppingCart : NSObject

@property (nonatomic, strong) NSMutableArray *items;

- (NSUInteger)calculateTotalPriceInCents;

- (void)addItem:(FISItem *)item;
- (void)removeItem:(FISItem *)item;
- (void)removeAllItemsLikeItem:(FISItem *)item;

- (void)sortItemsByNameAsc;
- (void)sortItemsByNameDesc;
- (void)sortItemsByPriceInCentsAsc;
- (void)sortItemsByPriceInCentsDesc;

- (NSArray *)allItemsWithName:(NSString *)name;
- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)cents;
- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)cents;

@end
