//
//  ViewController.m
//  LzCard
//
//  Created by SURE001 on 2017/1/22.
//  Copyright © 2017年 lizhen. All rights reserved.
//

#import "ViewController.h"
#import "LZCard.h"
@interface ViewController ()<InfoCardDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    LZCard * myCard = [[LZCard alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:myCard];
    myCard.headImgV.image = [UIImage imageNamed:@"IMG_3164.JPG"];
    myCard.roomNumLab.text = @"房间号  374783928";
    myCard.attationNumLab.text = @"344";
    myCard.focusedNumLab.text = @"231";
    myCard.delegate = self;
    myCard.nickNameLab.text = @"大家看结局";
    myCard.contentBrifLab.text = @"参加饭局阶级鸡肉饭加肉片佛肉哦破飞机我碰见据解放军";
}
- (void)clickInfoCardBackButton{
    NSLog(@"\n点击返回----------");
}
- (void)clickInfoCardChatButton{
    NSLog(@"\n-点击单聊---------");
}
- (void)clickInfoCardMainButton{
    NSLog(@"\n点击主页----------");
}
- (void)clickInfoCardAttationButton{
    NSLog(@"\n点击关注----------");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
