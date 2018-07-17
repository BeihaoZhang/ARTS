//
//  ViewController.m
//  网络连通性
//
//  Created by Lincoln on 2018/7/16.
//  Copyright © 2018年 Lincoln. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionTask *task;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [NSMutableData data];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    if ([config respondsToSelector:@selector(waitsForConnectivity)]) {// iOS 11 可用
        // 网络连通性的超时时间取决于 timeoutIntervalForResource，默认 7 天。
        config.timeoutIntervalForResource = 300;
        // 每个task只会调用一次；background sessions 下不会去调用，因为系统默认会等待网络连接后
        config.waitsForConnectivity = YES;
    }
    
    self.session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://pic.netbian.com/uploads/allimg/180603/223734-1528036654a425.jpg"]];
    self.task = [self.session dataTaskWithRequest:request];
    [self.task resume];
}

- (void)URLSession:(NSURLSession *)session taskIsWaitingForConnectivity:(NSURLSessionTask *)task {
    // 这里可以更新UI等操作，告诉用户目前处理离线模式等。
    NSLog(@"当前处于无网络状态");
}


- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    if (completionHandler) {
        completionHandler(NSURLSessionResponseAllow);
    }
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSLog(@"接收数据");
    [self.data appendData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if (error) {
        NSLog(@"error: %@", error);
    } else {
        NSLog(@"下载完成");
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:self.data];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
            imageView.image = image;
            [self.view addSubview:imageView];
        });
    }
}


@end
