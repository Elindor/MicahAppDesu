//
//  AppDelegate.m
//  MicahApp
//
//  Created by Gabriel Nopper on 14/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "AppDelegate.h"
#import "Produto.h"
#import "ProdutosTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    NSArray *produtoArray = @[
                              [Produto criaProduto:@"caneta1" descricao:@"bic1" categoria:@"papelaria" precoPadrao: @12.32],
                         [Produto criaProduto:@"borracha" descricao:@"faber" categoria:@"papelaria" precoPadrao: @5.50],
                         [Produto criaProduto:@"caneta3" descricao:@"bic3" categoria:@"papelaria" precoPadrao: @10.00],
                         [Produto criaProduto:@"caneta4" descricao:@"bic4" categoria:@"papelaria" precoPadrao: @14.78],
                         [Produto criaProduto:@"caneta5" descricao:@"bic5" categoria:@"papelaria" precoPadrao: @7.90],
                         [Produto criaProduto:@"caneta6" descricao:@"bic6" categoria:@"papelaria" precoPadrao: @9.90],
                         [Produto criaProduto:@"caneta7" descricao:@"bic7" categoria:@"papelaria" precoPadrao: @8.89],
                         [Produto criaProduto:@"caneta8" descricao:@"bic8" categoria:@"papelaria" precoPadrao: @7.90],
                         [Produto criaProduto:@"caneta9" descricao:@"bic9" categoria:@"papelaria" precoPadrao: @15.00]
                         ];
    
    UINavigationController *navigationController = (UINavigationController *)[self.window rootViewController];
    
    ProdutosTableViewController *viewController = (ProdutosTableViewController *)navigationController.viewControllers[0];
    viewController.produtoArray = produtoArray;
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
