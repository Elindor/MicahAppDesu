//
//  HistoricoTableViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/16/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "HistoricoTableViewController.h"
#import "Cliente.h"
#import "SaveData.h"

@interface HistoricoTableViewController ()

@end

@implementation HistoricoTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    

#warning WTF, cliente class? é pra ser PDF fechado aqui!
    
    self.historicoClienteArray = @[[Cliente criaCliente:@"João" email:@"jj@jj.com" telefoneCliente:@"111111" enderecoCliente:@"j" cpf: @1111111111 ], [Cliente criaCliente:@"Ana" email:@"aa@aa.com" telefoneCliente:@"22222222" enderecoCliente:@"A" cpf: @2222222222 ] , [Cliente criaCliente:@"Bruno" email:@"bb@b.com" telefoneCliente:@"33333" enderecoCliente:@"B" cpf: @3333333333333 ] , [Cliente criaCliente:@"Karl" email:@"kk@k.com" telefoneCliente:@"4444444" enderecoCliente:@"K" cpf: @44444444444 ] , [Cliente criaCliente:@"Maria" email:@"mmm@m.com" telefoneCliente:@"555555" enderecoCliente:@"M" cpf: @5555555555555 ] , [Cliente criaCliente:@"Pedor" email:@"pp@p.com" telefoneCliente:@"" enderecoCliente:@"P" cpf: @ 66666666666666]];

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
    
    Cliente *clienteAux = [self.historicoClienteArray objectAtIndex:indexPath.row];
    
    UILabel *labelData = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 60, 20)];
    UIFont *fontData = labelData.font;
    labelData.font = [fontData fontWithSize:14];
    
    UILabel *labelCliente = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, tableView.frame.size.width - 100, 20)];
    UIFont *fontCliente = labelCliente.font;
    labelCliente.font = [fontCliente fontWithSize:14];
    
    labelCliente.text = clienteAux.nomeCliente;
    
    
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
