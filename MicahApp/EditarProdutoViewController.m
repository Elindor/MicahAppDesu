//
//  EditarProdutoViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/30/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "EditarProdutoViewController.h"

@interface EditarProdutoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *descricaoTextField;
@property (weak, nonatomic) IBOutlet UITextField *precoTextField;

@end

@implementation EditarProdutoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nomeTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.descricaoTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.precoTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    self.nomeTextField.text = self.nome;
    self.descricaoTextField.text = self.descricao;
    self.precoTextField.text = self.preco;
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

@end
