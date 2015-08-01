//
//  PedidoDeProdutoViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/30/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "PedidoDeProdutoViewController.h"

@interface PedidoDeProdutoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nomeProdutoTextField;

@property (weak, nonatomic) IBOutlet UITextField *descricaoProdutoTextField;

@property (weak, nonatomic) IBOutlet UITextField *precoProdutoTextField;

@property (weak, nonatomic) IBOutlet UITextField *quantidadeProdutoTextField;

@end

@implementation PedidoDeProdutoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nomeProdutoTextField.text = self.nomeProduto;
    self.descricaoProdutoTextField.text = self.descricaoProduto;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSString *preco = [formatter stringFromNumber:self.precoProduto];
    NSString *quantidade = [formatter stringFromNumber:self.quantidadeProduto];
    self.precoProdutoTextField.text = preco;
    self.quantidadeProdutoTextField.text = quantidade;
    
    
    
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
