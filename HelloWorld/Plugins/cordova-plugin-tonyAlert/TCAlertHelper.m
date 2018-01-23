//
//  TCAlertHelper.m
//  HelloWorld
//
//  Created by TonyChan on 2018/1/23.
//

#import "TCAlertHelper.h"

@implementation TCAlertHelper

- (void)showAlertWithTitle:(CDVInvokedUrlCommand *)command{
    if (command.arguments.count>0) {
        //获取到入参数组中的第一个元素
        //自由约定入参数组的顺序
        NSString* title = command.arguments[0];
        
        //创建alertVC
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //创建一个回调对象并附上String类型参数
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Hey!I'm OC!"];
            //通过cordova框架中的callBackID回调至JS的回调函数上
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
        [alertVC addAction:action];
        [self.viewController presentViewController:alertVC animated:YES completion:nil];
    }else{
        //如果没有入参,则回调JS失败函数
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"没有入参alert title"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    
}

@end
