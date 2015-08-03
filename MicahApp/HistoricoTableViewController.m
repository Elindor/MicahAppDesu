//
//  HistoricoTableViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/16/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "HistoricoTableViewController.h"
#import "SaveData.h"
#import "OrcamentoFinalizado.h"

@interface HistoricoTableViewController ()

@end

@implementation HistoricoTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SaveData sharedAppData];
    

    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.historicoClienteArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"historicoIdentifier" forIndexPath:indexPath];
    
    OrcamentoFinalizado *orca = [[SaveData sharedAppData].historicList objectAtIndex:indexPath.row];
    
    UILabel *labelData = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 60, 20)];
    UIFont *fontData = labelData.font;
    labelData.font = [fontData fontWithSize:14];
    
    UILabel *labelCliente = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, tableView.frame.size.width - 100, 20)];
    UIFont *fontCliente = labelCliente.font;
    labelCliente.font = [fontCliente fontWithSize:14];
    
    labelCliente.text = orca.nomeDoCliente;
    
    
//    labelData.text = self.historicoClienteArray[indexPath]; // VER DA ONDE VIRA A DATA
    

    [cell addSubview:labelData];
    [cell addSubview:labelCliente];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"historicoIdentifier"];
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
