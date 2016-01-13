//
//  ViewController.m
//  QQMusicTransition
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 com.itcast. All rights reserved.
//

#import "ViewController.h"
#import "AnimatedTransitioning.h"
#import "SecondViewController.h"

@interface ViewController ()<UINavigationControllerDelegate>


@property (weak, nonatomic) IBOutlet UIButton *button;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
        
    self.button.imageView.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.button.imageView.layer.cornerRadius = self.button.bounds.size.width * 0.5;
}


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
        
    AnimatedTransitioning *transitioning = [[AnimatedTransitioning alloc] init];
    
    if ([toVC isKindOfClass:[SecondViewController class]]) {
        transitioning.pushed = YES;
    } else {
        transitioning.pushed = NO;
    }
    
    
    return transitioning;
}

@end
