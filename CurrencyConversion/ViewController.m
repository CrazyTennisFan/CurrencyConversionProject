//
//  ViewController.m
//  CurrencyConversion
//
//  Created by Lucas Yang on 2017-05-31.
//  Copyright © 2017 Lucas Yang. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController
- (IBAction)buttonPress:(id)sender {
    
    self.convertButton.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies
{
    
    self.convertButton.enabled = YES;
    double inputValue = [self.inputField.text floatValue];
    
    double labelGBP = inputValue * currencies.GBP;
    NSString *temp = [NSString stringWithFormat:@"%.2f",labelGBP];
    self.currencyA.text = temp;
    
    double labelJPY = inputValue * currencies.JPY;
    temp = [NSString stringWithFormat:@"%.2f",labelJPY];
    self.currencyB.text = temp;
    
    double labelEURO = inputValue * currencies.EUR;
    temp = [NSString stringWithFormat:@"%.2f",labelEURO];
    self.currencyC.text = temp;
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
