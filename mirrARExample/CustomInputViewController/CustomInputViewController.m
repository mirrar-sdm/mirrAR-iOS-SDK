//
//  CustomInputViewController.m
//  mirrARExample
//
//  Created by Krishna Datt Shukla on 12/07/22.
//  Copyright © 2022 mirrARSDK. All rights reserved.
//

#import "CustomInputViewController.h"
#import "InputViewCell.h"
#import "InputViewModel.h"
#import "ViewController.h"

@interface CustomInputViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak) IBOutlet UITableView *tableViewInput;
@property (weak) IBOutlet UITextField *textFieldBrandId;

@property (strong, nonatomic) NSMutableArray *arrayInputData;
@end

@implementation CustomInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableViewInput registerNib:[UINib nibWithNibName:@"InputViewCell" bundle:nil] forCellReuseIdentifier:@"InputViewCell"];
    self.tableViewInput.allowsMultipleSelectionDuringEditing = false;

    self.arrayInputData = [[NSMutableArray alloc] init];
    [self addMoreItem];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)addMoreItem {
    InputViewModel *model = [[InputViewModel alloc] init];
    model.category = @"Earrings";
    model.type = @"ear";
    model.sku = @"51D2A3SLLABA18";
    [self.arrayInputData addObject:model];
    [self.tableViewInput reloadData];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"unwindSegueFromCustomInput"]) {
        ViewController *vc = (ViewController *)[segue destinationViewController];
        vc.customBrandData = (NSDictionary *)sender;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrayInputData.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Category %ld", (long)(section+1)];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"InputViewCell";
    InputViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[InputViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.inputFieldCategory.tag = indexPath.section*10 +1;
    cell.inputFieldType.tag = indexPath.section*10 +2;
    cell.inputFieldSKU.tag = indexPath.section*10 +3;
    
    [cell.inputFieldCategory addTarget:self action:@selector(inputFieldDidChage:) forControlEvents:UIControlEventEditingChanged];
    [cell.inputFieldType addTarget:self action:@selector(inputFieldDidChage:) forControlEvents:UIControlEventEditingChanged];
    [cell.inputFieldSKU addTarget:self action:@selector(inputFieldDidChage:) forControlEvents:UIControlEventEditingChanged];

    cell.inputFieldCategory.delegate = self;
    cell.inputFieldType.delegate = self;
    cell.inputFieldSKU.delegate = self;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 241.0;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.arrayInputData removeObjectAtIndex:indexPath.section];
        [self.tableViewInput reloadData];
    }
}

- (IBAction)inputFieldDidChage:(UITextField *)textField {
    int index = (int) (textField.tag/10);
    int inputTag = (int) (textField.tag%10);

    InputViewModel *model = [self.arrayInputData objectAtIndex:index];
    switch (inputTag) {
        case 1:
            model.category = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            break;
        case 2:
            model.type = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            break;
        case 3:
            model.sku = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            break;
        default:
            break;
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

- (IBAction)closeAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addMoreAction:(id)sender {
    [self addMoreItem];
}

- (IBAction)launchSDKAction:(id)sender {
    NSString *brandId = @""; //[self.textFieldBrandId.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (brandId == nil || [brandId isKindOfClass:[NSNull class]] || [brandId isEqualToString:@""]) {
        [self showAlert:@"Enter Brand ID first"];
        return;
    }
    
    for (int i=0; i<self.arrayInputData.count; i++) {
        InputViewModel *model = [self.arrayInputData objectAtIndex:i];
        if (model.category == nil || [model.category isKindOfClass:[NSNull class]] || [model.category isEqualToString:@""]) {
            [self showAlert:[NSString stringWithFormat:@"Enter Category Name for 'Category %d' or delete the Category by swipinng left.", i+1]];
            return;
        }
        
        if (model.type == nil || [model.type isKindOfClass:[NSNull class]] || [model.type isEqualToString:@""]) {
            [self showAlert:[NSString stringWithFormat:@"Enter Type for 'Category %d' or delete the Category by swipinng left.", i+1]];
            return;
        }
        
        if (model.sku == nil || [model.sku isKindOfClass:[NSNull class]] || [model.sku isEqualToString:@""]) {
            [self showAlert:[NSString stringWithFormat:@"Enter SKU for 'Category %d' or delete the Category by swipinng left.", i+1]];
            return;
        }
    }
    
    NSDictionary *productData = [InputViewModel getDictionaryFromModelArray:self.arrayInputData];
    NSDictionary *brandData = @{
        @"brandId": brandId,
        @"productData": productData
    };

    [self performSegueWithIdentifier:@"unwindSegueFromCustomInput" sender:brandData];
}

- (void)showAlert:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}



@end
