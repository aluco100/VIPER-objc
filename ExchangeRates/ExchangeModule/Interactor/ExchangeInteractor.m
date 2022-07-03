//
//  ExchangeInteractor.m
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 25-06-22.
//

#import "ExchangeInteractor.h"

@implementation ExchangeInteractor

-(instancetype)initWithRepo:(id<ExchangeFetchRepository>)repo {
    self = [super init];
    if (!self) return nil;
    _repo = repo;
    return self;
}

- (void)fetchExchange:(nonnull NSString *)base {
    [self.repo fetchExchange: base completion:^(Currency * _Nullable response, NSError * _Nullable error) {
        if (error) {
            [self.presenter didFetchExchangeFailure: error];
            return;
        }
        [self.presenter didFetchExchangeSuccessfully: response];
    }];
}

@end
