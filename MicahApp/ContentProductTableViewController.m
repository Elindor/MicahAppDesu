//
//  ContentProductTableViewController.m
//  MicahApp
//
//  Created by Gabriel Nopper on 29/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ContentProductTableViewController.h"
#import "Produto.h"
#import "PedidoDeProdutoViewController.h"

@interface ContentProductTableViewController ()

@end

@implementation ContentProductTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.produtosListaNSMArray = [[NSMutableArray alloc] initWithArray: @[[Produto criaProduto:@"caneta1" descricao:@"bic1" precoPadrao: @12.32],
                                   [Produto criaProduto:@"borracha" descricao:@"faber" precoPadrao: @5.50],
                                   [Produto criaProduto:@"caneta3" descricao:@"bic3" precoPadrao: @10.00],
                                   [Produto criaProduto:@"caneta4" descricao:@"bic4" precoPadrao: @14.78],
                                   [Produto criaProduto:@"caneta5" descricao:@"bic5" precoPadrao: @7.90],
                                   [Produto criaProduto:@"caneta6" descricao:@"bic6" precoPadrao: @9.90],
                                   [Produto criaProduto:@"caneta7" descricao:@"bic7" precoPadrao: @8.89],
                                   [Produto criaProduto:@"caneta8" descricao:@"bic8" precoPadrao: @7.90],
                                   [Produto criaProduto:@"caneta9" descricao:@"bic9" precoPadrao: @15.00]
                                   ]];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.produtosListaNSMArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"prodListaIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.tableView.frame.size.width - 50, 20)];
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    
    UILabel *labelPreco = [[UILabel alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width - 60, 20, 40, 20)];
    
    UIFont *fontPreco = labelPreco.font;
    labelPreco.font = [fontPreco fontWithSize:14];
    
    
    Produto *produto = nil;
        
    produto = [self.produtosListaNSMArray objectAtIndex:indexPath.row];
    
    labelNome.text = produto.nomeProduto;
    NSString *stringPreco = [produto.precoPadraoProduto stringValue]; // transforma o NSNumber em string
    labelPreco.text = stringPreco;
    
    [cell addSubview:labelNome];
    [cell addSubview:labelPreco];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Produto *produtoSelecionado;
    produtoSelecionado = self.produtosListaNSMArray[indexPath.row];
    PedidoDeProdutoViewController *telaPedidoDeProduto = [self.storyboard instantiateViewControllerWithIdentifier:@"telaPedidoDeProduto"];
    telaPedidoDeProduto.nomeProduto = produtoSelecionado.nomeProduto;
    telaPedidoDeProduto.descricaoProduto = produtoSelecionado.descricaoProduto;
    telaPedidoDeProduto.precoProduto = [produtoSelecionado.precoPadraoProduto stringValue];

    [self.navigationController pushViewController:telaPedidoDeProduto animated:YES];
    
    // note: should not be necessary but current iOS 8.0 bug (seed 4) requires it
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
