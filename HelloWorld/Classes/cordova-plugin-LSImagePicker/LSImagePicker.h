//
//  LSImagePicker.h
//  HelloWorld
//
//  Created by TonyChan on 2018/1/25.
//

#import <Cordova/CDVPlugin.h>

@interface LSImagePicker : CDVPlugin
- (void)pushTZImagePickerController:(CDVInvokedUrlCommand *)command;
- (void)getLastVideo:(CDVInvokedUrlCommand *)command;
@end
