//
//  RLViewControllerCuadratica.m
//  Interpolacion
//
//  Created by Rflpz on 04/09/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

#import "RLViewControllerCuadratica.h"

@interface RLViewControllerCuadratica ()
@property (nonatomic, weak)IBOutlet UIButton *calcular;


@property (nonatomic, weak) IBOutlet UITextField *vx;
@property (nonatomic, weak) IBOutlet UITextField *vx0;
@property (nonatomic, weak) IBOutlet UITextField *vx1;
@property (nonatomic, weak) IBOutlet UITextField *vx2;
@property (nonatomic, weak) IBOutlet UITextField *vf0;
@property (nonatomic, weak) IBOutlet UITextField *vf1;
@property (nonatomic, weak) IBOutlet UITextField *vf2;
@property (nonatomic, weak) IBOutlet UILabel *result;


@end

@implementation RLViewControllerCuadratica
-(void)calcularDatos{
    double x = [_vx.text doubleValue];
    double x0 = [_vx0.text doubleValue];
    double x1 = [_vx1.text doubleValue];
    double x2 = [_vx2.text doubleValue];
    double f0 = [_vf0.text doubleValue];
    double f1 = [_vf1.text doubleValue];
    double f2 = [_vf2.text doubleValue];
    double b0,b1,b2,fx;
    b0 = f0;
    b1 = ((f1-f0)/(x1-x0));
    b2 = (((f2-f1)/(x2-x1))-b1)/(x2-x0);
    fx= b0+b1*(x-x0)+b2*(x-x0)*(x-x1);
    
    NSString *operacion =[NSString stringWithFormat:(@"f(x) = %.4f"),fx];
    if (!(isNumericI(_vx.text) && isNumericI(_vx0.text) && isNumericI(_vx1.text) && isNumericI(_vf0.text) && isNumericI(_vf1.text) && isNumericI(_vx2.text)&& isNumericI(_vf2.text))){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Solo numeros"
                                                        message:@"Ingresa todos los datos correctamente."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        NSLog(@"Error");
    }else{
        if (![operacion  isEqual: @"f(x) = nan"] && ![operacion  isEqual: @"f(x) = -inf"]) {
            self.result.text = operacion;
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Expresion invalida (NAN || -INF)."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapCalcular = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(calcularDatos)];
    [self.calcular addGestureRecognizer:tapCalcular];
}


@end
