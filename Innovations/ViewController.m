//
//  ViewController.m
//  Innovations
//
//  Created by AFSHA on 14/07/17.
//  Copyright © 2017 Afsha. All rights reserved.
//

#import "ViewController.h"

#define DocumentDirectory ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0])

@interface ViewController ()
{
    UIBezierPath *path;
    CAShapeLayer *shapeLayer;
    int lineNo;
}
@property (nonatomic, weak) IBOutlet UILabel *textLabel;
@property (nonatomic, weak) IBOutlet UIButton *removeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    path = [UIBezierPath bezierPath];
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
    shapeLayer.lineWidth = 3.0;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];

    [_textLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startAnimation)]];
    
    // Do any additional setup after loading the view, typically from a nib.
}

//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    
//
//    
//    NSMutableArray *finalMutable = [[NSMutableArray alloc] initWithObjects:@"hello",@"hi" ,nil];
//    NSArray *finalIndex = [[NSMutableArray alloc] initWithObjects:@"bye",@"tata" ,nil];
//    
//    NSString *documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    
//    NSString *rangePath = [documentsDir stringByAppendingPathComponent:@"Range.plist"];
//    NSString *indexPath = [documentsDir stringByAppendingPathComponent:@"Select.plist"];
//    
//    [finalMutable writeToFile:rangePath atomically:YES];
//    [finalIndex writeToFile:indexPath atomically:YES];
//}

- (IBAction)removeBorder:(id)sender {
    //[shapeLayer removeFromSuperlayer];
}

-(void)startAnimation{
    lineNo = 0;
    [self drawLine:lineNo];
}

-(void)drawLine:(int)line{
    CGPoint startPoint;
    CGPoint endPoint;
    switch (line) {
        case 0:
            startPoint = CGPointMake(self.textLabel.frame.origin.x, self.textLabel.frame.origin.y);
            endPoint = CGPointMake(CGRectGetMaxX(self.textLabel.frame), self.textLabel.frame.origin.y);
            break;
        case 1:
            startPoint = CGPointMake(CGRectGetMaxX(self.textLabel.frame), self.textLabel.frame.origin.y);
            endPoint = CGPointMake(CGRectGetMaxX(self.textLabel.frame), CGRectGetMaxY(self.textLabel.frame));
            break;
        case 2:
            startPoint = CGPointMake(CGRectGetMaxX(self.textLabel.frame), CGRectGetMaxY(self.textLabel.frame));
            endPoint = CGPointMake(self.textLabel.frame.origin.x, CGRectGetMaxY(self.textLabel.frame));
            break;
        case 3:
            startPoint = CGPointMake(self.textLabel.frame.origin.x, CGRectGetMaxY(self.textLabel.frame));
            endPoint = CGPointMake(self.textLabel.frame.origin.x, self.textLabel.frame.origin.y);
            break;
        default:
            return;
    }
    
    [self animateStartPoint:startPoint andEndPoint:endPoint];
    
}

-(void)animateStartPoint:(CGPoint) startPoint andEndPoint:(CGPoint)endPoint{
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    shapeLayer.path = [path CGPath];

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 5;
    animation.removedOnCompletion = NO;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [shapeLayer addAnimation:animation forKey:@"drawLineAnimation"];
    
    [self.view.layer addSublayer:shapeLayer];
    lineNo++;
    [self drawLine:lineNo];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
