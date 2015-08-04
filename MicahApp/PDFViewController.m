//
//  PDFViewController.m
//  MicahApp
//
//  Created by Thiago Borges Gonçalves Penna on 8/4/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "PDFViewController.h"
#import <UIKit/UIKit.h>

@interface PDFViewController ()

@property (nonatomic) UIDocumentInteractionController *documentInteractionController;

@end

@implementation PDFViewController


- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self previewDocument];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)previewDocument {
    NSURL *URL = [NSURL fileURLWithPath:[self getPDFFileName]];
    
    if (URL) {
        // Initialize Document Interaction Controller
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        
        // Preview PDF
        [self.documentInteractionController presentPreviewAnimated:YES];
    }
}

-(NSString *)getPDFFileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *pdfDirectoryString = [NSString stringWithFormat:@"%@/Orcamento.pdf", documentsDirectoryPath];
    
    NSLog(@"%@", pdfDirectoryString);
    
    return pdfDirectoryString;
    
    //    NSError *error = nil;
    //    if (![YOUR_PDF_DATA writeToFile:pdfDirectoryString options:NSDataWritingAtomic error:&error])
    //        NSLog(@"Error: %@", [error localizedDescription]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
