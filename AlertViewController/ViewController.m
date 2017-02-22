//
//  ViewController.m
//  AlertViewController
//
//  Created by chaitanya on 14/09/16.
//  Copyright © 2016 chaitanya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     alertTitle = @"Text input Alert";
    alertMessage = @"Plain and secure Text input";
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = NSLocalizedString(@"Login Email", @"Login");
        [textField addTarget:self action:@selector(alertTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = NSLocalizedString(@"Password", @"Password");
        textField.secureTextEntry = YES;
    }];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Login" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
    alertAction.enabled = NO;
    UIAlertAction *cancelAlert = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){}];
    [alert addAction:cancelAlert];
    [alert addAction:alertAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)alertTextFieldDidChange: (UITextField *)sender{
    UIAlertController *controller = (UIAlertController *)self.presentedViewController;
    if (controller) {
        UITextField *login = controller.textFields.firstObject;
        UIAlertAction *ok = controller.actions.lastObject;
        ok.enabled = login.text.length > 2;
    }
}

@end
