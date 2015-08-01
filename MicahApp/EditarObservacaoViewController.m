//
//  EditarObservacaoViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/30/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "EditarObservacaoViewController.h"

@interface EditarObservacaoViewController ()



@property (weak, nonatomic) IBOutlet UITextField *observacaoTextField;

@end

@implementation EditarObservacaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.observacaoTextField.text = self.observacao;
    // Do any additional setup after loading the view.
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

- (IBAction)excluirButton:(UIButton *)sender {
}
@end
