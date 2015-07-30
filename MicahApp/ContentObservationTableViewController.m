//
//  ContentObservationTableViewController.m
//  MicahApp
//
//  Created by Gabriel Nopper on 29/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ContentObservationTableViewController.h"

@interface ContentObservationTableViewController ()

@end

@implementation ContentObservationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //teste do array, precisa juntar com o "BD"
    self.observacoesOrcamentoArray = [[NSMutableArray alloc] initWithArray:@[@"teste1", @"teste2", @"teste3", @"teste4", @"teste5", @"teste6"]] ;
    
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger retornaNumeroLinhas = 0;
    
    retornaNumeroLinhas =  [self.observacoesOrcamentoArray count] + 1;
    
    return retornaNumeroLinhas;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.tableView.frame.size.width - 40, 20)];
    
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    
    
    switch(indexPath.row)
    {
        case 0:
        {
            labelNome.text = @"Adicionar Observação";
            cellIdentifier = @"novoObsIdentifier";
            break;
        }
            
        default:
        {
            
            // Create a new Candy Object
            NSString *observacao = nil;
            observacao = [self.observacoesOrcamentoArray objectAtIndex:indexPath.row - 1];
            
            // Configure the cell
            labelNome.text = observacao;
            cellIdentifier = @"observacaoCelula";
            break;
        }
            
    }
    
    [cell addSubview:labelNome];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

// Para terminar esse método é necessário saber qual destino ao se clicar em cada cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *observacaoSelecionado;
    
    switch(indexPath.row)
    {
        case 0:
        {
            //            NovoProdutoViewController *telaNovoProduto = [self.storyboard instantiateViewControllerWithIdentifier:@"novoProduto"];
            //            [self.navigationController pushViewController:telaNovoProduto animated:YES];
            break;
        }
            
        default:
        {
            observacaoSelecionado = self.observacoesOrcamentoArray[indexPath.row - 1];
            //                  DetalhesProdutoViewController *telaDetalhesProduto = [self.storyboard instantiateViewControllerWithIdentifier:@"detalhesProduto"];
            //                telaDetalhesProduto.nomeProd = produtoSelecionado.nomeProduto;
            //                telaDetalhesProduto.categoriaProd = produtoSelecionado.categoriaProduto;
            //                telaDetalhesProduto.descricaoProd = produtoSelecionado.descricaoProduto;
            //
            //                NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
            //                NSString *precoStr = [formatter stringFromNumber:produtoSelecionado.precoPadraoProduto];
            //                telaDetalhesProduto.precoProd = precoStr;
            //
            //                [self.navigationController pushViewController:telaDetalhesProduto animated:YES];
            break;
        }
            
    }
    
    //    APLDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"APLDetailViewController"];
    //        detailViewController.product = selectedProduct; // hand off the current product to the detail view controller
    //    [self.navigationController pushViewController:detailViewController animated:YES];
    
    // note: should not be necessary but current iOS 8.0 bug (seed 4) requires it
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [self.observacoesOrcamentoArray removeObjectAtIndex: indexPath.row - 1];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [tableView reloadData];
//    }
//    
//}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



@end
