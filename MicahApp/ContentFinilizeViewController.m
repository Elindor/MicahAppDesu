//
//  ContentFinilizeViewController.m
//  MicahApp
//
//  Created by Gabriel Nopper on 29/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ContentFinilizeViewController.h"

@interface ContentFinilizeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ContentFinilizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.textLabel setFrame:CGRectMake(20, 30, [UIScreen mainScreen].bounds.size.height - 60,[UIScreen mainScreen].bounds.size.width - 40)];
    
    //UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.origin.x + 20, [UIScreen mainScreen].bounds.origin.y + 30, [UIScreen mainScreen].bounds.size.width - 40, [UIScreen mainScreen].bounds.size.height - 60)];
    [self.textLabel setText: @"Após finalizar, um pdf será gerado e não será possível editá-lo. Caso ainda necessite editar seu orçamento, o mesmo estará disponível em Orçamentos em Progresso para ser finalizado em outro momento. Sugerimos acrescentar a validade do orçamento nas observações e enviar uma cópia do arquivo final para seu e-mail."
     ];
    
    self.textLabel.numberOfLines = 0;
    [self.textLabel sizeToFit];
    self.textLabel.translatesAutoresizingMaskIntoConstraints = 0;
    UIFont *font = self.textLabel.font;
    self.textLabel.font = [font fontWithSize:16];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
