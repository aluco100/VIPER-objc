//
//  ExchangeModule.m
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 03-07-22.
//

#import "ExchangeModule.h"
#import "ExchangePresenter.h"
#import "ExchangeInteractor.h"
#import "ExchangeFetchAPIRepository.h"
#import "ExchangeRouter.h"
#import "ExchangeViewController.h"

@implementation ExchangeModule

-(instancetype)init {
    self = [super init];
    if (!self) return nil;
    ExchangeFetchAPIRepository* repo = [[ExchangeFetchAPIRepository alloc] init];
    ExchangeInteractor* interactor = [[ExchangeInteractor alloc] initWithRepo: repo];
    ExchangeRouter* router = [[ExchangeRouter alloc] init];
    ExchangePresenter* presenter = [[ExchangePresenter alloc] initWith: interactor router: router];
    interactor.presenter = presenter;
    _presenter = presenter;
    return self;
}

-(void)startFlow:(UINavigationController *)context {
    [_presenter startFlow: context];
}
@end
