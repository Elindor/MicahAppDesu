//
//  EditarObservacaoViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 7/30/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "EditarObservacaoViewController.h"
#import "SaveData.h"

@interface EditarObservacaoViewController ()



@property (weak, nonatomic) IBOutlet UITextField *observacaoTextField;
@property (weak, nonatomic) NSString *initialString;

@end

@implementation EditarObservacaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.observacaoTextField.text = self.observacao;
    self.observacaoTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.observacaoTextField.layer.borderWidth = 1.0f;
    UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.observacaoTextField setLeftViewMode:UITextFieldViewModeAlways];
    [self.observacaoTextField setLeftView:spacerView];
    
    _initialString = _observacao;
   
    
    UIView *spaceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.observacaoTextField setLeftViewMode:UITextFieldViewModeAlways];
    [self.observacaoTextField setLeftView:spaceView];
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
- (IBAction)textChaged:(id)sender {
    SaveData *current = [SaveData sharedAppData];
    NSString *targetToChange;
    for(NSString *str in current.observationList){
        if([str isEqualToString:_initialString])
            targetToChange = str;
    }
    targetToChange = _observacaoTextField.text;
}

@end
