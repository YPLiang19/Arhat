Arhat 学习讨论QQ群：766215773


# Arhat
Arhat 是MangoFix (https://github.com/YPLiang19/Mango ) 的增强版本，再MangoFix基础上删除libffi/lex/yacc容易被Apple审核不通过的工具，同时增加了对可变参数的支持和字符串格式化打印，支持定制化混淆， 需要的加QQ群：766215773， 联系群主，申请免费试用哦～



## SWfit Example

```swift
import UIKit
import Arhat

let aes128Key = "123456"
let aes128Iv = "abcdef"

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let context = ARHATContext.init(key1: aes128Key, key2: aes128Iv, token: "找QQ群：766215773群主申请")
        //let data = AES128 脚本加密后的Data
        context.run(with: data as! Data)
        return true
    }

}

```


## Objctive-C Example
```objc
#import "AppDelegate.h"
#import <Arhat/Arhat.h>

static NSString * const aes128Key = @"123456";
static NSString * const aes128Iv = @"abcdef";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    RHATContext *context = [[ARHATContext alloc] initKey1:aes128Key key2:aes128Iv token:@"找QQ群：766215773群主申请"];
    NSData *encryptedData =  AES128 脚本加密后的Data
    [context runWithData:encryptedData];
	return YES;
}

@end

```

## Installation
### CocoaPods
1. Add `pod 'Arhat'` to your Podfile.
* Run `pod install` or `pod update`.
* Import `<Arhat/Arhat.h>`

## Usage
### Objective-C

1. `#import <Arhat/Arhat.h>`
2. `exec Arhat Script by ARHATContext runWithData`

```objc


```

### Mango

#### Swift Quick start

```objc
/**
demo.mg
*/


// 给Swift中带模块名的ArhatSwiftDylibTest.CustomView类，声明别名CustomView，必须先声明后使用
@SwiftClassAlias ArhatSwiftDylibTest.CustomView CustomView;

// 修复ArhatSwfitDemo模块中的ViewController类, 注意：@SwiftModule注解中的字符串参数时C字符串，不是OC字符串对象
@SwiftModule("ArhatSwfitDemo")
class ViewController:UIViewController {


- (void)varArgsAndStringFormatExample {

    // NSLog format 可变参数
    NSString *text1 = @"text1";
    NSString *text2 = @"text2";
    NSLog(@"text1: %@, text2:%@", text1, text2);
  
      
    // NSString initWithFormat 可变参数
    NSString *str  = NSString.alloc().initWithFormat:(@"我是: %@", @"哈哈哈哈🤣");
    NSLog(@"%@", str);
    
    
    // NSMutableString appendFormat 可变参数
    NSMutableString *strM = NSMutableString.string();
    strM.appendFormat:(@"key1 : %@\n", @"string");
    strM.appendFormat:(@"key2 : %d\n", 2);
    strM.appendFormat:(@"key3 : %.2f\n", 3.4);
    NSLog(@"strM: %@", strM);
   
   
    // NSSet initWithObjects 可变参数
    NSSet *set = NSSet.alloc.initWithObjects:(@(1), @(2), @(3), nil);
    NSLog(@"set: %@", set);
    
    
    // printf format 可变参数
    printf("cstring:%s\n", "this is a c string");
    
    
}

- (void)ifStatementExample {
    int a = 2;
    int b = 2;

    NSString *text;
    if(a > b){
        text = @"执行结果: a > b";
    }else if (a == b){
        text = @"执行结果: a == b";
    }else{
        text = @"执行结果: a < b";
    }
    self.resultView.text = text;
}

- (void)switchStatementExample {
    int a = 2;
    NSString *text;
    switch(a){
        case 1:{
            text = @"match 1";
            break;
        }
        case 2:{} //case 后面的一对花括号不可以省略
        case 3:{
            text = @"match 2 or 3";
            break;
        }
        case 4:{
            text = @"match 4";
            break;
        }
        default:{
            text = @"match default";
        }
    }
    self.resultView.text = text;
}

- (void)forStatementExample {
    NSString *text = @"";
    for(int i = 0; i < 20; i++){
        text = text + i + @", ";
        if(i == 10){
            break;
        }
    }
    self.resultView.text = text;
}

- (void)forEachStatementExample {
    NSArray *arr = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"g", @"i", @"j",@"k"];
    NSString *text = @"";
    for(id element in arr){
        text = text + element + @", ";
        if(element.isEqualToString:(@"i")){
            break;
        }

    }
    self.resultView.text = text;
}

- (void)whileStatementExample {
    int a;
    while(a < 10){
        if(a == 5){
            break;
        }
        a++;
    }
    self.resultView.text = @""+a;
}

- (void)doWhileStatementExample {
    int a = 0;
    do{
        a++;
    }while(NO);
    self.resultView.text = @""+a;

}

- (void)blockStatementExample {
    Block catStringBlock = ^NSString *(NSString *str1, NSString *str2){
                                NSString *result = str1.stringByAppendingString:(str2);
                                return result;
                            };
    NSString *result = catStringBlock(@"hello ", @"world!");
    self.resultView.text = result;
}

// 当脚步中的方法名和Swift中方法名不一致时，利用MethodName注解，指明Swift中的方法名
@MethodName("swiftMethodParamPassingExampleWithBOOLArg:intArg:uintArg:blockArg:objArg:")
- (void)paramPassingExampleWithBOOLArg:(BOOL)BOOLArg intArg:(int) intArg uintArg:(NSUInteger)uintArg blockArg:(Block)blockArg  objArg:(id)objArg {
    NSString *text = @"";
    text += @"BOOLArg:" + BOOLArg + @",\n";
    text += @"intArg:" + intArg + @",\n";
    text += @"uintArg:" + uintArg + @",\n";
    text += @"Block执行结果:" + blockArg(@"hello", @"mango") + @"\n";
    text += @"objArg:" + objArg;
    self.resultView.text = text;
}


@MethodName("paramPassingExampleWithStrutWithRect:")
- (struct CGRect)paramPassingExampleWithStrut:(struct CGRect)rect {
    struct CGRect ret = rect;
    ret.origin.x = ret.origin.x + 1;
    ret.origin.y = ret.origin.y + 1;
    ret.size.width = ret.size.width + 1;
    ret.size.height = ret.size.height + 1;
    return ret;
}

- (Block)returnBlockExample {
    NSString *prefix = @"mango: ";
    Block catStringBlock = ^NSString *(NSString *str1, NSString *str2){
        NSString *result = str1.stringByAppendingString:(str2);
        return prefix + result;
    };
    return catStringBlock;
}


- (void)callOriginalImp {
    self.ORGcallOriginalImp();
}

- (void)createAndOpenNewViewControllerExample {
    SubMyController *vc = SubMyController.alloc().init();
    self.navigationController.pushViewController:animated:(vc,YES);

}

//类方法替换示例
+ (void)classMethodExapleWithInstance:(ViewController *)vc {
    vc.resultView.text = @"here is Mango  Class Method " + self;
}

//条件注释示例
@If($systemVersion.doubleValue() > 16.0 )
- (void)conditionsAnnotationExample {
    self.resultView.text = @"here is Mango method";
}


//GCD示例
- (void)gcdExample {
    dispatch_queue_t queue = dispatch_queue_create("com.plliang19.mango", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"mango dispatch_async");
    });
    dispatch_sync(queue, ^{
        NSLog(@"mango dispatch_sync");
    });
}



- (void)staticVarAndGetVarAddressOperExample {
    static int i = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        i++;
    });
    self.resultView.text = @""+i;
}

- (void)cfuntionVarExample{
    int NSDocumentDirectory = 9;
    int NSUserDomainMask = 1;

    int  O_WRONLY = 0x0001;
    uint S_IRWXU  = 0000700;


    CFunction<id, int, int, BOOL> NSSearchPathForDirectoriesInDomains = CFunction("NSSearchPathForDirectoriesInDomains");
    CFunction<int, char *, int, int> open = CFunction("open");
    CFunction<size_t, int, void *, size_t> write = CFunction("write");
    CFunction<int, int> close = CFunction("close");


    NSString *doc = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;

    NSString *path = doc.stringByAppendingPathComponent:(@"MangoFxi.html");
    NSFileManager *fileManager = NSFileManager.defaultManager();
    if (!fileManager.fileExistsAtPath:(path)) {
        BOOL ret = fileManager.createFileAtPath:contents:attributes:(path, nil, nil);
        if (!ret) {
            self.resultView.text = @"创建文件失败";
            return;
        }
    }
    int fd = open(path.UTF8String,O_WRONLY, S_IRWXU);
    if (fd < 0) {
        self.resultView.text = @"打开文件失败";
        return;
    }
    NSURL *url = NSURL.URLWithString:(@"https://www.qq.com");
    NSData *data = NSData.dataWithContentsOfURL:(url);
    write(fd, data.bytes, data.length);
    close(fd);
    self.resultView.text = @"文件写入成功:" + path;
}

- (void)typedefExaple{
    self.resultView.text = @"typedef long alias_long;";
}


}

int a = 1;

@SwiftModule("ArhatSwiftDylibTest")
class SuperMyController : UIViewController {
/*
- (void)viewDidLoad {
    super.viewDidLoad();
    self.view.backgroundColor = UIColor.blueColor();
    self.testMasonry();
}
*/

- (void)testMasonry {
    UIView *superview = self.view;
    UIView *view1 = UIView.alloc().init();
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view1.backgroundColor = UIColor.greenColor();
    superview.addSubview:(view1);
    struct UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    view1.mas_makeConstraints:(^(MASConstraintMaker *make) {
        make.top.equalTo()(superview.mas_top).with.offset()(padding.top); //with is an optional semantic filler
        make.left.equalTo()(superview.mas_left).with.offset()(padding.left);
        make.bottom.equalTo()(superview.mas_bottom).with.offset()(-padding.bottom);
        make.right.equalTo()(superview.mas_right).with.offset()(-padding.right);
    });
}

}


// 注意：其实此处父类前的@SwiftModule("ArhatSwiftDylibTest")注解可以省略， 因为前面已经有声明SuperMyController是在ArhatSwiftDylibTest模块中
class SubMyController : @SwiftModule("ArhatSwiftDylibTest") SuperMyController {

@property (strong, nonatomic) UIView *rotateView;

- (void)viewDidLoad {
    super.viewDidLoad();
    self.title = @"Magno 创建自定义ViewController";
    double width = 100;
    double height = 100;
    double x = self.view.frame.size.width/2 - width/2;
    double y = self.view.frame.size.height/2 - height/2;
    UIView *view = CustomView.alloc().initWithFrame:(CGRectMake(x, y, width, height));
    self.view.addSubview:(view);
    view.backgroundColor = UIColor.redColor();
    self.rotateView = view;
    
    
    UILabel *label = UILabel.alloc().initWithFrame:(CGRectMake(10, 80, 350, 600));
    label.numberOfLines = 100;
    label.text =@"  长文本测试 :   select()机制中提供一fd_set的数据结构，实际上是一long类型的数组，每一个数组元素都能与一打开的文件句柄（不管是socket句柄，还是其他文件或命名管道或设备句柄）建立联系，建立联系的工作由程序员完成，当调用select()时，由内核根据IO状态修改fd_set的内容，由此来通知执行了select()的进程哪一socket或文件发生了可读或可写事件。select()机制中提供一fd_set的数据结构，实际上是一long类型的数组，每一个数组元素都能与一打开的文件句柄（不管是socket句柄，还是其他文件或命名管道或设备句柄）建立联系，建立联系的工作由程序员完成，当调用select()时，由内核根据IO状态修改fd_set的内容，由此来通知执行了select()的进程哪一socket或文件发生了可读或可写事件。select()机制中提供一fd_set的数据结构，实际上是一long类型的数组，每一个数组元素都能与一打开的文件句柄（不管是socket句柄，还是其他文件或命名管道或设备句柄）建立联系，建立联系的工作由程序员完成，当调用select()时，由内核根据IO状态修改fd_set的内容，由此来通知执行了select()的进程哪一socket或文件发生了可读或可写事件。select()机制中提供一fd_set的数据结构，实际上是一long类型的数组，每一个数组元素都能与一打开的文件句柄（不管是socket句柄，还是其他文件或命名管道或设备句柄）建立联系，建立联系的工作由程序员完成，当调用select()时，由内核根据IO状态修改fd_set的内容，由此来通知执行了select()的进程哪一socket或文件发生了可读或可写事件。";
    self.view.addSubview:(label);
    


    __weak id weakSelf = self;
    self.block = ^{
        __strong ids strongSelf = weakSelf;
        NSLog(strongSelf.class());
    };

    UIButton *btn = UIButton.alloc().initWithFrame:(CGRectMake(100, 300, 200, 50));
    btn.setBackgroundColor:(UIColor.redColor());
    btn.setTitle:forState:(@"test btn click", UIControlStateNormal);
    btn.addTarget:action:forControlEvents:(self, @selector(btnDidClicked:), UIControlEventTouchUpInside);
    self.view.addSubview:(btn);

}

- (void)btnDidClicked:(id)btn {
    NSLog(btn);
}

}

```


#### Objective-C Quick start

```objc
/**
demo.mg
*/

//声明一个自定义结构体
declare struct MyStruct {
    typeEncoding:"{MyStruct=dd}",
    keys:x,y
}

class ViewController:UIViewController {

- (void)varArgsAndStringFormatExample {

    // NSLog format 可变参数
    NSString *text1 = @"text1";
    NSString *text2 = @"text2";
    NSLog(@"text1: %@, text2:%@", text1, text2);
  
      
    // NSString initWithFormat 可变参数
    NSString *str  = NSString.alloc().initWithFormat:(@"我是: %@", @"哈哈哈哈🤣");
    NSLog(@"%@", str);
    
    
    // NSMutableString appendFormat 可变参数
    NSMutableString *strM = NSMutableString.string();
    strM.appendFormat:(@"key1 : %@\n", @"string");
    strM.appendFormat:(@"key2 : %d\n", 2);
    strM.appendFormat:(@"key3 : %.2f\n", 3.4);
    NSLog(@"strM: %@", strM);
   
   
    // NSSet initWithObjects 可变参数
    NSSet *set = NSSet.alloc.initWithObjects:(@(1), @(2), @(3), nil);
    NSLog(@"set: %@", set);
    
    
    // printf format 可变参数
    printf("cstring:%s\n", "this is a c string");
    
    
}


- (void)ifStatementExample{
	int a = 2;
	int b = 2;

	NSString *text;
	if(a > b){
		text = @"执行结果: a > b";
	}else if (a == b){
		text = @"执行结果: a == b";
	}else{
		text = @"执行结果: a < b";
	}
	self.resultView.text = text;
}

- (void)switchStatementExample{
	int a = 2;
	NSString *text;
	switch(a){
		case 1:{
			text = @"match 1";
			break;
		}
		case 2:{} //case 后面的一对花括号不可以省略
		case 3:{
			text = @"match 2 or 3";
			break;
		}
		case 4:{
			text = @"match 4";
			break;
		}
		default:{
			text = @"match default";
		}
	}
	self.resultView.text = text;
}

- (void)forStatementExample{
	NSString *text = @"";
	for(int i = 0; i < 20; i++){
		text = text + i + @", ";
		if(i == 10){
			break;
		}
	}
	self.resultView.text = text;
}

- (void)forEachStatementExample{
	NSArray *arr = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"g", @"i", @"j",@"k"];
	NSString *text = @"";
	for(id element in arr){
		text = text + element + @", ";
		if(element.isEqualToString:(@"i")){
			break;
		}

	}
	self.resultView.text = text;
}

- (void)whileStatementExample{
	int a;
	while(a < 10){
		if(a == 5){
			break;
		}
		a++;
	}
	self.resultView.text = @""+a;
}

- (void)doWhileStatementExample{
	int a = 0;
	do{
		a++;
	}while(NO);
	self.resultView.text = @""+a;

}

- (void)blockStatementExample{
	Block catStringBlock = ^NSString *(NSString *str1, NSString *str2){
								NSString *result = str1.stringByAppendingString:(str2);
								return result;
							};
	NSString *result = catStringBlock(@"hello ", @"world!");
	self.resultView.text = result;
}


- (void)paramPassingExampleWithBOOLArg:(BOOL)BOOLArg intArg:(int) intArg uintArg:(NSUInteger)uintArg blockArg:(Block)blockArg  objArg:(id)objArg {
	NSString *text = @"";
	text += @"BOOLArg:" + BOOLArg + @",\n";
	text += @"intArg:" + intArg + @",\n";
    text += @"uintArg:" + uintArg + @",\n";
	text += @"Block执行结果:" + blockArg(@"hello", @"mango") + @"\n";
	text += @"objArg:" + objArg;
	self.resultView.text = text;
}


- (struct MyStruct)paramPassingExampleWithStrut:(struct CGRect)rect{
    struct MyStruct myStruct = {x:(rect.origin.x + 100), y:(rect.origin.x + 10)};
    return myStruct;
}

- (Block)returnBlockExample{
	NSString *prefix = @"mango: ";
	Block catStringBlock = ^NSString *(NSString *str1, NSString *str2){
		NSString *result = str1.stringByAppendingString:(str2);
		return prefix + result;
	};
	return catStringBlock;
}


- (void)callOriginalImp{
    self.ORGcallOriginalImp();
}

- (void)createAndOpenNewViewControllerExample{
	SubMyController *vc = SubMyController.alloc().init();
	self.navigationController.pushViewController:animated:(vc,YES);

}

//类方法替换示例
+ (void)classMethodExapleWithInstance:(ViewController *)vc{
	vc.resultView.text = @"here is Mango  Class Method " + self;
}

//条件注释示例
#If($systemVersion.doubleValue() > 12.0 )
- (void)conditionsAnnotationExample{
self.resultView.text = @"here is Mango method";
}


//GCD示例
- (void)gcdExample{
	dispatch_queue_t queue = dispatch_queue_create("com.plliang19.mango", DISPATCH_QUEUE_CONCURRENT);
	dispatch_async(queue, ^{
		NSLog(@"mango dispatch_async");
	});
	dispatch_sync(queue, ^{
		NSLog(@"mango dispatch_sync");
	});
}


//静态变量和取地址运算符示例
- (void)staticVarAndGetVarAddressOperExample{
    static int i = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        i++;
    });
    self.resultView.text = @""+i;
}

//C函数变量示例
- (void)cfuntionVarExample{
    int NSDocumentDirectory = 9;
    int NSUserDomainMask = 1;

    int  O_WRONLY = 0x0001;
    uint S_IRWXU  = 0000700;


    CFunction<id, int, int, BOOL> NSSearchPathForDirectoriesInDomains = CFunction("NSSearchPathForDirectoriesInDomains");
    CFunction<int, char *, int, int> open = CFunction("open");
    CFunction<size_t, int, void *, size_t> write = CFunction("write");
    CFunction<int, int> close = CFunction("close");


    NSString *doc = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;

    NSString *path = doc.stringByAppendingPathComponent:(@"MangoFxi.html");
    NSFileManager *fileManager = NSFileManager.defaultManager();
    if (!fileManager.fileExistsAtPath:(path)) {
        BOOL ret = fileManager.createFileAtPath:contents:attributes:(path, nil, nil);
        if (!ret) {
            self.resultView.text = @"创建文件失败";
            return;
        }
    }
    int fd = open(path.UTF8String,O_WRONLY, S_IRWXU);
    if (fd < 0) {
        self.resultView.text = @"打开文件失败";
        return;
    }
    NSURL *url = NSURL.URLWithString:(@"https://github.com/YPLiang19/Mango");
    NSData *data = NSData.dataWithContentsOfURL:(url);
    write(fd, data.bytes, data.length);
    close(fd);
    self.resultView.text = @"文件写入成功:" + path;
}


// Native 全局变量访问测试
- (void)nativeGlobalVariableAccess {

    extern int nativeInt1;
    extern int nativeInt2;
    
    NSLog(@"--" + nativeInt1);
    NSLog(@"--" + nativeInt2);

    nativeInt2 = nativeInt1;
                    
    NSLog(@"--" + nativeInt1);
    NSLog(@"--" + nativeInt2);


    CFunction<void, char *> testNativeCStringFunc = CFunction("testNativeCStringFunc");
    
    extern Pointer nativeCString1;
    extern Pointer nativeCString2;
    
    testNativeCStringFunc(nativeCString1);
    testNativeCStringFunc(nativeCString2);
    
    nativeCString2 = nativeCString1;
    
    testNativeCStringFunc(nativeCString1);
    testNativeCStringFunc(nativeCString2);
    

    extern NSString *nativeNSString;
    self.resultView.text = nativeNSString;
    
}

//typedef示例
- (void)typedefExaple{
    self.resultView.text = @"typedef long alias_long;";
}


}


class SuperMyController:UIViewController{
- (void)viewDidLoad {
    super.viewDidLoad();
    self.view.backgroundColor = UIColor.blueColor();
}

}


class SubMyController:SuperMyController {
@property (strong, nonatomic) UIView *rotateView;
- (void)viewDidLoad {
        super.viewDidLoad();
		self.title = @"Magno 创建自定义ViewController";
		double width = 100;
		double height = 100;
		double x = self.view.frame.size.width/2 - width/2;
		double y = self.view.frame.size.height/2 - height/2;
		UIView *view = MyView.alloc().initWithFrame:(CGRectMake(x, y, width, height));
		self.view.addSubview:(view);
		view.backgroundColor = UIColor.redColor();
		self.rotateView = view;
}

}

```



#### Mango Type usage
 Mango support type as fllow: 
 
##### void
  	equivalent to Objective-C `void`.
	
#### BOOL
  	equivalent to Objective-C `BOOL`.
	
##### uint
	equivalent to Objective-C `unsigned char`、`unsigned short`、`unsigned int`、`unsigned long`、`unsigned long long`、`NSUInteger`. 
	  
#### int
  	equivalent to Objective-C `char`、`short`、`int`、`long`、`long long`、`NSInteger`. 
	
##### double
  	equivalent to Objective-C `double`、`float`、`CGFloat`. 
	
#### id
  	equivalent to Objective-C `id`.
	
#### OCClassName *
  	NSString *str = @"";
	
#### Block
  	Block blokc = ^id(id arg){};
	
#### Class
  	Class clazz = NSString.class();
	
#### struct
  	struct CGRect rect;// must add struct keyword  before structure variables defined.
	
#### Pointer
 	Pointer ptr; // C pointer. 
 	
#### CFunction
   	CFunction<returnType,arg1Type,arg2Type,...> ptr = CFunction("c function name"); // CFunction. 
	

## Ohter
    For more information on MangFix usage, see the Arhat project unit test.
    
    
    
# 微信捐赠

![wechat-pay](https://user-images.githubusercontent.com/36928218/122531509-27e2c200-d052-11eb-9063-1f8f28c67683.jpg)
