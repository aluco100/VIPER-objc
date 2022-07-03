//
//  ExchangeInteractor.h
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 25-06-22.
//

#import <Foundation/Foundation.h>
#import "ExchangeProtocols.h"
#import "ExchangeFetchRepository.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExchangeInteractor : NSObject<ExchangeInteractorInputProtocol>

@property (nonatomic, weak, nullable) id<ExchangeInteractorOutputProtocol> presenter;
@property id<ExchangeFetchRepository> repo;

-(instancetype) initWithRepo: (id<ExchangeFetchRepository>) repo;

@end

NS_ASSUME_NONNULL_END
