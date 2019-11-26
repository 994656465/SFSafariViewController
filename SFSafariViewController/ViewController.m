//
//  ViewController.m
//  SFSafariViewController
//
//  Created by dd luo on 2019/11/26.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import "ViewController.h"
#import <SafariServices/SafariServices.h>
@interface ViewController ()<SFSafariViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIButton * button = [UIButton buttonWithType:0];
    button.frame = CGRectMake(100, 100, 200, 100);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"SFSafariViewController" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor]  forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)buttonClick{
//    SFSafariViewController现在只支持http和https格式的URL 如果直接使用www.baidu.com会闪退
    SFSafariViewController * safariVC = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
//    如果不需要监听代理方法,可以不用,如果需要使用需要引入<SFSafariViewControllerDelegate>
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:NO completion:nil];
}

//  MARK: - SFSafariViewControllerDelegate

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller{
    NSLog(@"左上角 done click");
}

-(void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully{
    NSLog(@"加载完成");
}



-(void)safariViewController:(SFSafariViewController *)controller initialLoadDidRedirectToURL:(NSURL *)URL{
     NSLog(@"开始加载");
}

- (NSArray<UIActivity *> *)safariViewController:(SFSafariViewController *)controller activityItemsForURL:(NSURL *)URL title:(nullable NSString *)title {
    NSLog(@"点击分享按钮,调用系统分享界面");
    return @[];
}

- (NSArray<UIActivityType> *)safariViewController:(SFSafariViewController *)controller excludedActivityTypesForURL:(NSURL *)URL title:(nullable NSString *)title  {
    NSLog(@"屏蔽某些分享按钮,调用系统分享界面");
    return @[];
}


@end
