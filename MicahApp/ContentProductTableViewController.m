//
//  ContentProductTableViewController.m
//  MicahApp
//
//  Created by Gabriel Nopper on 29/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "ContentProductTableViewController.h"
#import "PedidoDeProdutoViewController.h"
#import "PedidoDeProduto.h"
#import "SaveData.h"

@interface ContentProductTableViewController ()

@property  float totalPedido;

@end

@implementation ContentProductTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0); // Altura correta
    
    //esse if permite que adicione na lista de produtos o produto selecionado na busca da lista
    if(self.pedidoNovo != nil){
        [self.produtosListaNSMArray addObject:self.pedidoNovo];
    }
    
    //permite ficar somente a seta de voltar no navigationButton
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"   "  style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    [SaveData sharedAppData];
    
    [self.tableView reloadData];
}

-(void) viewWillAppear:(BOOL)animated{
//    for(UITableViewCell *temp in [self.tableView visibleCells]){
//        for (UIView *view in [temp.contentView subviews]){
//            [view removeFromSuperview];
//        }
//    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:@"ReloadTableView" object:nil];
    NSRange range = NSMakeRange(0, [self numberOfSectionsInTableView:self.tableView]);
    NSIndexSet *section = [NSIndexSet indexSetWithIndexesInRange:range];
    [self.tableView reloadSections:section withRowAnimation:UITableViewRowAnimationNone];
    
}

-(void) reloadData:(NSNotification *)notif{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[SaveData sharedAppData].currentOrca.productList count] + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"prodListaIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    //esse for permite limpar as cells antes de reutilizá-las
    for (UIView *subview in [cell.contentView subviews]) {
        [subview removeFromSuperview];
    }
    
    if(cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    
    UILabel *labelPreco = [[UILabel alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width - 100, 20, 90, 20)];
    
    UIFont *fontPreco = labelPreco.font;
    labelPreco.font = [fontPreco fontWithSize:16];
    labelPreco.textAlignment = NSTextAlignmentRight;
    
    UILabel *labelQuantidade = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 40, 20)];
    UIFont *fontQuantidade = labelQuantidade.font;
    labelQuantidade.font = [fontQuantidade fontWithSize:16];
    
    UILabel *labelNome;
    
    //configura as cells caso seja a última coloca como o total
    if (indexPath.row == ([[SaveData sharedAppData].currentOrca.productList count])){

        labelNome = [[UILabel alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width/2, 20, self.tableView.frame.size.width - 50, 20)];
        UIFont *font = labelNome.font;
        labelNome.font = [font fontWithSize:16];
        labelNome.text = @"Total: ";
        
        NSString *stringPreco = [NSString stringWithFormat:@"%.2f", self.totalPedido]; // transforma o NSNumber em string
        labelPreco.text = stringPreco;
        [SaveData sharedAppData].currentOrca.finalValue = [NSNumber numberWithFloat: self.totalPedido];
        self.totalPedido = 0;

    }

    else{

        labelNome = [[UILabel alloc] initWithFrame:CGRectMake(70, 20, self.tableView.frame.size.width - 140, 20)];
        UIFont *font = labelNome.font;
        labelNome.font = [font fontWithSize:16];
        
        self.pedidoNovo = [[SaveData sharedAppData].currentOrca.productList objectAtIndex:indexPath.row];
    
        labelNome.text = self.pedidoNovo.nomeProduto;
        self.totalPedido = ([self.pedidoNovo.precoProduto floatValue] * [self.pedidoNovo.quantidadeProduto floatValue])+ self.totalPedido;
        NSString *stringPreco = [self.pedidoNovo.precoProduto stringValue]; // transforma o NSNumber em string
        if(self.pedidoNovo.precoAlterado)
            stringPreco = [self.pedidoNovo.precoAlterado stringValue];
        labelPreco.text = stringPreco;
        labelQuantidade.text = [self.pedidoNovo.quantidadeProduto stringValue];
        [cell addSubview:labelQuantidade];
    
    }
    [cell addSubview:labelNome];
    [cell addSubview:labelPreco];
    
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //esse if permite que não ocorra nada se selecionar a última cell que é o total
    if (indexPath.row == ([[SaveData sharedAppData].currentOrca.productList count])){
        NSLog(@"Nope, wrong button");
    }

    else{
    
        PedidoDeProduto *produtoSelecionado;
        produtoSelecionado = [SaveData sharedAppData].currentOrca.productList[indexPath.row];
        PedidoDeProdutoViewController *telaPedidoDeProduto = [self.storyboard instantiateViewControllerWithIdentifier:@"telaPedidoDeProduto"];
        telaPedidoDeProduto.nomeProduto = produtoSelecionado.nomeProduto;
        telaPedidoDeProduto.descricaoProduto = produtoSelecionado.descricaoProduto;
        telaPedidoDeProduto.precoProduto = produtoSelecionado.precoProduto;
        if(produtoSelecionado.precoAlterado)
            telaPedidoDeProduto.precoProduto = produtoSelecionado.precoAlterado;
        
        telaPedidoDeProduto.quantidadeProduto = produtoSelecionado.quantidadeProduto;

        [self.navigationController pushViewController:telaPedidoDeProduto animated:YES];
    }
    // note: should not be necessary but current iOS 8.0 bug (seed 4) requires it
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

//configura a altura do header, já que no CGRect não estava funcionando
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.0;
}


//Adiciona o header na tableview
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 3)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(70, 15, self.tableView.frame.size.width - 140, 20)];

    [labelNome setFont:[UIFont fontWithName:@"OpenSans-Bold" size:16]];

    UILabel *labelPreco = [[UILabel alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width - 80, 15, 80, 20)];

    [labelPreco setFont:[UIFont fontWithName:@"OpenSans-Bold" size:16]];
    
    UILabel *labelQuantidade = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 40, 20)];
    [labelQuantidade setFont:[UIFont fontWithName:@"OpenSans-Bold" size:16]];

    
    labelNome.text = @"Produtos";
    labelPreco.text = @"Valor";
    labelQuantidade.text = @"Qtd.";
    
    [headerView addSubview:labelNome];
    [headerView addSubview:labelPreco];
    [headerView addSubview:labelQuantidade];
    
    
    //adiciona uma linha separando o header da primeira cell
    UIView * seperatorView;
    CGRect sepFrame = CGRectMake(15, 49.9, headerView.frame.size.width - 15, 1);
    seperatorView = [[UIView alloc] initWithFrame:sepFrame];
    seperatorView.backgroundColor = [UIColor colorWithWhite:224.0/255.0 alpha:1.0];
    [headerView addSubview:seperatorView];

    return headerView;
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
