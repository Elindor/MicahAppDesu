//
//  ProdutosOrcamentoTableViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/20/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ProdutosOrcamentoTableViewController.h"
#import "ResultadosBuscaTableViewController.h"
#import "Produto.h"
#import "NovoProdutoViewController.h"
#import "ContentProductTableViewController.h"
#import "PedidoDeProduto.h"
#import "SaveData.h"

@interface ProdutosOrcamentoTableViewController () <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (strong, nonatomic) UISearchController *produtosOrcamentoSearchController;

//tableview do resultados da busca
@property (strong, nonatomic) ResultadosBuscaTableViewController *resultadosOrcamentoTableViewController;

@property BOOL orcamentoSearchControllerAtivado;
@property BOOL orcamentoSearchControllerFieldWasFirstResponder;


@end

@implementation ProdutosOrcamentoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SaveData sharedAppData];
    
    
    
    _resultadosOrcamentoTableViewController = [[ResultadosBuscaTableViewController alloc] init];
    _produtosOrcamentoSearchController = [[UISearchController alloc] initWithSearchResultsController:self.resultadosOrcamentoTableViewController];
    self.produtosOrcamentoSearchController.searchResultsUpdater = self;
    [self.produtosOrcamentoSearchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.produtosOrcamentoSearchController.searchBar;
    
    // we want to be the delegate for our filtered table so didSelectRowAtIndexPath is called for both tables
    self.resultadosOrcamentoTableViewController.tableView.delegate = self;
    self.produtosOrcamentoSearchController.delegate = self;
    self.produtosOrcamentoSearchController.dimsBackgroundDuringPresentation = NO; // default is YES
    self.produtosOrcamentoSearchController.searchBar.delegate = self; // so we can monitor text changes + others
    
    // Search is now just presenting a view controller. As such, normal view controller
    // presentation semantics apply. Namely that presentation will walk up the view controller
    // hierarchy until it finds the root view controller or one that defines a presentation context.
    //
    self.definesPresentationContext = YES;  // know where you want UISearchController to be displayed
    
    //[self.tableView reloadData];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // restore the searchController's active state
    if (self.orcamentoSearchControllerAtivado) {
        self.produtosOrcamentoSearchController.active = self.orcamentoSearchControllerAtivado;
        _orcamentoSearchControllerAtivado = NO;
        
        if (self.orcamentoSearchControllerFieldWasFirstResponder) {
            [self.produtosOrcamentoSearchController.searchBar becomeFirstResponder];
            _orcamentoSearchControllerFieldWasFirstResponder = NO;
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
    
//    if (self.orcamentoSearchControllerAtivado){
//        retornaNumeroLinhas = [self.resultadosOrcamentoTableViewController.produtosFiltradosArray count];
//    }
//    else{
        retornaNumeroLinhas =  [[SaveData sharedAppData].productList count];
//    }
    
    return retornaNumeroLinhas;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"prodOrcIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.tableView.frame.size.width - 50, 20)];
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    
    UILabel *labelPreco = [[UILabel alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width - 60, 20, 40, 20)];
    
    UIFont *fontPreco = labelPreco.font;
    labelPreco.font = [fontPreco fontWithSize:14];

    
    Produto *produto = nil;
    
    //utiliza esse formato de cell se utilizar a busca
//    if(self.orcamentoSearchControllerAtivado){
//       
//        produto = [self.resultadosOrcamentoTableViewController.produtosFiltradosArray objectAtIndex:indexPath.row];
//        
//    }
//    //utiliza esse formato de cell se não estiver usando a busca
//    else{
// 
        produto = [[SaveData sharedAppData].productList objectAtIndex:indexPath.row];
        
//    }
    
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
    PedidoDeProduto *novoPedido = [[PedidoDeProduto alloc]init];
    
    if (self.orcamentoSearchControllerAtivado){
        produtoSelecionado = self.resultadosOrcamentoTableViewController.produtosFiltradosMArray[indexPath.row];
        
        
    }
    else{
        
        produtoSelecionado = [SaveData sharedAppData].productList[indexPath.row];

    }
    
    SaveData *save = [SaveData sharedAppData];

    novoPedido.nomeProduto = produtoSelecionado.nomeProduto;
    novoPedido.descricaoProduto = produtoSelecionado.descricaoProduto;
    novoPedido.precoProduto = produtoSelecionado.precoPadraoProduto;
    novoPedido.quantidadeProduto = [NSNumber numberWithFloat:1.0];
    
    orcamentos *current = save.currentOrca;
    [current.productList addObject:novoPedido];
    [save save];
    ContentProductTableViewController *telaProdOrcamento = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentProduct"];
    telaProdOrcamento.pedidoNovo = novoPedido;
    
    
    
    [self.navigationController popViewControllerAnimated:YES];

    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    // update the filtered array based on the search text
    NSString *textoBuscado = searchController.searchBar.text;
    NSMutableArray *resultadosBuscaMArray = [[SaveData sharedAppData].productList mutableCopy];
    
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
//        
//        // descricao field matching
//        lhs = [NSExpression expressionForKeyPath:@"descricaoProduto"];
//        rhs = [NSExpression expressionForConstantValue:stringBuscada];
//        finalPredicate = [NSComparisonPredicate
//                          predicateWithLeftExpression:lhs
//                          rightExpression:rhs
//                          modifier:NSDirectPredicateModifier
//                          type:NSEqualToPredicateOperatorType
//                          options:NSCaseInsensitivePredicateOption];
//        [itensBuscadosPredicateMArray addObject:finalPredicate];
//        
        
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
    ResultadosBuscaTableViewController *resultadosBuscatableController = (ResultadosBuscaTableViewController *)self.produtosOrcamentoSearchController.searchResultsController;
    resultadosBuscatableController.produtosFiltradosMArray = resultadosBuscaMArray;
    [resultadosBuscatableController.tableView reloadData];
}

#pragma mark - UIStateRestoration

// we restore several items for state restoration:
//  1) Search controller's active state,
//  2) search text,
//  3) first responder

NSString *const OrcamentoViewControllerTitleKey = @"ViewControllerTitleKey";
NSString *const OrcamentoSearchControllerIsActiveKey = @"SearchControllerIsActiveKey";
NSString *const OrcamentoSearchBarTextKey = @"SearchBarTextKey";
NSString *const OrcamentoSearchBarIsFirstResponderKey = @"SearchBarIsFirstResponderKey";

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    
    // encode the view state so it can be restored later
    
    // encode the title
    [coder encodeObject:self.title forKey:OrcamentoViewControllerTitleKey];
    
    UISearchController *searchController = self.produtosOrcamentoSearchController;
    
    // encode the search controller's active state
    BOOL searchDisplayControllerIsActive = searchController.isActive;
    [coder encodeBool:searchDisplayControllerIsActive forKey:OrcamentoSearchControllerIsActiveKey];
    
    // encode the first responser status
    if (searchDisplayControllerIsActive) {
        [coder encodeBool:[searchController.searchBar isFirstResponder] forKey:OrcamentoSearchBarIsFirstResponderKey];
    }
    
    // encode the search bar text
    [coder encodeObject:searchController.searchBar.text forKey:OrcamentoSearchBarTextKey];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    
    // restore the title
    self.title = [coder decodeObjectForKey:OrcamentoViewControllerTitleKey];
    
    // restore the active state:
    // we can't make the searchController active here since it's not part of the view
    // hierarchy yet, instead we do it in viewWillAppear
    //
    _orcamentoSearchControllerAtivado = [coder decodeBoolForKey:OrcamentoSearchControllerIsActiveKey];
    
    // restore the first responder status:
    // we can't make the searchController first responder here since it's not part of the view
    // hierarchy yet, instead we do it in viewWillAppear
    //
    _orcamentoSearchControllerFieldWasFirstResponder = [coder decodeBoolForKey:OrcamentoSearchBarIsFirstResponderKey];
    
    // restore the text in the search field
    self.produtosOrcamentoSearchController.searchBar.text = [coder decodeObjectForKey:OrcamentoSearchBarTextKey];
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
