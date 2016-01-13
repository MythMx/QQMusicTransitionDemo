//
//  PushAnimatedTransitioning.m
//  QQMusicTransition
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 com.itcast. All rights reserved.
//

#import "AnimatedTransitioning.h"
#import "SecondViewController.h"

static const CGFloat duration = 0.4;

@implementation AnimatedTransitioning

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return duration;
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (self.pushed) {
        
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        UIView *containerView = [transitionContext containerView];
        
        toView.alpha = 0;
        [containerView addSubview:toView];
        
        [UIView animateWithDuration:duration animations:^{
            toView.alpha = 1;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];

    } else {
        
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        
        SecondViewController *secondVc = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        
        [secondVc popAnimation];
        
        UIView *containerView = [transitionContext containerView];
        
        [containerView insertSubview:toView belowSubview:fromView];
        
        [UIView animateWithDuration:duration animations:^{
            fromView.alpha = 0;
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
        
    }
    
}

@end
