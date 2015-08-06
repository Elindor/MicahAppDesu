//
//  PedidoDeProdutoViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/30/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "PedidoDeProdutoViewController.h"
#import "SaveData.h"
#import "orcamentos.h"
#import "Produto.h"
#import "PedidoDeProduto.h"

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
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
//    NSString *preco = [formatter stringFromNumber:self.precoProduto];
//    NSString *quantidade = [formatter stringFromNumber:self.quantidadeProduto];
    self.precoProdutoTextField.text = [self.precoProduto stringValue];
    self.quantidadeProdutoTextField.text = [self.quantidadeProduto stringValue];
    
    self.nomeProdutoTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.descricaoProdutoTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.precoProdutoTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.quantidadeProdutoTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];

    self.nomeProdutoTextField.layer.borderWidth = 1.0f;
    self.descricaoProdutoTextField.layer.borderWidth = 1.0f;
    self.precoProdutoTextField.layer.borderWidth = 1.0f;
    self.quantidadeProdutoTextField.layer.borderWidth = 1.0f;
    
    //self.nomeProdutoTextField.attributedPlaceholder
    
    
    
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

- (IBAction)excluirProdButton:(UIButton *)sender {
    orcamentos *current = [SaveData sharedAppData].currentOrca;
    PedidoDeProduto *targetToRemove;
    for(PedidoDeProduto *prod in current.productList){
        if([prod.nomeProduto isEqualToString:_nomeProdutoTextField.text])
            targetToRemove = prod;
    }
    [current.productList removeObjectIdenticalTo:targetToRemove];
    [[SaveData sharedAppData] save];
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)buttonDidSave:(id)sender {
    orcamentos *current = [SaveData sharedAppData].currentOrca;
    PedidoDeProduto *targetToChange;
    for(PedidoDeProduto *prod in current.productList){
        if([prod.nomeProduto isEqualToString:_nomeProdutoTextField.text])
            targetToChange = prod;
    }

    PedidoDeProduto *new = [[PedidoDeProduto alloc] init];
    new.nomeProduto = _nomeProdutoTextField.text;
    new.descricaoProduto = _descricaoProdutoTextField.text;
    new.precoAlterado = [NSNumber numberWithFloat:[ _precoProdutoTextField.text floatValue]];
    new.quantidadeProduto  = [NSNumber numberWithFloat:[ _quantidadeProdutoTextField.text floatValue]];
    
    [current.productList removeObjectIdenticalTo:targetToChange];
    [current.productList addObject:new];

    
    [[SaveData sharedAppData] save];
    [self.navigationController popViewControllerAnimated:YES];

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
