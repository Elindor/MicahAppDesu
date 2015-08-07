//
//  PerfilViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/31/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "PerfilViewController.h"
#import "SaveData.h"

@interface PerfilViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nomeTextField;

@property (weak, nonatomic) IBOutlet UITextField *telefoneTextField;


@property (weak, nonatomic) IBOutlet UITextField *enderecoTextField;


@property (weak, nonatomic) IBOutlet UITextField *emailTextField;


@property (weak, nonatomic) IBOutlet UISwitch *switchON;

@property (weak, nonatomic) IBOutlet UIButton *logotipoOutlet;

@end

@implementation PerfilViewController

-(void)viewWillAppear:(BOOL)animated{
    SaveData* save = [SaveData sharedAppData];
    _nameField.text = save.userName;
    _addressField.text = save.userAddress;
    _phoneField.text = save.userPhone;
    _mailField.text = save.userMail;
    self.imagePerfil = save.userIcon;
    _iCloudSwitch.on = save.iCloudIsOn;
    //[save save];
    
    //[self.logotipoOutlet setTitle:@"" forState:UIControlStateNormal];
    [self.logotipoOutlet setBackgroundImage:self.imagePerfil forState:UIControlStateSelected];
    [self.logotipoOutlet setBackgroundImage:self.imagePerfil forState:UIControlStateNormal];
    [self.logotipoOutlet setBackgroundImage:self.imagePerfil forState:UIControlStateHighlighted];
    if (self.imagePerfil != nil){
        [self.logotipoOutlet setTitle:@" " forState:UIControlStateNormal];
        
    }
}


- (IBAction)logotipoButton:(id)sender {
 
    UIImagePickerController *pickerLibrary = [[UIImagePickerController alloc] init];
    pickerLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerLibrary.delegate = self;
    [self presentViewController: pickerLibrary animated:YES completion:nil];
    
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.imagePerfil = image;
    SaveData* save = [SaveData sharedAppData];
    
    [self.logotipoOutlet setTitle:@"" forState:UIControlStateNormal];
    
    //permite que a imagem mantenha sua cor original nos três estados
    [self.logotipoOutlet setBackgroundImage:self.imagePerfil forState:UIControlStateSelected];
    [self.logotipoOutlet setBackgroundImage:self.imagePerfil forState:UIControlStateNormal];
    [self.logotipoOutlet setBackgroundImage:self.imagePerfil forState:UIControlStateHighlighted];
    
    save.userIcon = image;
    [save save];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //permite colocar imagem no navigationItem no lugar do texto
    UIImage *buttonImage = [[UIImage imageNamed:@"Logo.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem.image = buttonImage; //[UIImage imageNamed:@"IconeMais.png"];
    self.navigationItem.leftBarButtonItem.title = @"";
    
    //permite mudar a cor da caixa de texto dos textFields
    self.nomeTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.telefoneTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.enderecoTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.emailTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.nomeTextField.layer.borderWidth = 1.0f;
    self.telefoneTextField.layer.borderWidth = 1.0f;
    self.enderecoTextField.layer.borderWidth = 1.0f;
    self.emailTextField.layer.borderWidth = 1.0f;
    
    //permite mudar a identação do placeHolder
    [self setPlaceHolderPosition:self.nomeTextField];
    [self setPlaceHolderPosition:self.telefoneTextField];
    [self setPlaceHolderPosition:self.enderecoTextField];
    [self setPlaceHolderPosition:self.emailTextField];
    
    // Do any additional setup after loading the view.
}


-(void)setPlaceHolderPosition: (UITextField *) textField{
    //cria uma view para dar o espaçamento
    UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [textField setLeftViewMode:UITextFieldViewModeAlways];
    [textField setLeftView:spacerView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)nameExit:(id)sender {
}

- (IBAction)nameEdit:(id)sender {
    SaveData* save = [SaveData sharedAppData];
    save.userName = _nameField.text;
    [save save];
}

- (IBAction)phoneExit:(id)sender {
}

- (IBAction)phoneEdit:(id)sender {
    SaveData* save = [SaveData sharedAppData];
    save.userPhone = _phoneField.text;
    [save save];
}

- (IBAction)addressExit:(id)sender {
}

- (IBAction)addressEdit:(id)sender {
    SaveData* save = [SaveData sharedAppData];
    save.userAddress = _addressField.text;
    [save save];
}

- (IBAction)emailExit:(id)sender {
}

- (IBAction)emailEdit:(id)sender {
    SaveData* save = [SaveData sharedAppData];
    save.userMail = _emailTextField.text;
    [save save];
}

- (IBAction)iCloudEdit:(id)sender {
    SaveData* save = [SaveData sharedAppData];
    if(save.iCloudIsOn)
        save.iCloudIsOn = false;
    else
        save.iCloudIsOn = true;
    [save save];
    
}
@end
