//
//  ExchangeFetchAPIRepository.m
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 26-06-22.
//

#import "ExchangeFetchAPIRepository.h"

@implementation ExchangeFetchAPIRepository

NSString *endpoint = @"https://api.exchangerate.host/latest";

-(void)fetchExchange:(NSString *)base completion:(void (^)(Currency * _Nullable, NSError * _Nullable))completion {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSMutableURLRequest *request = [self getRequestWith: base];
    
    
    NSURLSessionTask* task = [session dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) completion(nil, error);
        else {
            NSError* decodedError;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingAllowFragments error: &decodedError];
            if (decodedError) {
                completion(nil, decodedError);
            }
            Currency *currency = [[Currency alloc] initWithJSON:json];
            completion(currency, nil);
        }
    }];
    [task resume];
}

-(NSMutableURLRequest*) getRequestWith: (NSString*) base {
    NSURLComponents *components = [[NSURLComponents alloc] initWithString: endpoint];
    components.queryItems = @[[[NSURLQueryItem alloc] initWithName:@"base" value:base]];
    NSURL *url = components.URL;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
    [request setHTTPMethod:@"GET"];
    return request;
}

@end
