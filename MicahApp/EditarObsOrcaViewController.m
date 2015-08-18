//
//  EditarObsOrcaViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 8/1/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "EditarObsOrcaViewController.h"
#import "SaveData.h"
#import "orcamentos.h"

@interface EditarObsOrcaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *observacaoOrcaTextField;


@property NSString *initialStr;

@end

@implementation EditarObsOrcaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.observacaoOrcaTextField.text = self.observacaoOrca;
    // Do any additional setup after loading the view.
    self.initialStr = self.observacaoOrcaTextField.text;
    
    self.observacaoOrcaTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.observacaoOrcaTextField.layer.borderWidth = 1.0f;
    
    UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.observacaoOrcaTextField setLeftViewMode:UITextFieldViewModeAlways];
    [self.observacaoOrcaTextField setLeftView:spacerView];
    
    
    _observacaoOrcaTextField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)excluirObsButton:(UIButton *)sender {
    orcamentos *current = [SaveData sharedAppData].currentOrca;
    NSString *targetToRemove;
    for(NSString *str in current.observationList){
        if([str isEqualToString:_observacaoOrcaTextField.text])
            targetToRemove = str;
    }
    [current.observationList removeObjectIdenticalTo:targetToRemove];
    [[SaveData sharedAppData] save];
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)textFieldDidExit:(id)sender {
    orcamentos *current = [SaveData sharedAppData].currentOrca;
    NSString *targetToChange;
    for(NSString *str in current.observationList){
        if([str isEqualToString:_initialStr])
            targetToChange = str;
    }
    targetToChange = _observacaoOrcaTextField.text;
}

@end
