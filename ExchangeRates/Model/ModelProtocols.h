//
//  ModelProtocols.h
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 27-06-22.
//

#import <Foundation/Foundation.h>

@protocol JSONable <NSObject>
- (instancetype)initWithJSON:(NSDictionary*) json;
@end
