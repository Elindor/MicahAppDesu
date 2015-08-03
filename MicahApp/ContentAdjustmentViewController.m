//
//  ContentAdjustmentViewController.m
//  MicahApp
//
//  Created by Gabriel Nopper on 01/08/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ContentAdjustmentViewController.h"

@interface ContentAdjustmentViewController ()

@property (weak, nonatomic) IBOutlet UITextField *totalTextField;

@property (weak, nonatomic) IBOutlet UITextField *descontoPorcentagemTextField;


@property (weak, nonatomic) IBOutlet UITextField *descontoPrecoTextfield;

@property (weak, nonatomic) IBOutlet UITextField *acrescimoPorcentagemTextField;

@property (weak, nonatomic) IBOutlet UITextField *acrescimoPrecoTextField;


@property (weak, nonatomic) IBOutlet UITextField *totalFinalTextField;

@end

@implementation ContentAdjustmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.totalTextField.text = [self.total stringValue];
//    self.descontoPorcentagemTextField.text = [self.descontoPorcentagem stringValue];
//    self.descontoPrecoTextfield.text = [self.descontoPreco stringValue];
//    self.acrescimoPorcentagemTextField.text = [self.acrescimoPorcentagem stringValue];
//    self.acrescimoPrecoTextField.text = [self.acrescimoPreco stringValue];
    self.totalFinalTextField.text = [self.totalFinal stringValue];
    
    // Do any additional setup after loading the view.
}

//- (float)calculaTotal{
//
//    
//    
//    return <#expression#>
//    
//}

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
