# CZHAlertView
ios CZHAlertView 类似系统UIAlertController封装

![QQ20180427.gif](https://upload-images.jianshu.io/upload_images/6709174-1b896ec443f1c35a.gif?imageMogr2/auto-orient/strip)


项目需要，类似系统的UIAlertController的弹窗，但是按钮文字大小颜色需要自定义，ios8.0版本的手机不支持使用kvc改变，于是就自己写了一个，可以自定义文字大小，显示动画有渐变和从底部弹出以及默认的没有动画效果

```
///使用很简单，类似系统的
CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"哈哈哈哈哈哈哈哈" message:@"啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦" preferredStyle:CZHAlertViewStyleActionSheet animationStyle:CZHAlertViewAnimationStyleSlideFromBottom];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"取消" style:CZHAlertItemStyleCancel handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"取消2" titleFont:CZHGlobelNormalFont(15) titleColor:CZHColor(0x0000ff) style:CZHAlertItemStyleCancel handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"自定义的按钮样式" titleFont:CZHGlobelNormalFont(12) titleColor:CZHColor(0x00ff00) style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
```

[查看博客](https://blog.csdn.net/hurryupcheng)
[查看简书](https://www.jianshu.com/u/2add458bf239)
