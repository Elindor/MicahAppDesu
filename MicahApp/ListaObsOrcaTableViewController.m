//
//  ListaObsOrcaTableViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 8/1/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ListaObsOrcaTableViewController.h"
#import "NovaObsOrcamentoViewController.h"
#import "ContentObservationTableViewController.h"

@interface ListaObsOrcaTableViewController ()

@end

@implementation ListaObsOrcaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //teste do array, precisa juntar com o "BD"
    self.observacoesOrcaNSMArray = [[NSMutableArray alloc] initWithArray: @[@"obs11", @"obs12", @"obs13", @"obs14", @"obs15", @"obs16", @"obs17", @"obs18", @"obs19", @"obs10" ]];
    
    [self.tableView reloadData];
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
    
    retornaNumeroLinhas =  [self.observacoesOrcaNSMArray count];
    
    return retornaNumeroLinhas;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"listaObsIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.tableView.frame.size.width - 40, 20)];
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    
    labelNome.text = [self.observacoesOrcaNSMArray objectAtIndex:indexPath.row];
    
    [cell addSubview:labelNome];
    
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

// Para terminar esse método é necessário saber qual destino ao se clicar em cada cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *observacaoSelecionada = [[NSString alloc] init];
    observacaoSelecionada = self.observacoesOrcaNSMArray[indexPath.row];
    
    
    ContentObservationTableViewController *telaObservacaoOrca = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentObservation"];
    
//#Pragma nao sei como irá enviar os dados pra lista de observacoes do pedido
    
    //telaObservacaoOrca.observacao = observacaoSelecionada;
    [self.navigationController pushViewController:telaObservacaoOrca animated:YES];
    
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
