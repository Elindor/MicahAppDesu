//
//  PerfilViewController.h
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/31/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PerfilViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) NSString *nomePerfil;
@property (weak, nonatomic) NSString *telefonePerfil;
@property (weak, nonatomic) NSString *enderecoPerfil;
@property (weak, nonatomic) NSString *emailPerfil;
@property (weak, nonatomic) UIImage *imagePerfil;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UITextField *mailField;
@property (weak, nonatomic) IBOutlet UISwitch *iCloudSwitch;



- (IBAction)nameExit:(id)sender;
- (IBAction)nameEdit:(id)sender;
- (IBAction)phoneExit:(id)sender;
- (IBAction)phoneEdit:(id)sender;
- (IBAction)addressExit:(id)sender;
- (IBAction)addressEdit:(id)sender;
- (IBAction)emailExit:(id)sender;
- (IBAction)emailEdit:(id)sender;
- (IBAction)iCloudEdit:(id)sender;

@end
