//
//  ExchangePresenter.m
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 25-06-22.
//

#import "ExchangePresenter.h"
#import "Currency.h"
#import "ExchangeInteractor.h"
#import "ExchangeFetchAPIRepository.h"

@implementation ExchangePresenter

-(instancetype)initWith:(id<ExchangeInteractorInputProtocol>)interactor router:(id<ExchangeRouterInputProtocol>)router {
    self = [super init];
    if (!self) return nil;
    _interactor = interactor;
    _router = router;
    return self;
}

- (void)fetchExchange:(nonnull NSString *)base {
    [_interactor fetchExchange: base];
}

- (void)didFetchExchangeSuccessfully:(Currency *)currency {
    [_view didFetchExchangeSuccessfully: currency];
}

-(void)didFetchExchangeFailure:(NSError *)error {
    [_view didFetchExchangeFailure: error];
}

-(void)startFlow:(UINavigationController *)context {
    [_router startFlow: context with: self];
}

-(void)setView:(id<ExchangeViewOutputProtocol>)view {
    _view = view;
}

@end
