//
//  AddMapInfoViewController.m
//  IndoorPosition
//
//  Created by 雨田秋浩 on 14-7-24.
//  Copyright (c) 2014年 YongChang. All rights reserved.
//

#import "AddMapInfoViewController.h"

@interface AddMapInfoViewController ()

@property (nonatomic, strong) DBManager *dbManager;
@property (nonatomic, strong) NSArray *testInfo;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddMapInfoViewController

@synthesize mapName;
@synthesize major;

#pragma mark - Core Data
-(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

#pragma mark - segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if (sender != self.saveButton) {
        return;
    }
    
    if (self.mapName.text.length > 0 && self.major.text.length >0) {
        
        return;
    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dbManager = [[DBManager alloc]initWithDatabaseFilename:@"jdpark.db"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
