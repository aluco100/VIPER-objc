//
//  ExchangePresenter.h
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 25-06-22.
//

#import <Foundation/Foundation.h>
#import "ExchangeProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExchangePresenter : NSObject<ExchangePresenterInputProtocol, ExchangeInteractorOutputProtocol>

@property (nonatomic, strong, nullable) id<ExchangeInteractorInputProtocol> interactor;
@property (nonatomic, weak, nullable) id<ExchangeViewOutputProtocol> view;
@property (nonatomic, strong, nullable) id<ExchangeRouterInputProtocol> router;

-(instancetype) initWith: (id<ExchangeInteractorInputProtocol>) interactor router: (id<ExchangeRouterInputProtocol>) router;

@end

NS_ASSUME_NONNULL_END
