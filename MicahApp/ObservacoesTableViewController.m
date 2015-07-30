//
//  ObservacoesTableViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/30/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ObservacoesTableViewController.h"
#import "BuscaObservacoesTableViewController.h"
#import "EditarObservacaoViewController.h"

@interface ObservacoesTableViewController () <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (strong, nonatomic) UISearchController *observacoesSearchController;

//tableview do resultados da busca
@property (strong, nonatomic) BuscaObservacoesTableViewController *buscaObservacoesTableViewController;

@property BOOL observacoesSearchControllerAtivado;
@property BOOL observacoesSearchControllerFieldWasFirstResponder;



@end

@implementation ObservacoesTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //teste do array, precisa juntar com o "BD"
    self.observacoesNSMArray = [[NSMutableArray alloc] initWithArray: @[@"obs11", @"obs12", @"obs13", @"obs14", @"obs15", @"obs16", @"obs17", @"obs18", @"obs19", @"obs10" ]];
    
    
    
    _buscaObservacoesTableViewController = [[BuscaObservacoesTableViewController alloc] init];
    _observacoesSearchController = [[UISearchController alloc] initWithSearchResultsController:self.buscaObservacoesTableViewController];
    self.observacoesSearchController.searchResultsUpdater = self;
    [self.observacoesSearchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.observacoesSearchController.searchBar;
    
    // we want to be the delegate for our filtered table so didSelectRowAtIndexPath is called for both tables
    self.buscaObservacoesTableViewController.tableView.delegate = self;
    self.observacoesSearchController.delegate = self;
    self.observacoesSearchController.dimsBackgroundDuringPresentation = NO; // default is YES
    self.observacoesSearchController.searchBar.delegate = self; // so we can monitor text changes + others
    
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
    if (self.observacoesSearchControllerAtivado) {
        self.observacoesSearchController.active = self.observacoesSearchControllerAtivado;
        _observacoesSearchControllerAtivado = NO;
        
        if (self.observacoesSearchControllerFieldWasFirstResponder) {
            [self.observacoesSearchController.searchBar becomeFirstResponder];
            _observacoesSearchControllerFieldWasFirstResponder = NO;
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
    
    if (self.observacoesSearchControllerAtivado){
        retornaNumeroLinhas = [self.buscaObservacoesTableViewController.observacoesFiltradosArray count];
    }
    else{
        retornaNumeroLinhas =  [self.observacoesNSMArray count];
    }
    
    return retornaNumeroLinhas;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"observacoesTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.tableView.frame.size.width - 50, 20)];
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    
    
    //utiliza esse formato de cell se utilizar a busca
    if(self.observacoesSearchControllerAtivado){
        
        labelNome.text = [self.buscaObservacoesTableViewController.observacoesFiltradosArray objectAtIndex:indexPath.row];
        
    }
    //utiliza esse formato de cell se não estiver usando a busca
    else{
        
        labelNome.text = [self.observacoesNSMArray objectAtIndex:indexPath.row];
        
    }
    
    [cell addSubview:labelNome];
    
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

// Para terminar esse método é necessário saber qual destino ao se clicar em cada cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *observacaoSelecionada = [[NSString alloc] init];
    
    if (self.observacoesSearchControllerAtivado){
        observacaoSelecionada = self.buscaObservacoesTableViewController.observacoesFiltradosArray[indexPath.row];
        
    }
    else{
        
        observacaoSelecionada = self.observacoesNSMArray[indexPath.row];
        
    }
    
    EditarObservacaoViewController *telaEditarObservacao = [self.storyboard instantiateViewControllerWithIdentifier:@"editarObservacao"];
    telaEditarObservacao.observacao = observacaoSelecionada;
    [self.navigationController pushViewController:telaEditarObservacao animated:YES];
    
    // note: should not be necessary but current iOS 8.0 bug (seed 4) requires it
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    // update the filtered array based on the search text
    NSString *textoBuscado = searchController.searchBar.text;
    NSMutableArray *resultadosBuscaMArray = [self.observacoesNSMArray mutableCopy];
    
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
        
    }
    
    // match up the fields of the Product object
    NSCompoundPredicate *finalCompoundPredicate =
    [NSCompoundPredicate andPredicateWithSubpredicates:andMatchPredicatesMArray];
    resultadosBuscaMArray = [[resultadosBuscaMArray filteredArrayUsingPredicate:finalCompoundPredicate] mutableCopy];
    
    // hand over the filtered results to our search results table
    BuscaObservacoesTableViewController *buscaObservacoesTableController = (BuscaObservacoesTableViewController *)self.observacoesSearchController.searchResultsController;
    buscaObservacoesTableController.observacoesFiltradosArray = resultadosBuscaMArray;
    [buscaObservacoesTableController.tableView reloadData];
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
