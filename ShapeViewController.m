//
//  ShapeViewController.m
//  CoreAnimation
//
//  Created by IndiaNIC on 16/10/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "ShapeViewController.h"

@interface ShapeViewController ()

@end

@implementation ShapeViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
//- (void)viewDidLoad
//{       [super viewDidLoad];
//	// Do any additional setup after loading the view.
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
-(void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupLayer];
}
-(void)setupLayer
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [[UIColor blueColor] CGColor];
    layer.fillColor = [[UIColor magentaColor]CGColor];
    layer.lineWidth = 4.0;
    [self.view.layer addSublayer:layer];
    layer.path = [self defaultPath];
    
}
-(void)bounce
{
    CABasicAnimation *animaiton = [CABasicAnimation animationWithKeyPath:@"path"];
    [animaiton setDuration:2.5];
    [animaiton setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animaiton setFromValue:(__bridge id)[self defaultPath]];
    [animaiton setToValue:(__bridge id)[self compressedPath]];
    [animaiton setAutoreverses:YES];
    [self.view.layer addAnimation:animaiton forKey:@"animatepath"];
}
-(CGPathRef)defaultPath
{

    return [[UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 200, 200)] CGPath];
    
}
-(CGPathRef)compressedPath
{
    CGRect newFrame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width * 0.5, self.view.frame.size.height*0.5);
    return [[UIBezierPath bezierPathWithOvalInRect:newFrame] CGPath];
}
@end
