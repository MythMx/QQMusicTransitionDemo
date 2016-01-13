//
//  SecondViewController.m
//  QQMusicTransition
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 com.itcast. All rights reserved.
//

#import "SecondViewController.h"

static const CGFloat duration = 0.4;

@interface SecondViewController ()

@property (weak, nonatomic) UIImageView *smartImageView;

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(pop:)];
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:swipeRecognizer];
}

- (void)pop:(UISwipeGestureRecognizer *)swipeRecognizer
{
    if (swipeRecognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self pushAnimation];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


- (void)pushAnimation
{
    UIImageView *smartImageView = [[UIImageView alloc] init];
    smartImageView.image = [UIImage imageNamed:@"1"];
    smartImageView.frame = CGRectMake(25, self.view.bounds.size.height - 60, 50, 50);
    smartImageView.layer.cornerRadius = smartImageView.frame.size.width * 0.5;
    smartImageView.contentMode = UIViewContentModeScaleAspectFill;
    smartImageView.clipsToBounds = YES;
    smartImageView.layer.masksToBounds = YES;
    [self.view addSubview:smartImageView];
    self.smartImageView = smartImageView;
    
    [UIView animateWithDuration:duration animations:^{
        smartImageView.center = self.view.center;
        smartImageView.transform = CGAffineTransformMakeScale(4.0, 4.0);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)popAnimation
{
    [UIView animateWithDuration:duration animations:^{
        self.smartImageView.center = CGPointMake(35, self.view.bounds.size.height - 35);
        self.smartImageView.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        
    }];
}

@end
