//
//  PageHolderViewController.h
//  MicahApp
//
//  Created by Gabriel Nopper on 27/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentClientViewController.h"
#import "ContentFinilizeViewController.h"
#import "ContentObservationTableViewController.h"
#import "ContentProductTableViewController.h"
#import "CreateOrcaViewController.h"
#import "ContentAdjustmentViewController.h"
#import "SaveData.h"


@interface PageHolderViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) CreateOrcaViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *topBarButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *TopBar;
- (IBAction)TopBarButtonAction:(id)sender;

@end
