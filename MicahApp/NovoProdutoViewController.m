//
//  NovoProdutoViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/17/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "NovoProdutoViewController.h"
#import "Produto.h"

@interface NovoProdutoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nomeProdutoField;

@property (weak, nonatomic) IBOutlet UITextField *descricaoProdutoField;

@property (weak, nonatomic) IBOutlet UITextField *precoProdutoField;

@property (weak, nonatomic) IBOutlet UISwitch *SwitchOn;

@end

@implementation NovoProdutoViewController

//só chama o método para criar o novo produto e que depois será gravado
- (IBAction)salvarButton:(id)sender{
    [self cadastrarProduto];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cadastrarProduto{
    
    Produto *novoProduto = [[Produto alloc]init];
    
    novoProduto.nomeProduto = self.nomeProdutoField.text;
    novoProduto.descricaoProduto = self.descricaoProdutoField.text;
    
    //precisa definir como será feito a categoria
//    novoProduto.categoriaProduto =
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *preco = [formatter numberFromString:self.precoProdutoField.text];
    novoProduto.precoPadraoProduto = preco;
    
    [self gravaProduto: novoProduto];
    
}

//Aqui é onde fica o método que irá gravar os dados permanentemente
- (void) gravaProduto: (Produto*) produto{
    
    
}




@end
