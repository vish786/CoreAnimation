//
//  TransformationViewController.m
//  CoreAnimation
//
//  Created by IndiaNIC on 11/10/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "TransformationViewController.h"

@interface TransformationViewController ()

@end

@implementation TransformationViewController

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
	// Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated
{
   // [self showlayerTransform];
   // [self showUIViewAnimation];
   // [self showCATransition];
   // [self showBasicAnimation];
    [self showCAKeyframAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showlayerTransform
{
    CALayer *container = [CALayer layer];
    container.frame = CGRectMake(30, 30, 100, 100);
    container.backgroundColor = [UIColor magentaColor].CGColor;
    [self.view.layer addSublayer:container];
    
    //Apply Transformation to plane
    CATransform3D t= CATransform3DIdentity;
    
    //Angle yourangle* M_PI/180.0f
    
    //perform a translation
    t = CATransform3DTranslate(t, 50, 50, 0);
    container.transform = t;
    
    
}
-(void)showUIViewAnimation
{
    UIView *aView = [[UIView alloc]init];
    aView.tag= 9;
    aView.backgroundColor = [UIColor orangeColor];
    aView.frame = CGRectMake(50, self.view.frame.size.height, 100, 100);
    [self.view addSubview:aView];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:100.0];
    [UIView setAnimationDidStopSelector:@selector(animationStop) ];
    [aView setFrame:CGRectMake(50, 50, 100, 100)];
    [UIView commitAnimations];

}

-(void)animationStop
{
    UIView *aView = [self.view viewWithTag:9];
    if (aView) {
        aView.backgroundColor = [UIColor blueColor];
    }

}

-(void)showCATransition
{
    
    CALayer *container = [CALayer layer];
    container.frame = CGRectMake(20, 20, 100, 100);
    container.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:container];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0;
    
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transition.type = kCATransitionPush;
    [transition setAutoreverses:YES];
    [transition setRepeatCount:100.0];
    transition.subtype = kCATransitionFromRight;
    
    [container addAnimation:transition forKey:kCATransition];
}

-(void)showBasicAnimation
{
    CALayer *container = [CALayer layer];
    container.frame = CGRectMake(50, 50, 100, 100);
    container.backgroundColor = [UIColor redColor].CGColor;

    [self.view.layer addSublayer:container];
    
    //Create Animation
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    [basicAnimation setDuration:1.5];
    [basicAnimation setRepeatCount:100.0];
    [basicAnimation setFromValue:[NSValue valueWithCGPoint:CGPointMake(container.frame.origin.x,container.frame.origin.y)]];
    [basicAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(container.frame.origin.x, container.frame.origin.y-10)]];
    [container addAnimation:basicAnimation forKey:@"bigmove"];
    [container setPosition:CGPointMake(container.frame.origin.x, container.frame.origin.y-10)];

}
-(void)showCAKeyframAnimation
{
    CALayer *container = [CALayer layer];
    [container setFrame:CGRectMake(110, 110, 100, 100)];
    [container setBackgroundColor:[UIColor yellowColor].CGColor];
    [self.view.layer addSublayer:container];
    
    CAKeyframeAnimation *showanimation1 = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    [showanimation1 setValues:@[@0,@M_PI_4,@M_PI_2,@M_PI]];
    [showanimation1 setDuration:1.0];
    [showanimation1 setDelegate:self];
    
    [container addAnimation:showanimation1 forKey:@"show"];
    
   
}
@end
