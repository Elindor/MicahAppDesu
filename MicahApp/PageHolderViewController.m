//
//  PageHolderViewController.m
//  MicahApp
//
//  Created by Gabriel Nopper on 27/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "PageHolderViewController.h"


@interface PageHolderViewController ()


@end

@implementation PageHolderViewController{
    NSInteger currentPage;
    NSArray *topButtonNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma Aqui fica a diferenciação da origem do app. Este viewDidLoad refere-se ao botão novo, onde ele cria o orca novo e coloca na lista de saves. Para continuar um não-terminado, deve-se apenas criar um init custom que receve o orcamento desejado, e proceder EXATAMENTE como depois da #pragma "Feijão"
    
    SaveData *save = [SaveData sharedAppData];
    orcamentos *newOrca = [[orcamentos alloc] init];
    
    [save.unfinishedList addObject:newOrca];
    [save save];
    
    save.currentOrca = newOrca;                         // O currentOrca onde ocorrem as alterações. É importante setar ele na continuação também, pois a referencia na edição e caixas de texto e etc. vem aqui.
        //P.S.: Current orca não salva, é apenas um elemento singleton.
    
#pragma "Feijão"
    
    _pageTitles = @[@"Dados do Cliente", @"Produtos", @"Ajustes", @"Observações", @"Finalização"];
    topButtonNames = @[@"Importar", @"Adicionar", @"", @"Adicionar", @"Finalizar"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateOrca"];
    self.pageViewController.dataSource = self;
    
    ContentClientViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    currentPage = 0;
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    self.TopBar.title = self.pageTitles[0];
    self.topBarButton.title = topButtonNames[0];
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ContentClientViewController*) viewController).pageIndex;
    self.TopBar.title = self.pageTitles[index];
    self.topBarButton.title = topButtonNames[index];
    currentPage = index;

    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;

    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ContentClientViewController*) viewController).pageIndex;
    self.TopBar.title = self.pageTitles[index];
    self.topBarButton.title = topButtonNames[index];
    currentPage = index;

    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;

    
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (ContentClientViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Cria view controller adequado para cada coisa
    
    switch (index) {
        case 0:{
            ContentClientViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentClient"];
            pageContentViewController.titleText = self.pageTitles[index];
            pageContentViewController.pageIndex = index;

            return pageContentViewController;
            break;
        }
        
        case 1:{
            ContentProductTableViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentProduct"];
            pageContentViewController.pageIndex = index;
            
            return pageContentViewController;
            break;
        }
        case 2:{
            ContentObservationTableViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentFinilize"];
            pageContentViewController.pageIndex = index;

            return pageContentViewController;
            break;
        }
        case 3:{
            ContentFinilizeViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentObservation"];
            pageContentViewController.pageIndex = index;

            return pageContentViewController;
            break;
        }
        case 4:{
            ContentFinilizeViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentFinilize"];
            pageContentViewController.pageIndex = index;

            return pageContentViewController;
            break;
        }
        default:{
            ContentClientViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentClient"];
            pageContentViewController.titleText = self.pageTitles[index];
            pageContentViewController.pageIndex = index;

            return pageContentViewController;
            break;
        }
    }
}


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (IBAction)TopBarButtonAction:(id)sender {
    
    switch (currentPage) {
        case 0:
            NSLog(@"0");
            break;
        case 1:
            NSLog(@"1");
            break;
        case 2:
            NSLog(@"2");
            break;
        case 3:
            NSLog(@"3");
            break;
        case 4:
            NSLog(@"3");
            break;
        
            
        default:
            break;
    }
    
}


@end
