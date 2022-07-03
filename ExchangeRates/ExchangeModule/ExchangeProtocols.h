//
//  ExchangeProtocols.h
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 26-06-22.
//

#import "Currency.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - Interactor Protocols

@protocol ExchangeInteractorInputProtocol <NSObject>

- (void) fetchExchange: (NSString*)base;

@end

@protocol ExchangeInteractorOutputProtocol <NSObject>

- (void) didFetchExchangeSuccessfully: (Currency*) currency;
- (void) didFetchExchangeFailure: (NSError*) error;

@end

#pragma mark - View Protocols

@protocol ExchangeViewInputProtocol <NSObject>

- (void) fetchExchange: (NSString*) base;

@end

@protocol ExchangeViewOutputProtocol <NSObject>

- (void) didFetchExchangeSuccessfully: (Currency*) currency;
- (void) didFetchExchangeFailure: (NSError*) error;

@end

#pragma mark - Module Protocol

@protocol ExchangeModuleProtocol <NSObject>

-(void) startFlow: (UINavigationController*) context;

@end

#pragma mark - Presenter Protocols

@protocol ExchangePresenterInputProtocol <NSObject>

- (void) setView: (id<ExchangeViewInputProtocol>) view;
- (void) fetchExchange: (NSString*) base;
- (void) startFlow: (UINavigationController*) context;

@end

@protocol ExchangePresenterOutputProtocol <NSObject>

- (void) didFetchExchangeSuccessfully: (Currency*) currency;
- (void) didFetchExchangeFailure: (NSError*) error;

@end

#pragma mark - Router Protocol

@protocol ExchangeRouterInputProtocol <NSObject>

- (void) startFlow: (UINavigationController*) context with: (id<ExchangePresenterInputProtocol>) presenter;

@end
