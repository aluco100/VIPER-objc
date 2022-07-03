//
//  ExchangeViewController.m
//  ExchangeRates
//
//  Created by Alfredo Luco Gordon on 03-07-22.
//

#import "ExchangeViewController.h"
#import "ExchangePresenter.h"

@interface ExchangeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ExchangeViewController

-(instancetype)initWithBase:(NSString *)base presenter:(id<ExchangePresenterInputProtocol>)presenter {
    self = [super initWithNibName:@"ExchangeViewController" bundle: nil];
    _presenter = presenter;
    _base = base;
    if (!self) return nil;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchExchange: _base];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

-(void)fetchExchange:(NSString *)base {
    [_presenter fetchExchange: base];
}

-(void)didFetchExchangeSuccessfully:(Currency *)currency {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.currency = currency;
        [self.tableView reloadData];
    });
}

-(void)didFetchExchangeFailure:(NSError *)error {
    NSLog(@"%@", error.localizedDescription);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _currency.rates.allKeys.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    NSString* key =  _currency.rates.allKeys[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %.1f", key, (1 / [_currency.rates[key] floatValue])];
    return cell;
}

@end
