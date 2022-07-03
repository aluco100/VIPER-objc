//
//  ExchangeModule.h
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 03-07-22.
//

#import <Foundation/Foundation.h>
#import "ExchangeProtocols.h"
#import "ExchangeViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExchangeModule : NSObject<ExchangeModuleProtocol>

@property (nonatomic, strong, nonnull) id<ExchangePresenterInputProtocol> presenter;

- (instancetype) init;

@end

NS_ASSUME_NONNULL_END
