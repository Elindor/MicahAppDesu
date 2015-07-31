//
//  PerfilViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/31/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "PerfilViewController.h"

@interface PerfilViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nomeTextField;

@property (weak, nonatomic) IBOutlet UITextField *telefoneTextField;


@property (weak, nonatomic) IBOutlet UITextField *enderecoTextField;


@property (weak, nonatomic) IBOutlet UITextField *emailTextField;


@property (weak, nonatomic) IBOutlet UISwitch *switchON;

@property (weak, nonatomic) IBOutlet UIButton *logotipoOutlet;

@end

@implementation PerfilViewController


- (IBAction)logotipoButton:(id)sender {
 
    UIImagePickerController *pickerLibrary = [[UIImagePickerController alloc] init];
    pickerLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerLibrary.delegate = self;
    [self presentViewController: pickerLibrary animated:YES completion:nil];
    
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.imagePerfil = image;
    [self.logotipoOutlet setTitle:@"" forState:UIControlStateNormal];
    
    NSLog(@"logo: %@", self.logotipoOutlet.titleLabel.text);
    
    [self.logotipoOutlet setBackgroundImage:self.imagePerfil forState:UIControlStateSelected];
    [self.logotipoOutlet setBackgroundImage:self.imagePerfil forState:UIControlStateNormal];
    [self.logotipoOutlet setBackgroundImage:self.imagePerfil forState:UIControlStateHighlighted];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
