//
//  NovaObservacaoViewController.m
//  MicahApp
//
//  Created by Érika Tiemi Uehara Moriya on 8/1/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "NovaObservacaoViewController.h"
#import "SaveData.h"

@interface NovaObservacaoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *observacaoTextField;


@end

@implementation NovaObservacaoViewController





- (IBAction)incluirObsButton:(id)sender {
    
    SaveData* save = [SaveData sharedAppData];
    NSString* observacao = _observacaoTextField.text;
    [save.observationList addObject:observacao];
    [save save];

#pragma Insert unwind

    [self performSegueWithIdentifier:@"UnwindFromNewToObservationMenu" sender:self];

    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.observacao = self.observacaoTextField.text;
    // Porque exatamente? O texto é novo e vazio nesta tela.
    
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

- (IBAction)exitText:(id)sender {
}
@end
