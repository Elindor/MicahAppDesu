//
//  ContentAdjustmentViewController.m
//  MicahApp
//
//  Created by Gabriel Nopper on 01/08/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ContentAdjustmentViewController.h"
#import "SaveData.h"
#import "orcamentos.h"

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
    
    [self refreshAppearanceContent];
    
    self.totalTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.descontoPorcentagemTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.descontoPrecoTextfield.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.acrescimoPorcentagemTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.acrescimoPrecoTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.totalFinalTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    
    self.totalFinalTextField.layer.borderWidth = 1.0f;
    self.totalTextField.layer.borderWidth = 1.0f;
    self.descontoPrecoTextfield.layer.borderWidth = 1.0f;
    self.descontoPorcentagemTextField.layer.borderWidth = 1.0f;
    self.acrescimoPrecoTextField.layer.borderWidth = 1.0f;
    self.acrescimoPorcentagemTextField.layer.borderWidth = 1.0f;
    
    
    //self.totalTextField.text = [self.total stringValue];
    
//    self.descontoPorcentagemTextField.text = [self.descontoPorcentagem stringValue];
//    self.descontoPrecoTextfield.text = [self.descontoPreco stringValue];
//    self.acrescimoPorcentagemTextField.text = [self.acrescimoPorcentagem stringValue];
//    self.acrescimoPrecoTextField.text = [self.acrescimoPreco stringValue];
    //self.totalFinalTextField.text = [self.totalFinal stringValue];
    
    // Do any additional setup after loading the view.
}

-(void)refreshAppearanceContent{
    [self adaptValuesForward];
    SaveData *save = [SaveData sharedAppData];
    orcamentos *current = save.currentOrca;
    self.totalTextField.text = [current.finalValue stringValue];
    self.descontoPrecoTextfield.text = [current.finalDiscount stringValue];
    float disc2 = ([current.finalDiscount floatValue]/[current.finalValue floatValue]) * 100;
    NSNumber *disc3 = @(ceil(disc2));
    self.descontoPorcentagemTextField.text = [NSString stringWithFormat:@"%@%%",[disc3 stringValue]];
    self.acrescimoPrecoTextField.text = [current.finalSum stringValue];
    float acres2 = ([current.finalSum floatValue]/[current.finalValue floatValue]) * 100;
    NSNumber *acres3 = @(ceil(acres2));
    self.acrescimoPorcentagemTextField.text = [NSString stringWithFormat:@"%@%%",[acres3 stringValue]];
    self.totalFinalTextField.text = [current.resultValue stringValue];
    
}

-(void)adaptValuesForward{
    SaveData *save = [SaveData sharedAppData];
    orcamentos *current = save.currentOrca;
    
    current.resultValue = [NSNumber numberWithFloat:[current.finalValue floatValue] - [current.finalDiscount floatValue] + [current.finalSum floatValue]];
    
    
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
- (IBAction)discountPercExit:(id)sender {
    
    SaveData *save = [SaveData sharedAppData];
    orcamentos *current = save.currentOrca;
    float percDisc = [self.descontoPorcentagemTextField.text floatValue];
    current.finalDiscount = [NSNumber numberWithFloat:([current.finalValue floatValue]/100) * percDisc];
    [save save];
    
    [self refreshAppearanceContent];
}
- (IBAction)discountExit:(id)sender {
    
    SaveData *save = [SaveData sharedAppData];
    orcamentos *current = save.currentOrca;
    current.finalDiscount = [NSNumber numberWithFloat:[self.descontoPrecoTextfield.text floatValue]];
    [save save];
    [self refreshAppearanceContent];
}
- (IBAction)acrescPercExit:(id)sender {
    
    SaveData *save = [SaveData sharedAppData];
    orcamentos *current = save.currentOrca;
    float acresDisc = [self.acrescimoPorcentagemTextField.text floatValue];
    current.finalSum = [NSNumber numberWithFloat:([current.finalValue floatValue]/100) * acresDisc];
    [save save];
    
    [self refreshAppearanceContent];
}
- (IBAction)acrescExit:(id)sender {
    
    SaveData *save = [SaveData sharedAppData];
    orcamentos *current = save.currentOrca;
    current.finalSum = [NSNumber numberWithFloat:[self.acrescimoPrecoTextField.text floatValue]];
    [save save];
    
    [self refreshAppearanceContent];
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
