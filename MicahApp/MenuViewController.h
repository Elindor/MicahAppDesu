//
//  ViewController.h
//  Orca
//
//  Created by Thiago Borges Gonçalves Penna on 7/27/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnOrcamento;
@property (weak, nonatomic) IBOutlet UIButton *btnHistorico;
@property (weak, nonatomic) IBOutlet UIButton *btnProdutos;
@property (weak, nonatomic) IBOutlet UIButton *btnPerfil;
@property (weak, nonatomic) IBOutlet UIButton *btnNovo;
@property (weak, nonatomic) IBOutlet UIButton *btnEmProgresso;
@property (weak, nonatomic) IBOutlet UIButton *btnObservacoes;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cnstOrcamentoTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cnstHistoricoHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cnstOrcamentoHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cnstProdutosHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cnstObservacoesHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cnstPerfilHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cnstNovoEmProgresso;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cnstNovoEmProgressoHeight;

@property (nonatomic) CGFloat newCnstOrcamentoTop;
@property (nonatomic) CGFloat newCnstHistoricoHeight;
@property (nonatomic) CGFloat newCnstOrcamentoHeight;
@property (nonatomic) CGFloat newCnstProdutosHeight;
@property (nonatomic) CGFloat newCnstObservacoesHeight;
@property (nonatomic) CGFloat newCnstPerfilHeight;
@property (nonatomic) CGFloat newCnstNovoEmProgresso;
@property (nonatomic) CGFloat newCnstNovoEmProgressoHeight;

@property (nonatomic) UIButton *touchedButton;

- (IBAction)didTouchOrcamento:(id)sender;
- (IBAction)didTouchHistorico:(id)sender;

- (void)setButtonStageToShow:(int)stage;

@end

