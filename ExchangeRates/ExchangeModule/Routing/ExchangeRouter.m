//
//  ExchangeRouter.m
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 03-07-22.
//

#import "ExchangeRouter.h"
#import "ExchangeViewController.h"

@implementation ExchangeRouter

-(void)startFlow:(UINavigationController *)context with:(id<ExchangePresenterInputProtocol>)presenter {
    ExchangeViewController* view = [[ExchangeViewController alloc] initWithBase: @"CLP" presenter: presenter];
    [presenter setView: view];
    [context setViewControllers:@[view]];
}

@end
