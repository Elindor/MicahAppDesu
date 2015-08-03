//
//  NovoProdutoViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/17/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "NovoProdutoViewController.h"
#import "Produto.h"
#import "SaveData.h"

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
    [self performSegueWithIdentifier:@"UnwindFromNewToProductMenu" sender:self];
    
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
    
    novoProduto.nomeProduto = [NSString stringWithFormat:@"%@", self.nomeProdutoField.text];
    novoProduto.descricaoProduto = [NSString stringWithFormat:@"%@", self.descricaoProdutoField.text];
    
    //precisa definir como será feito a categoria
//    novoProduto.categoriaProduto =
    
    novoProduto.precoPadraoProduto = [NSNumber numberWithFloat:[self.precoProdutoField.text floatValue]];
    
    SaveData* save = [SaveData sharedAppData];
    [save.productList addObject:novoProduto];
    [save save];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}






- (IBAction)productNameExit:(id)sender {
}

- (IBAction)productDescriptionExit:(id)sender {
}

- (IBAction)productPriceExit:(id)sender {
}
@end
