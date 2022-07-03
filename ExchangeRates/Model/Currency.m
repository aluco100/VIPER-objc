//
//  Currency.m
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 25-06-22.
//

#import "Currency.h"

@implementation Currency

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [self init];
    if (!self) {
        return nil;
    }
    
    _base = [coder decodeObjectForKey:@"base"];
    _date = [coder decodeObjectForKey:@"date"];
    _rates = [coder decodeObjectForKey:@"rates"];
    
    return self;
}

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (!self) return nil;
    
    for (NSString *key in json) {
        @try {
            [self setValue:[json valueForKey: key] forKey: key];
        } @catch (NSException *exception) {
            NSLog(@"%@", exception);
        }
    }
    
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:_base forKey:@"base"];
    [coder encodeObject:_date forKey:@"date"];
    [coder encodeObject:_rates forKey:@"rates"];
}

-(NSArray *)getRatesKeys {
    return [_rates allKeys];
}


@end
