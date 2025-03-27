//
//  ViewController.m
//  mangoExample
//
//  Created by jerry.yong on 2017/10/31.
//  Copyright © 2017年 yongpengliang. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import <objc/runtime.h>
#import "SomClass.h"
#import "WebKitViewController.h"

NSString *nativeNSString = @"nativeNSString value";

const char *nativeCString1 = "nativeCString1 value";
const char *nativeCString2 = "nativeCString2 value";
NSInteger nativeInt1 = 1;
NSInteger nativeInt2 = 2;


void testNativeCStringFunc(const char * str) {
    printf("testNativeCStringFunc: %s\n", str);
}


typedef struct {
    CGFloat x;
    CGFloat y;
} MyStruct;
static NSString * const cellIdentifier = @"cell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextView *resultView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *titles;
@end

@implementation ViewController


+ (void)classMethodExapleWithInstance:(ViewController *)vc{
	vc.resultView.text = @"here is OC Class Method";
}


- (void)viewDidLoad {
	[super viewDidLoad];
   
    
	self.title = @"Mango示例";
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    CGRect rect = CGRectMake(1, 2, 2, 4);
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    SomClass2 *some = [[SomClass2 alloc] initWithFrame:rect configuration:config];
    NSLog(@"some: %@", some);
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.titles.count;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	NSInteger row = indexPath.row;
	cell.textLabel.text = self.titles[row];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	NSInteger row = indexPath.row;
	switch (row) {
		case 0:// 可变参数与格式化打印
			[self varArgsAndStringFormatExample];
			break;
            
		case 1://if语句示例
            
			[self ifStatementExample];
			break;
            
		case 2://switch语句示例
			[self switchStatementExample];
			break;
            
		case 3://for语句示例
			[self forStatementExample];
			break;
            
		case 4://forEach语句示例
			[self forEachStatementExample];
			break;
            
		case 5://while语句示例
			[self whileStatementExample];
			break;
            
		case 6://do while语句示例
			[self doWhileStatementExample];
			break;
            
		case 7://block语句示例
			[self blockStatementExample];
			break;
            
        case 8://参数传递示例
        {
            
            int a = 1;
            [self paramPassingExampleWithBOOLArg:YES intArg:1 uintArg:2  blockArg:^id(NSString *str1, NSString *str2) {
                return [NSString stringWithFormat:@"%@-%@-%d",str1,str2,a];
            } objArg:@"string object"];
            
            break;
        }
            
        case 9:{//结构体传参示例
             MyStruct myStruct = [self paramPassingExampleWithStrut:CGRectMake(1, 2, 3, 3)];
            self.resultView.text = [NSString stringWithFormat:@"myStruct.x = %@,\n myStruct.y = %@", @(myStruct.x),@(myStruct.y)];
            break;
        }
            
		case 10:{//返回值示例
			NSString * (^retBlcok)(NSString *str1,NSString *str2) = [self returnBlockExample];
            if (retBlcok) {
                NSString *result = retBlcok(@"hello ",@"jerry!");
                self.resultView.text = result;
            }
			break;
		}
            
		case 11://创建自定义ViewController
			[self createAndOpenNewViewControllerExample];
			break;
            
		case 12://替换类方式示例
			[self.class classMethodExapleWithInstance:self];
			break;
            
        case 13://调用原始实现示例
            [self callOriginalImp];
            break;
            
		case 14://条件注解示例
			[self conditionsAnnotationExample];
			break;
            
		case 15://CGD示例
			[self gcdExample];
			break;
        case 16://静态变量示例
            [self staticVarAndGetVarAddressOperExample];
            break;
        case 17://C函数变量示例
            [self cfuntionVarExample];
            break;
        case 18://typedef 示例C
            [self typedefExaple];
            break;
        case 19:
            [self nativeGlobalVariableAccess];
            break;
        case 20:
            [self webkitExample];
            break;
		default:
			break;
	}
    
}

- (NSArray *)titles{
	if (_titles == nil) {
		_titles = @[@"可变参数与格式化打印示例",@"if语句示例",@"switch语句示例",@"for语句示例",@"forEach语句示例",@"while语句示例",
					@"do while语句示例",@"block语句示例",@"参数传递示例",@"结构体传参示例",@"返回值示例",@"创建自定义ViewController",@"替换类方式示例",@"调用原始实现示例",@"条件注解示例",@"GCD示例",@"静态变量和取地址运算符示例",@"C函数变量示例", @"teypedef 示例", @"测试访问Native 全局变量", @"WebKit 示例"];
	}
	return _titles;
}


- (void)varArgsAndStringFormatExample{
	
}

- (void)ifStatementExample{
	
}

- (void)switchStatementExample{
	
}

- (void)forStatementExample{
	
}

- (void)forEachStatementExample{
	
}

- (void)whileStatementExample{
	
}

- (void)doWhileStatementExample{
	
}

- (void)blockStatementExample{
	
}

- (void)paramPassingExampleWithBOOLArg:(BOOL)BOOLArg intArg:(NSInteger) intArg uintArg:(NSUInteger)uintArg  blockArg:(id (^)(NSString *str1, NSString *str2))blockArg objArg:(id)objArg {
	
}

- (MyStruct)paramPassingExampleWithStrut:(CGRect)rect{
    return (MyStruct){0,0};
}

- (void)passStackBlock:(void (^)(void))block{
}

- (NSString *(^)(NSString *,NSString *))returnBlockExample{
	return nil;
}

- (void)callOriginalImp{
    self.resultView.text = @"in original IMP";
}

- (void)createAndOpenNewViewControllerExample{
	
}


- (void)conditionsAnnotationExample{
	self.resultView.text = @"here is OC method";
}


- (void)gcdExample{
    
}

- (void)staticVarAndGetVarAddressOperExample{
    
}

- (void)cfuntionVarExample{
    
}

- (void)typedefExaple{
    
}

- (void)nativeGlobalVariableAccess {
    
}

- (void)webkitExample {
    [self.navigationController pushViewController:[[WebKitViewController alloc] init] animated:YES];
    
}
@end
