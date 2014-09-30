//
//  RLViewControllerLagrangeUno.m
//  Interpolacion
//
//  Created by Rflpz on 04/09/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

#import "RLViewControllerLagrangeUno.h"

@interface RLViewControllerLagrangeUno ()
@property (nonatomic,weak) IBOutlet UITextField *vx;
@property (nonatomic,weak) IBOutlet UITextField *vx0;
@property (nonatomic,weak) IBOutlet UITextField *vx1;
@property (nonatomic,weak) IBOutlet UITextField *vf0;
@property (nonatomic,weak) IBOutlet UITextField *vf1;
@property (nonatomic,weak) IBOutlet UIButton *calcular;
@property (nonatomic,weak) IBOutlet UILabel *result;
@end

@implementation RLViewControllerLagrangeUno

-(void)calcularDatos{
    double x = [_vx.text doubleValue];
    double x0 = [_vx0.text doubleValue];
    double x1 = [_vx1.text doubleValue];
    double f0 = [_vf0.text doubleValue];
    double f1 = [_vf1.text doubleValue];
    double f1x, parteUno, parteDos;
    parteUno = ((x-x1)/(x0-x1))*f0;
    parteDos = ((x-x0)/(x1-x0))*f1;
    f1x = parteUno+parteDos;
    NSString *operacion =[NSString stringWithFormat:(@"f(x) = %.4f"),f1x];
    if (!(isNumericI(_vx.text) && isNumericI(_vx0.text) && isNumericI(_vx1.text) && isNumericI(_vf0.text) && isNumericI(_vf1.text) )){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Solo numeros"
                                                        message:@"Ingresa todos los datos correctamente."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        NSLog(@"Error");
    }else{
        if (![operacion  isEqual: @"f(x) = nan"]) {
            self.result.text = operacion;
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Expresion invalida (NAN)."
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
