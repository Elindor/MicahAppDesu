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
    
    [self setNavigationButtonImageRight];
    
    self.nomeProdutoField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.descricaoProdutoField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.precoProdutoField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    self.nomeProdutoField.layer.borderWidth = 1.0f;
    self.descricaoProdutoField.layer.borderWidth = 1.0f;
    self.precoProdutoField.layer.borderWidth = 1.0f;

    [self setPlaceHolderPosition:self.nomeProdutoField];
    [self setPlaceHolderPosition:self.descricaoProdutoField];
    [self setPlaceHolderPosition:self.precoProdutoField];
    
    _nomeProdutoField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    _descricaoProdutoField.autocapitalizationType = UITextAutocapitalizationTypeSentences;

    
}

-(void)setNavigationButtonImageRight{
    
    //botão esquerdo
    UIImage *menuImage = [[UIImage imageNamed:@"IconeOk.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.rightBarButtonItem.image = menuImage; //[UIImage imageNamed:@"IconeMais.png"];
    self.navigationItem.rightBarButtonItem.title = @"";
}

-(void)setPlaceHolderPosition: (UITextField *) textField{
    
    UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [textField setLeftViewMode:UITextFieldViewModeAlways];
    [textField setLeftView:spacerView];
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
