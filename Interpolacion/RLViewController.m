//
//  RLViewController.m
//  Interpolacion
//
//  Created by Rflpz on 04/09/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

#import "RLViewController.h"
#import "RLViewControllerLineal.h"
#import "RLViewControllerCuadratica.h"
#import "RLViewControllerLagrangeUno.h"
#import "RLViewControllerLagrangeDos.h"
#import <QuartzCore/QuartzCore.h>

@interface RLViewController ()
@property (nonatomic, strong) IBOutlet UISegmentedControl *segControll;
@property (nonatomic, strong) IBOutlet UIView *viewForm;
@property UIViewController *fromViewController;
@end

@implementation RLViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self customizeController];
    self.title = @"Interpolación";
    self.view.userInteractionEnabled = YES;

}
- (void)customizeController{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0;
    transition.type = kCATransitionReveal;
    [self.fromViewController.view.layer addAnimation:transition forKey:nil];
    self.fromViewController = [[RLViewControllerLineal alloc]initWithNibName:@"RLViewControllerLineal" bundle:nil];
    [self.fromViewController.view setFrame:CGRectMake(0, 0, self.viewForm.frame.size.width,self.viewForm.frame.size.height)];
    [self addChildViewController:self.fromViewController];
    [self.viewForm addSubview:self.fromViewController.view];
    [self.fromViewController didMoveToParentViewController:self];
}
- (NSString *) getTitleForSelectedSegment: (UISegmentedControl *) segment {
	return [segment titleForSegmentAtIndex:[segment selectedSegmentIndex]];
}
- (IBAction)selectOption:(id)sender {
    switch (self.segControll.selectedSegmentIndex ) {
        case 0:{
            [self crearMenu:0];
            NSLog(@"0");
            break;
        }
        case 1:{
            [self crearMenu:1];
            NSLog(@"1");
            break;
        }
        case 2:{
            [self crearMenu:2];
            NSLog(@"2");
            break;
        }
        case 3:{
            [self crearMenu:3];
            NSLog(@"3");
            break;
        }
        default:
            break;
    }
}
-(void)crearMenu:(int *)activo{
   int opcion = (int)(activo);
    switch (opcion) {
        case 0:{
            self.fromViewController = [[RLViewControllerLineal alloc]initWithNibName:@"RLViewControllerLineal" bundle:nil];
            break;
        }
        case 1:{
            self.fromViewController = [[RLViewControllerCuadratica alloc]initWithNibName:@"RLViewControllerCuadratica" bundle:nil];
            break;
        }
        case 2:{
            self.fromViewController = [[RLViewControllerLagrangeUno alloc]initWithNibName:@"RLViewControllerLagrangeUno" bundle:nil];
            break;
        }
        case 3:{
            self.fromViewController = [[RLViewControllerLagrangeDos alloc]initWithNibName:@"RLViewControllerLagrangeDos" bundle:nil];
            break;
        }
        default:
            break;
    }
    for (UIView *view  in self.viewForm.subviews) {
        [view removeFromSuperview];
    }
    
    
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0;
    transition.type = kCATransitionReveal;
    [self.fromViewController.view.layer addAnimation:transition forKey:nil];
    
    [self.fromViewController.view setFrame:CGRectMake(0, 0, self.viewForm.frame.size.width,self.viewForm.frame.size.height)];
    [self.viewForm addSubview:self.fromViewController.view];
    [self.fromViewController didMoveToParentViewController:self];
}

@end
