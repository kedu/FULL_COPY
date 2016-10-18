//
//  IWStatus.m
//  传智微博
//
//  Created by 李南江 on 14-7-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWStatus.h"
#import "IWPhoto.h"
#import "NSDate+NJ.h"
@implementation IWStatus

// 告诉框架pic_urls这个数组中存放什么类型的数据
+ (NSDictionary *)objectClassInArray
{
    return @{@"pic_urls": [IWPhoto class]};
}

- (void)setSource:(NSString *)source
{
    _source = source;
    
    // 1.计算从什么地方开始截取
    NSRange startRange = [_source rangeOfString:@">"];
    NSInteger startIndex = startRange.location + 1;
    // 2.计算截取的长度
//#warning rangeOfString方法会从字符串的开头开始查找, 只要查找到第一个就不会继续查找
    NSRange endRange = [_source rangeOfString:@"</"];
    NSInteger length = endRange.location - startIndex;
    // 3.截取字符串
    if (startRange.location != NSNotFound &&
        endRange.location != NSNotFound) {
        NSString *resultStr = [_source substringWithRange:NSMakeRange(startIndex, length)];
        _source = resultStr;
    }

}


- (NSString *)created_at
{

    // 1.将服务器返回的字符串转换为NSDate
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
#warning 注意: 如果是真机, 还需要设置时间所属的区域
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    // 指定服务器返回时间的格式
    // Mon Feb 02 18:15:20 +0800 2015
    formatter.dateFormat = @"EEE MMM  dd HH:mm:ss Z yyyy";
    NSDate *createdDate = [formatter dateFromString:_created_at];

    // 2.判断服务器返回的时间, 根据时间返回对应的字符串
    if ([createdDate isThisYear]) {
        // 今年
        if ([createdDate isToday]) {
            
            // 是今天
            // 取出服务器返回时间的时分秒
           NSDateComponents *comps = [createdDate deltaWithNow];
            if (comps.hour >= 1) {
                // 其它小时
                return [NSString stringWithFormat:@"%tu小时前", comps.hour];
            }else if (comps.minute > 1)
            {
                // 1小时以内
                return [NSString stringWithFormat:@"%tu分钟以前", comps.minute];
            }else
            {
                //刚刚
                return @"刚刚";
            }
            
        }else if ([createdDate isYesterday])
        {
            // 昨天
            formatter.dateFormat = @"昨天 HH时:mm分";
            return [formatter stringFromDate:createdDate];
        }else
        {
            // 其它天
            formatter.dateFormat = @"MM月dd日  HH时:mm分";
            return [formatter stringFromDate:createdDate];
        }
    }else
    {
        // 非今年
        formatter.dateFormat = @"yy年MM月dd日 HH时:mm分";
        return [formatter stringFromDate:createdDate];
    }
    
}



@end
