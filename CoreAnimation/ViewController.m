//
//  ViewController.m
//  CoreAnimation
//
//  Created by IndiaNIC on 11/10/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "ViewController.h"
#import "ShapeViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnShapeTapped:(id)sender;
{
    ShapeViewController *aShapreViewControllerObj = [[ShapeViewController alloc]init];
    [self.navigationController pushViewController:aShapreViewControllerObj animated:YES];

}
@end
