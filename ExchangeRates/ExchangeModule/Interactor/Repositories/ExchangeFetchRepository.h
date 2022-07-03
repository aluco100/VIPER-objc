//
//  ExchangeFetchRepository.h
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 26-06-22.
//

#import <Foundation/Foundation.h>
#import "Currency.h"

@protocol ExchangeFetchRepository <NSObject>

- (void) fetchExchange: (NSString* _Nonnull) base completion: (void (^_Nonnull)(Currency* _Nullable response, NSError* _Nullable error)) completion;

@end
