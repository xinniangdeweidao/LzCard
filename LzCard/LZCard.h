//
//  LZCard.h
//  LzCard
//
//  Created by SURE001 on 2017/1/22.
//  Copyright © 2017年 lizhen. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol InfoCardDelegate <NSObject>

@optional
/** 点击聊天回调 */
- (void)clickInfoCardChatButton;

/** 点击主页回调 */
- (void)clickInfoCardMainButton;

/** 点击返回回调 */
- (void)clickInfoCardBackButton;

/** 点击关注回调 */
- (void)clickInfoCardAttationButton;

@end
@interface LZCard : UIView

@property (nonatomic,strong)        UIView *              backV;//头像
@property (nonatomic,strong)        UIButton *            backBtn;//返回
@property (nonatomic,strong)        UIImageView *         headImgV;//头像
@property (nonatomic,strong)        UILabel *             nickNameLab;//名称
@property (nonatomic,strong)        UILabel *             roomNumLab;//房号
@property (nonatomic,strong)        UILabel *             attationNumLab;//关注量
@property (nonatomic,strong)        UILabel *             focusedNumLab;//粉丝量
@property (nonatomic,strong)        UILabel *             contentBrifLab;//描述
@property (nonatomic,strong)        UIView *              line1;
@property (nonatomic,strong)        UIView *              line2;
@property (nonatomic,strong)        UIView *              line3;
@property (nonatomic,strong)        UIView *              line4;
@property (nonatomic,strong)        UIButton *            chatBtn;//单聊
@property (nonatomic,strong)        UIButton *            mainInfoBtn;//主页
@property (nonatomic,strong)        UIButton *            attationBtn;//关注
@property (nonatomic, assign)       id<InfoCardDelegate> delegate;

@end
