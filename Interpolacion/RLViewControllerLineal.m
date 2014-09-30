//
//  RLViewControllerLineal.m
//  Interpolacion
//
//  Created by Rflpz on 04/09/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

#import "RLViewControllerLineal.h"

@interface RLViewControllerLineal ()
@property (nonatomic,weak) IBOutlet UIButton *calcular;

@property (nonatomic, weak) IBOutlet UITextField *vx;
@property (nonatomic, weak) IBOutlet UITextField *vx0;
@property (nonatomic, weak) IBOutlet UITextField *vx1;
@property (nonatomic, weak) IBOutlet UITextField *vf0;
@property (nonatomic, weak) IBOutlet UITextField *vf1;
@property (nonatomic, weak) IBOutlet UILabel *result;
@end



@implementation RLViewControllerLineal

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapCalcular = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(calcularDatos)];
    [self.calcular addGestureRecognizer:tapCalcular];
}

-(void)calcularDatos{
    double x  = [self.vx.text doubleValue];
    double x0 = [self.vx0.text doubleValue];
    double x1 = [self.vx1.text doubleValue];
    double f0 = [self.vf0.text doubleValue];
    double f1 = [self.vf1.text  doubleValue];
    double resultado = f0 + (((f1-f0)/(x1-x0))*(x-x0));
    NSString *operacion =[NSString stringWithFormat:(@"f(x) = %.4f"),resultado];
    if (!(isNumericI(_vx.text) && isNumericI(_vx0.text) && isNumericI(_vx1.text) && isNumericI(_vf0.text) && isNumericI(_vf1.text))){
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
BOOL isNumericI(NSString *cadena){
    NSUInteger length = [cadena length];
    Boolean status = true;
    unichar stringieChars[length];
    for( unsigned int pos = 0 ; pos < length ; ++pos )
    {
        stringieChars[pos] = [cadena characterAtIndex:pos];
    }
    for (int i = 0; i < length; i++) {
        if(!(stringieChars[i] == 43 || stringieChars[i] == 45 || stringieChars[i] == 46 || (stringieChars[i] >= 48 && stringieChars[i]<= 57))){
            status = false;
        }
        NSLog(@"%d",stringieChars[i]);
    }
    return status;
}
@end
