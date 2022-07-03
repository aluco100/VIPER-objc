//
//  ExchangeViewController.h
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 03-07-22.
//

#import <UIKit/UIKit.h>
#import "ExchangeProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExchangeViewController : UIViewController<ExchangeViewInputProtocol, ExchangeViewOutputProtocol, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, nullable) id<ExchangePresenterInputProtocol> presenter;
@property NSString* base;
@property Currency* currency;

- (instancetype) initWithBase: (NSString*) base presenter: (id<ExchangePresenterInputProtocol>) presenter;
@end

NS_ASSUME_NONNULL_END
