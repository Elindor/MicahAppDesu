//
//  ProdutosTableViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/14/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ProdutosTableViewController.h"
#import "Produto.h"
#import "ResultadosBuscaTableViewController.h"

@interface ProdutosTableViewController () <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>


@property (strong, nonatomic) UISearchController *produtosSearchController;

//tableview do resultados da busca
@property (strong, nonatomic) ResultadosBuscaTableViewController *resultadosTableViewController;

@property BOOL searchControllerAtivado;
@property BOOL searchControllerFieldWasFirstResponder;

@end

@implementation ProdutosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _resultadosTableViewController = [[ResultadosBuscaTableViewController alloc] init];
    _produtosSearchController = [[UISearchController alloc] initWithSearchResultsController:self.resultadosTableViewController];
    self.produtosSearchController.searchResultsUpdater = self;
    [self.produtosSearchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.produtosSearchController.searchBar;
    
    // we want to be the delegate for our filtered table so didSelectRowAtIndexPath is called for both tables
    self.resultadosTableViewController.tableView.delegate = self;
    self.produtosSearchController.delegate = self;
    self.produtosSearchController.dimsBackgroundDuringPresentation = NO; // default is YES
    self.produtosSearchController.searchBar.delegate = self; // so we can monitor text changes + others
    
    // Search is now just presenting a view controller. As such, normal view controller
    // presentation semantics apply. Namely that presentation will walk up the view controller
    // hierarchy until it finds the root view controller or one that defines a presentation context.
    //
    self.definesPresentationContext = YES;  // know where you want UISearchController to be displayed
    
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // restore the searchController's active state
    if (self.searchControllerAtivado) {
        self.produtosSearchController.active = self.searchControllerAtivado;
        _searchControllerAtivado = NO;
        
        if (self.searchControllerFieldWasFirstResponder) {
            [self.produtosSearchController.searchBar becomeFirstResponder];
            _searchControllerFieldWasFirstResponder = NO;
        }
    }
}


#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSInteger retornaNumeroLinhas = 0;
    
    if (self.searchControllerAtivado){
        retornaNumeroLinhas = [self.resultadosTableViewController.produtosFiltradosArray count];
    }
    else{
        retornaNumeroLinhas =  [self.produtoArray count] + 2;
    }
    
    return retornaNumeroLinhas;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 150, 20)];
    
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    
    //utiliza esse formato de cell se utilizar a busca
    if(self.searchControllerAtivado){
        Produto *produto = nil;
        produto = [self.resultadosTableViewController.produtosFiltradosArray objectAtIndex:indexPath.row];
        labelNome.text = produto.nomeProduto;
        cellIdentifier = @"produtoCelula";
        
    //utiliza esse formato de cell se não estiver usando a busca
    }else{
        switch(indexPath.row)
        {
            case 0:
            {
                labelNome.text = @"Novo produto temporário";
                cellIdentifier = @"novoProdIdentifier";
                break;
            }
    
            case 1:
            {
                labelNome.text = @"Salvar novo produto";
                    cellIdentifier = @"salvarProdIdentifier";
                break;
        }
    
        default:
        {
        
            // Create a new Candy Object
            Produto *produto = nil;
            produto = [self.produtoArray objectAtIndex:indexPath.row - 2];
    
            // Configure the cell
            labelNome.text = produto.nomeProduto;
            cellIdentifier = @"produtoCelula";
            break;
            
            
        }
    }
    
    [cell addSubview:labelNome];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }


    return cell;
}
    
    
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    APLProduct *selectedProduct = (tableView == self.tableView) ?
    self.products[indexPath.row] : self.resultsTableController.filteredProducts[indexPath.row];
    
    APLDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"APLDetailViewController"];
        detailViewController.product = selectedProduct; // hand off the current product to the detail view controller
    [self.navigationController pushViewController:detailViewController animated:YES];
        
        // note: should not be necessary but current iOS 8.0 bug (seed 4) requires it
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

    
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
