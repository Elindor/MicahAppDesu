//
//  OrcaEmProgressoTableViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 8/1/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "OrcaEmProgressoTableViewController.h"
#import "ContentClientViewController.h"
#import "SaveData.h"
#import "orcamentos.h"
#import "PageHolderViewController.h"

@interface OrcaEmProgressoTableViewController ()

@end

@implementation OrcaEmProgressoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SaveData sharedAppData];


}

-(void)viewWillAppear:(BOOL)animated{
    [SaveData sharedAppData].currentOrca = nil;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[SaveData sharedAppData].unfinishedList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"orcaProgressoIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *labelOrca = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.tableView.frame.size.width - 50, 20)];
    UIFont *font = labelOrca.font;
    labelOrca.font = [font fontWithSize:14];
    
    SaveData *save = [SaveData sharedAppData];
    
    labelOrca.text = [[save.unfinishedList objectAtIndex:indexPath.row] costumerName];
    if(labelOrca.text.length == 0){
        labelOrca.text = @"Orçamento sem nome";
    }
    
    [cell addSubview:labelOrca];
    
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

// Para terminar esse método é necessário saber qual destino ao se clicar em cada cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SaveData *save = [SaveData sharedAppData];

    orcamentos *orcaSelecionada = save.unfinishedList[indexPath.row];
    //Espaço caso seja util limpar informação entre definições.
    
    save.currentOrca = orcaSelecionada;
    
    
    PageHolderViewController *telaCliente = [self.storyboard instantiateViewControllerWithIdentifier:@"PageHolder"];
    [self.navigationController pushViewController:telaCliente animated:YES];
    
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


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
#warning WARNING
#warning FUCKING colocar um alert view aqui, conforme combinado em reunião. Só deletar em caso de confirmação.
#warning WARNING
        
        SaveData *save = [SaveData sharedAppData];
        [save.unfinishedList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [save save];
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

@end
