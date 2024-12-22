The solution involves explicitly setting the `myString` property to `nil` within the `dealloc` method to break any potential retain cycles.

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *myString;
@end

@implementation MyClass
- (void)dealloc {
    self.myString = nil; // Release the string
    [super dealloc];
}
@end
```

Alternatively, consider using `weak` properties when appropriate to prevent strong reference cycles altogether.

```objectivec
@interface MyClass : NSObject
@property (nonatomic, weak) NSString *myString;
@end
```

This approach avoids the need for explicit release in `dealloc`.  Always analyze your object's relationships and choose the appropriate property attribute for optimal memory management.