//
//  Currency.h
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 25-06-22.
//

#import <Foundation/Foundation.h>
#import "ModelProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface Currency : NSObject<NSCoding, JSONable>
@property NSString* base;
@property NSString* date;
@property NSDictionary* rates;

- (NSArray*)getRatesKeys;

@end

NS_ASSUME_NONNULL_END
