//
//  NovaObsOrcamentoViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 8/1/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "NovaObsOrcamentoViewController.h"

@interface NovaObsOrcamentoViewController ()


@property (weak, nonatomic) IBOutlet UISwitch *salvaSwitchON;

@property (weak, nonatomic) IBOutlet UITextField *obsOrcaTextField;
@end

@implementation NovaObsOrcamentoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.observacaoOrca = self.obsOrcaTextField.text;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
