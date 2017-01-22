//
//  LZCard.m
//  LzCard
//
//  Created by SURE001 on 2017/1/22.
//  Copyright © 2017年 lizhen. All rights reserved.
//

#import "LZCard.h"

@implementation LZCard

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //        __weak typeof(self) weakSelf = self;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.2];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            _backV = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width/3.0 - 15,frame.size.height/3.0-15,frame.size.width/3.0+30, frame.size.height/3.0 + 30)];
        }
        else{
            _backV = [[UIView alloc]initWithFrame:CGRectMake(50,9*frame.size.height/40.0,frame.size.width - 100, 11*frame.size.height/20.0)];
        }
        _backV.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.7];
        _backV.layer.cornerRadius = 10;
        _backV.layer.masksToBounds = YES;
        [self addSubview:_backV];
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(_backV.bounds) - 40, 20, 25, 25)];
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"setting_close"] forState:UIControlStateNormal];
        _backBtn.imageView.contentMode = UIViewContentModeScaleToFill;
        [_backBtn addTarget:self action:@selector(cardInfoBackBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_backV addSubview:_backBtn];
        _headImgV = [[UIImageView alloc]initWithFrame:CGRectMake((_backV.bounds.size.width - 60)/2.0, 40, 60, 60)];
        _headImgV.layer.cornerRadius = 30.0;
        _headImgV.layer.masksToBounds = YES;
        [_backV addSubview:_headImgV];
        
        _nickNameLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_headImgV.frame)+5, _backV.bounds.size.width, 30)];
        _nickNameLab.textAlignment = 1;
        [_backV addSubview:_nickNameLab];
        
        _roomNumLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_nickNameLab.frame), _backV.bounds.size.width, 30)];
        _roomNumLab.textAlignment = 1;
        _roomNumLab.font = [UIFont systemFontOfSize:15];
        _roomNumLab.textColor = [UIColor darkGrayColor];
        [_backV addSubview:_roomNumLab];
        
        UILabel * attationLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_roomNumLab.frame)+10, _backV.bounds.size.width/2.0-1, 30)];
        attationLab.textAlignment = 1;
        attationLab.textColor = [UIColor darkGrayColor];
        attationLab.text = @"关注量";
        attationLab.font = [UIFont systemFontOfSize:17];
        [_backV addSubview:attationLab];
        
        UILabel * focusedLab = [[UILabel alloc]initWithFrame:CGRectMake(_backV.bounds.size.width/2.0, CGRectGetMinY(attationLab.frame), _backV.bounds.size.width/2.0, 30)];
        focusedLab.textAlignment = 1;
        focusedLab.text = @"粉丝量";
        focusedLab.font = [UIFont systemFontOfSize:17];
        focusedLab.textColor = [UIColor darkGrayColor];
        [_backV addSubview:focusedLab];
        
        _attationNumLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(attationLab.frame), CGRectGetMaxY(attationLab.frame), CGRectGetWidth(attationLab.bounds), 30)];
        _attationNumLab.textAlignment = 1;
        _attationNumLab.font = [UIFont systemFontOfSize:17];
        [_backV addSubview:_attationNumLab];
        
        _focusedNumLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(focusedLab.frame), CGRectGetMaxY(focusedLab.frame), CGRectGetWidth(focusedLab.bounds), 30)];
        _focusedNumLab.textAlignment = 1;
        _focusedNumLab.font = [UIFont systemFontOfSize:17];
        [_backV addSubview:_focusedNumLab];
        _line1 = [[UIView alloc]initWithFrame:CGRectMake(_backV.bounds.size.width/2.0-0.75,CGRectGetMinY(attationLab.frame)+21, 1.5, 18)];
        _line1.backgroundColor = [UIColor lightGrayColor];
        [_backV addSubview:_line1];
        
        _contentBrifLab = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_attationNumLab.frame), _backV.bounds.size.width - 20*2, 70)];
        _contentBrifLab.textAlignment = 1;
        _contentBrifLab.numberOfLines = 3;
        _contentBrifLab.font = [UIFont systemFontOfSize:15];
        _contentBrifLab.textColor = [UIColor darkGrayColor];
        [_backV addSubview:_contentBrifLab];
        
        _line2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_contentBrifLab.frame)+10, _backV.bounds.size.width, 1.5)];
        _line2.backgroundColor = [UIColor lightGrayColor];
        [_backV addSubview:_line2];
        
        _chatBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_line2.frame)+10, _backV.bounds.size.width/3.0, 30)];
        [_chatBtn setTitle:@"聊天" forState:UIControlStateNormal];
        [_chatBtn addTarget:self action:@selector(cardInfoChatBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_chatBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [_backV addSubview:_chatBtn];
        _mainInfoBtn = [[UIButton alloc]initWithFrame:CGRectMake(_backV.bounds.size.width/3.0, CGRectGetMinY(_chatBtn.frame), _backV.bounds.size.width/3.0, 30)];
        [_mainInfoBtn setTitle:@"主页" forState:UIControlStateNormal];
        [_mainInfoBtn addTarget:self action:@selector(cardInfoMainBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_mainInfoBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [_backV addSubview:_mainInfoBtn];
        
        _attationBtn = [[UIButton alloc]initWithFrame:CGRectMake(2*_backV.bounds.size.width/3.0, CGRectGetMinY(_chatBtn.frame), _backV.bounds.size.width/3.0, 30)];
        [_attationBtn setTitle:@"+关注" forState:UIControlStateNormal];
        [_attationBtn addTarget:self action:@selector(cardInfoAttationBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_attationBtn setTitleColor:[UIColor colorWithRed:0.36 green:0.76 blue:0.65 alpha:1.0] forState:UIControlStateNormal];
        [_backV addSubview:_attationBtn];
        _line3 = [[UIView alloc]initWithFrame:CGRectMake(_backV.bounds.size.width/3.0-0.75, CGRectGetMinY(_mainInfoBtn.frame)+6, 1.5, CGRectGetHeight(_chatBtn.bounds) - 12)];
        _line3.backgroundColor = [UIColor lightGrayColor];
        [_backV addSubview:_line3];
        _line4 = [[UIView alloc]initWithFrame:CGRectMake(2*_backV.bounds.size.width/3.0-0.75, CGRectGetMinY(_attationBtn.frame)+6, 1.5, CGRectGetHeight(_chatBtn.bounds) - 12)];
        _line4.backgroundColor = [UIColor lightGrayColor];
        [_backV addSubview:_line4];
    }
    return self;
}
#pragma mark - 返回
- (void)cardInfoBackBtnClick{
    if ([self.delegate respondsToSelector:@selector(clickInfoCardAttationButton)]) {
        [self.delegate clickInfoCardBackButton];
    }
}
#pragma mark - 单聊
- (void)cardInfoChatBtnClick{
    if ([self.delegate respondsToSelector:@selector(clickInfoCardChatButton)]) {
        [self.delegate clickInfoCardChatButton];
    }
}
#pragma mark - 主页
- (void)cardInfoMainBtnClick{
    if ([self.delegate respondsToSelector:@selector(clickInfoCardMainButton)]) {
        [self.delegate clickInfoCardMainButton];
    }
}
#pragma mark - 关注
- (void)cardInfoAttationBtnClick{
    if ([self.delegate respondsToSelector:@selector(clickInfoCardAttationButton)]) {
        [self.delegate clickInfoCardAttationButton];
    }
}

@end
