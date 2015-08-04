//
//  PDFViewController.h
//  MicahApp
//
//  Created by Thiago Borges Gonçalves Penna on 8/4/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFViewController : UIViewController <UIDocumentInteractionControllerDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
