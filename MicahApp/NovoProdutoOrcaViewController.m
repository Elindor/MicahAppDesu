//
//  NovoProdutoOrcaViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 8/7/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "NovoProdutoOrcaViewController.h"
#import "Produto.h"
#import "PedidoDeProduto.h"
#import "SaveData.h"

@interface NovoProdutoOrcaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nomeProdOrcaField;

@property (weak, nonatomic) IBOutlet UITextField *descricaoProdOrcaField;

@property (weak, nonatomic) IBOutlet UITextField *precoProdOrcaField;

@property (weak, nonatomic) IBOutlet UISwitch *switchOnOrca;



@end

@implementation NovoProdutoOrcaViewController

- (IBAction)okButton:(id)sender{
    
    
    [self cadastrarProduto];
    
    [self performSegueWithIdentifier:@"UnwindFromNewToProductMenu" sender:self];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationButtonImageRight];
    
    self.nomeProdOrcaField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.descricaoProdOrcaField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.precoProdOrcaField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    self.nomeProdOrcaField.layer.borderWidth = 1.0f;
    self.descricaoProdOrcaField.layer.borderWidth = 1.0f;
    self.precoProdOrcaField.layer.borderWidth = 1.0f;
    
    [self setPlaceHolderPosition:self.nomeProdOrcaField];
    [self setPlaceHolderPosition:self.descricaoProdOrcaField];
    [self setPlaceHolderPosition:self.precoProdOrcaField];
    
    //botão direito
    UIImage *buttonImage = [[UIImage imageNamed:@"IconeOk.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.rightBarButtonItem.image = buttonImage; //[UIImage imageNamed:@"IconeMais.png"];
    self.navigationItem.rightBarButtonItem.title = @"";
    
    
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
    
    PedidoDeProduto *novoProduto = [[PedidoDeProduto alloc]init];
    
    novoProduto.nomeProduto = [NSString stringWithFormat:@"%@", self.nomeProdOrcaField.text];
    novoProduto.descricaoProduto = [NSString stringWithFormat:@"%@", self.descricaoProdOrcaField.text];
    novoProduto.precoProduto = [NSNumber numberWithDouble:[self.precoProdOrcaField.text doubleValue]];
    novoProduto.precoAlterado = novoProduto.precoProduto;
    //precisa definir como será feito a categoria
    //    novoProduto.categoriaProduto =
    
    SaveData* save = [SaveData sharedAppData];
    [save.currentOrca.productList addObject:novoProduto];
    [save save];
    
    
    if(_switchOnOrca.on){
        Produto *novoProd = [[Produto alloc]init];
        
        novoProd.nomeProduto = [NSString stringWithFormat:@"%@", self.nomeProdOrcaField.text];
        novoProd.descricaoProduto = [NSString stringWithFormat:@"%@", self.descricaoProdOrcaField.text];
        
        //precisa definir como será feito a categoria
        //    novoProduto.categoriaProduto =
        
        novoProd.precoPadraoProduto = [NSNumber numberWithFloat:[self.precoProdOrcaField.text floatValue]];
        
        SaveData* save = [SaveData sharedAppData];
        [save.productList addObject:novoProd];
        [save save];
    }
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
