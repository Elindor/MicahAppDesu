//
//  ObservacoesTableViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/30/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ObservacoesTableViewController.h"
#import "EditarObservacaoViewController.h"
#import "SaveData.h"

@interface ObservacoesTableViewController ()

@end

@implementation ObservacoesTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"IconeMais.png"];
//    self.navigationItem.rightBarButtonItem.title = @"";
//    self.navigationItem.rightBarButtonItem.];
    [SaveData sharedAppData];
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
    
    SaveData* save = [SaveData sharedAppData];
     NSInteger retornaNumeroLinhas =  [save.observationList count];
    
    return retornaNumeroLinhas;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"observacoesTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    for (UIView *subview in [cell.contentView subviews]) {
        [subview removeFromSuperview];
    }
    
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.tableView.frame.size.width - 50, 20)];
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    SaveData* save = [SaveData sharedAppData];

    labelNome.text = [save.observationList objectAtIndex:indexPath.row];
    
    [cell addSubview:labelNome];
    
    
    return cell;
}

// Para terminar esse método é necessário saber qual destino ao se clicar em cada cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SaveData* save = [SaveData sharedAppData];

    NSString *observacaoSelecionada = save.observationList[indexPath.row];
    
    
    EditarObservacaoViewController *telaEditarObservacao = [self.storyboard instantiateViewControllerWithIdentifier:@"editarObservacao"];
    telaEditarObservacao.observacao = observacaoSelecionada;
    [self.navigationController pushViewController:telaEditarObservacao animated:YES];
    
    // note: should not be necessary but current iOS 8.0 bug (seed 4) requires it
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}




 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
     
 // Delete the row from the data source
     SaveData* save = [SaveData sharedAppData];
     [save.observationList removeObjectAtIndex:indexPath.row];
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     [self.tableView reloadData];
     
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }


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

- (IBAction)unwindToMenuObservationViewController:(UIStoryboardSegue *)unwindSegue
{
    [self.tableView reloadData];

}

@end
