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

@end
