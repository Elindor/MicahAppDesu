//
//  ProdutosTableViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/14/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ProdutosTableViewController.h"
#import "Produto.h"
#import "NovoProdutoViewController.h"
#import "ResultadosBuscaTableViewController.h"
#import "DetalhesProdutoViewController.h"

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
 
    //teste do array, precisa juntar com o "BD", essa parte será deletada
    self.produtoArray = @[[Produto criaProduto:@"caneta1" descricao:@"bic1" precoPadrao: @12.32],
                          [Produto criaProduto:@"borracha" descricao:@"faber" precoPadrao: @5.50],
                          [Produto criaProduto:@"caneta3" descricao:@"bic3" precoPadrao: @10.00],
                          [Produto criaProduto:@"caneta4" descricao:@"bic4" precoPadrao: @14.78],
                          [Produto criaProduto:@"caneta5" descricao:@"bic5" precoPadrao: @7.90],
                          [Produto criaProduto:@"caneta6" descricao:@"bic6" precoPadrao: @9.90],
                          [Produto criaProduto:@"caneta7" descricao:@"bic7" precoPadrao: @8.89],
                          [Produto criaProduto:@"caneta8" descricao:@"bic8" precoPadrao: @7.90],
                          [Produto criaProduto:@"caneta9" descricao:@"bic9" precoPadrao: @15.00]
                          ];

    
    
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
    
    [self.tableView reloadData];
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
        retornaNumeroLinhas =  [self.produtoArray count];
    }
    
    return retornaNumeroLinhas;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"produtoCelula";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.tableView.frame.size.width - 40, 20)];
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    
    UILabel *labelPreco = [[UILabel alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width - 60, 20, 40, 20)];
    
    UIFont *fontPreco = labelPreco.font;
    labelPreco.font = [fontPreco fontWithSize:14];
    
    Produto *produto = nil;
    
    //utiliza esse formato de cell se utilizar a busca
    if(self.searchControllerAtivado){
        produto = [self.resultadosTableViewController.produtosFiltradosArray objectAtIndex:indexPath.row];
        
    //utiliza esse formato de cell se não estiver usando a busca
    }
    else{
        produto = [self.produtoArray objectAtIndex:indexPath.row];
    }
    
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

// Para terminar esse método é necessário saber qual destino ao se clicar em cada cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    Produto *produtoSelecionado;

    if (self.searchControllerAtivado){
        
        produtoSelecionado = self.resultadosTableViewController.produtosFiltradosArray[indexPath.row];
        DetalhesProdutoViewController *telaDetalhesProduto = [self.storyboard instantiateViewControllerWithIdentifier:@"detalhesProduto"];
        telaDetalhesProduto.nomeProd = produtoSelecionado.nomeProduto;
        //telaDetalhesProduto.categoriaProd = produtoSelecionado.categoriaProduto;
        telaDetalhesProduto.descricaoProd = produtoSelecionado.descricaoProduto;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
        NSString *precoStr = [formatter stringFromNumber:produtoSelecionado.precoPadraoProduto];
        telaDetalhesProduto.precoProd = precoStr;
        
        NSLog(@"preço string search: %@", precoStr);
        
        [self.navigationController pushViewController:telaDetalhesProduto animated:YES];
        
    }
    else{
        produtoSelecionado = self.produtoArray[indexPath.row];
        DetalhesProdutoViewController *telaDetalhesProduto = [self.storyboard instantiateViewControllerWithIdentifier:@"detalhesProduto"];
        telaDetalhesProduto.nomeProd = produtoSelecionado.nomeProduto;
        //telaDetalhesProduto.categoriaProd = produtoSelecionado.categoriaProduto;
        telaDetalhesProduto.descricaoProd = produtoSelecionado.descricaoProduto;
        
          NSLog(@"preço string: %@", produtoSelecionado.precoPadraoProduto);
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
        NSString *precoStr = [formatter stringFromNumber:produtoSelecionado.precoPadraoProduto];
        telaDetalhesProduto.precoProd = precoStr;
        NSLog(@"preço string: %@", precoStr);

        
        [self.navigationController pushViewController:telaDetalhesProduto animated:YES];
        
    }
    
