//
//  LWJNavigationController.m
//  Test20180912
//
//  Created by 税鸽飞腾 on 2018/9/12.
//  Copyright © 2018年 123. All rights reserved.
//

#import "LWJNavigationController.h"
//第三方 pod 'FDFullscreenPopGesture'
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface LWJNavigationController ()
@property (nonatomic, strong)UIViewController *viewController;

@end

@implementation LWJNavigationController
/**
 * 当第一次使用这个类的时候会调用一次
 */
+ (void)initialize
{
    // 当导航栏用在XMGNavigationController中, appearance设置才会生效
    //    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    UINavigationBar *bar = [UINavigationBar appearance];
    //
    //    bar.barTintColor = NavColor;
    //    这行代码可以关闭半透明效果，但是会导致坐标0点移动。
    bar.translucent = NO;
    //    关闭坐标0点移动
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"pushViewController = %@", viewController);
    
    //判断能否POP
    self.fd_fullscreenPopGestureRecognizer.enabled = YES;
    
    self.viewController = viewController;
    
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateHighlighted];
        //        button.frame = CGRectMake(15, 0, 25, 25);
        button.frame = CGRectMake(15, 0, 40, 40);
        // 让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //[button sizeToFit];
        // 让按钮的内容往左边偏移10
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
}
- (void)back
{
        [self popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
