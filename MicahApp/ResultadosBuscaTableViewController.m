//
//  ResultadosBuscaTableViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/16/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

//Essa classe serve para filtrar os resultados da busca e mostrá-los em outra tableView


#import "ResultadosBuscaTableViewController.h"
#import "Produto.h"
#import "PedidoDeProduto.h"
#import "ProdutosOrcamentoTableViewController.h"
#import "ProdutosTableViewController.h"
#import "SaveData.h"
#import "ContentProductTableViewController.h"



@interface ResultadosBuscaTableViewController ()

@end

@implementation ResultadosBuscaTableViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    
//    [self.tableView reloadData];
//
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

#pragma mark - Table view data source



-(void) viewWillAppear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:@"ReloadTableView" object:nil];
    
}

-(void) reloadData:(NSNotification *)notif{
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.produtosFiltradosMArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"produtoCelula";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];

    for (UIView *subview in [cell.contentView subviews]) {
        [subview removeFromSuperview];
    }
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 150, 20)];
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:16];
    
    // Create a new Candy Object
    Produto *produto = nil;
    
    produto = self.produtosFiltradosMArray[indexPath.row];
    // mostra o nome do produto na tabela
    labelNome.text = produto.nomeProduto;
    
    [cell addSubview:labelNome];

    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
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