//    APLDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"APLDetailViewController"];
//        detailViewController.product = selectedProduct; // hand off the current product to the detail view controller
//    [self.navigationController pushViewController:detailViewController animated:YES];
    
        // note: should not be necessary but current iOS 8.0 bug (seed 4) requires it
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    // update the filtered array based on the search text
    NSString *textoBuscado = searchController.searchBar.text;
    NSMutableArray *resultadosBuscaMArray = [self.produtoArray mutableCopy];
    
    // strip out all the leading and trailing spaces
    NSString *stringFormatada = [textoBuscado stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    // break up the search terms (separated by spaces)
    NSArray *itensBuscadosArray = nil;
    if (stringFormatada.length > 0) {
        itensBuscadosArray = [stringFormatada componentsSeparatedByString:@" "];
    }
    
    // build all the "AND" expressions for each value in the searchString
    //
    NSMutableArray *andMatchPredicatesMArray = [NSMutableArray array];
    
    for (NSString *stringBuscada in itensBuscadosArray) {
        // each searchString creates an OR predicate for: name, yearIntroduced, introPrice
        //
        // example if searchItems contains "iphone 599 2007":
        //      name CONTAINS[c] "iphone"
        //      name CONTAINS[c] "599", yearIntroduced ==[c] 599, introPrice ==[c] 599
        //      name CONTAINS[c] "2007", yearIntroduced ==[c] 2007, introPrice ==[c] 2007
        //
        NSMutableArray *itensBuscadosPredicateMArray = [NSMutableArray array];
        
        // Below we use NSExpression represent expressions in our predicates.
        // NSPredicate is made up of smaller, atomic parts: two NSExpressions (a left-hand value and a right-hand value)
        
        // nome field matching
        NSExpression *lhs = [NSExpression expressionForKeyPath:@"nomeProduto"];
        NSExpression *rhs = [NSExpression expressionForConstantValue:stringBuscada];
        NSPredicate *finalPredicate = [NSComparisonPredicate
                                       predicateWithLeftExpression:lhs
                                       rightExpression:rhs
                                       modifier:NSDirectPredicateModifier
                                       type:NSContainsPredicateOperatorType
                                       options:NSCaseInsensitivePredicateOption];
        [itensBuscadosPredicateMArray addObject:finalPredicate];
        
        // descricao field matching
        lhs = [NSExpression expressionForKeyPath:@"descricaoProduto"];
        rhs = [NSExpression expressionForConstantValue:stringBuscada];
        finalPredicate = [NSComparisonPredicate
                          predicateWithLeftExpression:lhs
                          rightExpression:rhs
                          modifier:NSDirectPredicateModifier
                          type:NSEqualToPredicateOperatorType
                          options:NSCaseInsensitivePredicateOption];
        [itensBuscadosPredicateMArray addObject:finalPredicate];

        
        //categoria
//        lhs = [NSExpression expressionForKeyPath:@"categoriaProduto"];
//        rhs = [NSExpression expressionForConstantValue:stringBuscada];
//        finalPredicate = [NSComparisonPredicate
//                          predicateWithLeftExpression:lhs
//                          rightExpression:rhs
//                          modifier:NSDirectPredicateModifier
//                          type:NSEqualToPredicateOperatorType
//                          options:NSCaseInsensitivePredicateOption];
//        [itensBuscadosPredicateMArray addObject:finalPredicate];
//

        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterNoStyle];
        NSNumber *targetNumber = [numberFormatter numberFromString:stringBuscada];
        
        if(targetNumber != nil){
            lhs = [NSExpression expressionForKeyPath:@"precoPadraoProduto"];
            rhs = [NSExpression expressionForConstantValue:targetNumber];
            finalPredicate = [NSComparisonPredicate
                              predicateWithLeftExpression:lhs
                              rightExpression:rhs
                              modifier:NSDirectPredicateModifier
                              type:NSEqualToPredicateOperatorType
                              options:NSCaseInsensitivePredicateOption];
            [itensBuscadosPredicateMArray addObject:finalPredicate];
        }
    
        // at this OR predicate to our master AND predicate
        NSCompoundPredicate *orMatchPredicates = [NSCompoundPredicate orPredicateWithSubpredicates:itensBuscadosPredicateMArray];
        [andMatchPredicatesMArray addObject:orMatchPredicates];
    }
    
    // match up the fields of the Product object
    NSCompoundPredicate *finalCompoundPredicate =
    [NSCompoundPredicate andPredicateWithSubpredicates:andMatchPredicatesMArray];
    resultadosBuscaMArray = [[resultadosBuscaMArray filteredArrayUsingPredicate:finalCompoundPredicate] mutableCopy];
    
    // hand over the filtered results to our search results table
    ResultadosBuscaTableViewController *resultadosBuscatableController = (ResultadosBuscaTableViewController *)self.produtosSearchController.searchResultsController;
    resultadosBuscatableController.produtosFiltradosArray = resultadosBuscaMArray;
    [resultadosBuscatableController.tableView reloadData];
}

#pragma mark - UIStateRestoration

// we restore several items for state restoration:
//  1) Search controller's active state,
//  2) search text,
//  3) first responder

NSString *const ViewControllerTitleKey = @"ViewControllerTitleKey";
NSString *const SearchControllerIsActiveKey = @"SearchControllerIsActiveKey";
NSString *const SearchBarTextKey = @"SearchBarTextKey";
NSString *const SearchBarIsFirstResponderKey = @"SearchBarIsFirstResponderKey";

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    
    // encode the view state so it can be restored later
    
    // encode the title
    [coder encodeObject:self.title forKey:ViewControllerTitleKey];
    
    UISearchController *searchController = self.produtosSearchController;
    
    // encode the search controller's active state
    BOOL searchDisplayControllerIsActive = searchController.isActive;
    [coder encodeBool:searchDisplayControllerIsActive forKey:SearchControllerIsActiveKey];
    
    // encode the first responser status
    if (searchDisplayControllerIsActive) {
        [coder encodeBool:[searchController.searchBar isFirstResponder] forKey:SearchBarIsFirstResponderKey];
    }
    
    // encode the search bar text
    [coder encodeObject:searchController.searchBar.text forKey:SearchBarTextKey];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    
    // restore the title
    self.title = [coder decodeObjectForKey:ViewControllerTitleKey];
    
    // restore the active state:
    // we can't make the searchController active here since it's not part of the view
    // hierarchy yet, instead we do it in viewWillAppear
    //
    _searchControllerAtivado = [coder decodeBoolForKey:SearchControllerIsActiveKey];
    
    // restore the first responder status:
    // we can't make the searchController first responder here since it's not part of the view
    // hierarchy yet, instead we do it in viewWillAppear
    //
    _searchControllerFieldWasFirstResponder = [coder decodeBoolForKey:SearchBarIsFirstResponderKey];
    
    // restore the text in the search field
    self.produtosSearchController.searchBar.text = [coder decodeObjectForKey:SearchBarTextKey];
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
