//
//  TCAlertHelper.h
//  HelloWorld
//
//  Created by TonyChan on 2018/1/23.
//


#import <Cordova/CDVPlugin.h>

@interface TCAlertHelper : CDVPlugin

-(void)showAlertWithTitle:(CDVInvokedUrlCommand *)command;


@end
