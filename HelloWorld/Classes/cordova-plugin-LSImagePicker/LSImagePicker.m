//
//  LSImagePicker.m
//  HelloWorld
//
//  Created by TonyChan on 2018/1/25.
//

#import "LSImagePicker.h"
#import "TZImagePickerController.h"
#import "TZImageManager.h"

@interface LSImagePicker()<TZImagePickerControllerDelegate>

@end



@implementation LSImagePicker


#pragma mark - TZImagePickerController

- (void)pushTZImagePickerController:(CDVInvokedUrlCommand *)command {
    
    if (command.arguments.count>0) {
        //获取到入参数组中的第一个元素
        //自由约定入参数组的顺序
//        NSString* title = command.arguments[0];
    }
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    // imagePickerVc.navigationBar.translucent = NO;
    
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = NO;
    imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = YES;
    imagePickerVc.allowPickingImage = NO;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingMultipleVideo = NO; // 是否可以多选视频
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = NO;
    
    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = NO;
    imagePickerVc.needCircleCrop = NO;
    
    
    // 设置竖屏下的裁剪尺寸
    NSInteger left = 30;
    NSInteger widthHeight = [UIScreen mainScreen].bounds.size.width - 2 * left;
    NSInteger top = ([UIScreen mainScreen].bounds.size.height - widthHeight) / 2;
    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    // 设置横屏下的裁剪尺寸
    // imagePickerVc.cropRectLandscape = CGRectMake((self.view.tz_height - widthHeight) / 2, left, widthHeight, widthHeight);
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/
    
    //imagePickerVc.allowPreview = NO;
    // 自定义导航栏上的返回按钮
    /*
     [imagePickerVc setNavLeftBarButtonSettingBlock:^(UIButton *leftButton){
     [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
     [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 20)];
     }];
     imagePickerVc.delegate = self;
     */
    imagePickerVc.isStatusBarDefault = NO;
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingVideoHandle:^(UIImage *coverImage,id asset) {
        // open this code to send video / 打开这段代码发送视频
        [[TZImageManager manager] getVideoOutputPathWithAsset:asset presetName:AVAssetExportPreset640x480 success:^(NSString *outputPath) {
            NSLog(@"视频导出到本地完成,沙盒路径为:%@",outputPath);
            // Export completed, send video here, send by outputPath or NSData
            // 导出完成，在这里写上传代码，通过路径或者通过NSData上传
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:outputPath];
            //通过cordova框架中的callBackID回调至JS的回调函数上
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } failure:^(NSString *errorMessage, NSError *error) {
            NSLog(@"视频导出失败:%@,error:%@",errorMessage, error);
            NSString *errorMsg = [NSString stringWithFormat:@"视频导出失败:%@,error:%@",errorMessage, error];
            
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMsg];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
    }];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:imagePickerVc animated:YES completion:nil];
}


@end
