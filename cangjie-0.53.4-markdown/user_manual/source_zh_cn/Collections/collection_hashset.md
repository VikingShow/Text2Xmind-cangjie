





HashSet \- 仓颉语言用户指南




































1. **1\.** 初识仓颉语言❱
2. 1. [**1\.1\.** 初识仓颉语言](../../source_zh_cn/first_understanding/basic.html)
	2. [**1\.2\.** 安装仓颉工具链](../../source_zh_cn/first_understanding/install_Community.html)
	3. [**1\.3\.** 运行第一个仓颉程序](../../source_zh_cn/first_understanding/hello_world.html)
3. **2\.** 基本概念❱
4. 1. [**2\.1\.** 标识符](../../source_zh_cn/basic_programming_concepts/identifier.html)
	2. [**2\.2\.** 程序结构](../../source_zh_cn/basic_programming_concepts/program_structure.html)
	3. [**2\.3\.** 表达式](../../source_zh_cn/basic_programming_concepts/expression.html)
	4. [**2\.4\.** 函数](../../source_zh_cn/basic_programming_concepts/function.html)
5. **3\.** 基础数据类型❱
6. 1. [**3\.1\.** 整数类型](../../source_zh_cn/basic_data_type/integer.html)
	2. [**3\.2\.** 浮点类型](../../source_zh_cn/basic_data_type/float.html)
	3. [**3\.3\.** 布尔类型](../../source_zh_cn/basic_data_type/bool.html)
	4. [**3\.4\.** 字符类型](../../source_zh_cn/basic_data_type/characters.html)
	5. [**3\.5\.** 字符串类型](../../source_zh_cn/basic_data_type/strings.html)
	6. [**3\.6\.** 元组类型](../../source_zh_cn/basic_data_type/tuple.html)
	7. [**3\.7\.** 数组类型](../../source_zh_cn/basic_data_type/array.html)
	8. [**3\.8\.** 区间类型](../../source_zh_cn/basic_data_type/range.html)
	9. [**3\.9\.** Unit 类型](../../source_zh_cn/basic_data_type/unit.html)
	10. [**3\.10\.** Nothing 类型](../../source_zh_cn/basic_data_type/nothing.html)
7. **4\.** 函数❱
8. 1. [**4\.1\.** 定义函数](../../source_zh_cn/function/define_functions.html)
	2. [**4\.2\.** 调用函数](../../source_zh_cn/function/call_functions.html)
	3. [**4\.3\.** 函数类型](../../source_zh_cn/function/first_class_citizen.html)
	4. [**4\.4\.** 嵌套函数](../../source_zh_cn/function/nested_functions.html)
	5. [**4\.5\.** Lambda 表达式](../../source_zh_cn/function/lambda.html)
	6. [**4\.6\.** 闭包](../../source_zh_cn/function/closure.html)
	7. [**4\.7\.** 函数调用语法糖](../../source_zh_cn/function/function_call_desugar.html)
	8. [**4\.8\.** 函数重载](../../source_zh_cn/function/function_overloading.html)
	9. [**4\.9\.** 操作符重载](../../source_zh_cn/function/operator_overloading.html)
	10. [**4\.10\.** const 函数和常量求值](../../source_zh_cn/function/const_func_and_eval.html)
9. **5\.** 结构类型❱
10. 1. [**5\.1\.** 定义 struct 类型](../../source_zh_cn/struct/define_struct.html)
	2. [**5\.2\.** 创建 struct 实例](../../source_zh_cn/struct/create_instance.html)
	3. [**5\.3\.** mut 函数](../../source_zh_cn/struct/mut.html)
11. **6\.** 枚举类型和模式匹配❱
12. 1. [**6\.1\.** 枚举类型](../../source_zh_cn/enum_and_pattern_match/enum.html)
	2. [**6\.2\.** Option 类型](../../source_zh_cn/enum_and_pattern_match/option_type.html)
	3. [**6\.3\.** 模式概述](../../source_zh_cn/enum_and_pattern_match/pattern_overview.html)
	4. [**6\.4\.** 模式的 Refutability](../../source_zh_cn/enum_and_pattern_match/pattern_refutability.html)
	5. [**6\.5\.** match 表达式](../../source_zh_cn/enum_and_pattern_match/match.html)
	6. [**6\.6\.** if\-let 表达式](../../source_zh_cn/enum_and_pattern_match/if_let.html)
	7. [**6\.7\.** while\-let 表达式](../../source_zh_cn/enum_and_pattern_match/while_let.html)
	8. [**6\.8\.** 其他使用模式的地方](../../source_zh_cn/enum_and_pattern_match/other.html)
13. **7\.** 类和接口❱
14. 1. [**7\.1\.** 类](../../source_zh_cn/class_and_interface/class.html)
	2. [**7\.2\.** 接口](../../source_zh_cn/class_and_interface/interface.html)
	3. [**7\.3\.** 属性](../../source_zh_cn/class_and_interface/prop.html)
	4. [**7\.4\.** 子类型关系](../../source_zh_cn/class_and_interface/subtype.html)
	5. [**7\.5\.** 类型转换](../../source_zh_cn/class_and_interface/typecast.html)
15. **8\.** 泛型❱
16. 1. [**8\.1\.** 泛型概述](../../source_zh_cn/generic/generic_overview.html)
	2. [**8\.2\.** 泛型函数](../../source_zh_cn/generic/generic_function.html)
	3. [**8\.3\.** 泛型接口](../../source_zh_cn/generic/generic_interface.html)
	4. [**8\.4\.** 泛型类](../../source_zh_cn/generic/generic_class.html)
	5. [**8\.5\.** 泛型结构体](../../source_zh_cn/generic/generic_struct.html)
	6. [**8\.6\.** 泛型枚举](../../source_zh_cn/generic/generic_enum.html)
	7. [**8\.7\.** 泛型类型的子类型关系](../../source_zh_cn/generic/generic_subtype.html)
	8. [**8\.8\.** 类型别名](../../source_zh_cn/generic/typealias.html)
	9. [**8\.9\.** 泛型约束](../../source_zh_cn/generic/generic_constraint.html)
17. **9\.** 扩展❱
18. 1. [**9\.1\.** 扩展概述](../../source_zh_cn/extension/extend_overview.html)
	2. [**9\.2\.** 直接扩展](../../source_zh_cn/extension/direct_extension.html)
	3. [**9\.3\.** 接口扩展](../../source_zh_cn/extension/interface_extension.html)
	4. [**9\.4\.** 访问规则](../../source_zh_cn/extension/access_rules.html)
19. **10\.** Collection 类型❱
20. 1. [**10\.1\.** 基础 Collection 类型概述](../../source_zh_cn/Collections/collection_overview.html)
	2. [**10\.2\.** ArrayList](../../source_zh_cn/Collections/collection_arraylist.html)
	3. [**10\.3\.** HashSet](../../source_zh_cn/Collections/collection_hashset.html)
	4. [**10\.4\.** HashMap](../../source_zh_cn/Collections/collection_hashmap.html)
	5. [**10\.5\.** Iterable 和 Collections](../../source_zh_cn/Collections/collection_iterable_collections.html)
21. **11\.** 包❱
22. 1. [**11\.1\.** 包的概述](../../source_zh_cn/package/package_overview.html)
	2. [**11\.2\.** 包的声明](../../source_zh_cn/package/package_name.html)
	3. [**11\.3\.** 顶层声明的可见性](../../source_zh_cn/package/toplevel_access.html)
	4. [**11\.4\.** 包的导入](../../source_zh_cn/package/import.html)
	5. [**11\.5\.** 程序入口](../../source_zh_cn/package/entry.html)
23. **12\.** 异常处理❱
24. 1. [**12\.1\.** 定义异常](../../source_zh_cn/error_handle/exception_overview.html)
	2. [**12\.2\.** throw 和处理异常](../../source_zh_cn/error_handle/handle.html)
	3. [**12\.3\.** 常见运行时异常](../../source_zh_cn/error_handle/common_runtime_exceptions.html)
	4. [**12\.4\.** 使用 Option](../../source_zh_cn/error_handle/use_option.html)
25. **13\.** 并发编程❱
26. 1. [**13\.1\.** 并发概述](../../source_zh_cn/concurrency/concurrency_overview.html)
	2. [**13\.2\.** 创建线程](../../source_zh_cn/concurrency/create_thread.html)
	3. [**13\.3\.** 访问线程](../../source_zh_cn/concurrency/use_thread.html)
	4. [**13\.4\.** 终止线程](../../source_zh_cn/concurrency/terminal_thread.html)
	5. [**13\.5\.** 同步机制](../../source_zh_cn/concurrency/sync.html)
	6. [**13\.6\.** 线程睡眠指定时长 sleep](../../source_zh_cn/concurrency/sleep.html)
27. **14\.** 基础 I/O 操作❱
28. 1. [**14\.1\.** I/O 流概述](../../source_zh_cn/Basic_IO/basic_IO_overview.html)
	2. [**14\.2\.** I/O 节点流](../../source_zh_cn/Basic_IO/basic_IO_source_stream.html)
	3. [**14\.3\.** I/O 处理流](../../source_zh_cn/Basic_IO/basic_IO_process_stream.html)
29. **15\.** 网络编程❱
30. 1. [**15\.1\.** 网络编程概述](../../source_zh_cn/Net/net_overview.html)
	2. [**15\.2\.** Socket 编程](../../source_zh_cn/Net/net_socket.html)
	3. [**15\.3\.** Http 编程](../../source_zh_cn/Net/net_http.html)
	4. [**15\.4\.** Websocket 编程](../../source_zh_cn/Net/net_websocket.html)
31. **16\.** 宏❱
32. 1. [**16\.1\.** 宏的简介](../../source_zh_cn/Macro/macro_introduction.html)
	2. [**16\.2\.** Tokens 相关类型和 quote 表达式](../../source_zh_cn/Macro/Tokens_types_and_quote_expressions.html)
	3. [**16\.3\.** 语法节点](../../source_zh_cn/Macro/sytax_node.html)
	4. [**16\.4\.** 宏的实现](../../source_zh_cn/Macro/implementation_of_macros.html)
	5. [**16\.5\.** 编译、报错与调试](../../source_zh_cn/Macro/compiling_error_reporting_and_debugging.html)
	6. [**16\.6\.** 宏包定义和导入](../../source_zh_cn/Macro/defining_and_importing_macro_package.html)
	7. [**16\.7\.** 内置编译标记](../../source_zh_cn/Macro/builtin_compilation_flags.html)
	8. [**16\.8\.** 实用案例](../../source_zh_cn/Macro/pratical_case.html)
33. **17\.** 反射和注解❱
34. 1. [**17\.1\.** 动态特性](../../source_zh_cn/reflect_and_annotation/dynamic_feature.html)
	2. [**17\.2\.** 注解](../../source_zh_cn/reflect_and_annotation/anno.html)
35. **18\.** 跨语言互操作❱
36. 1. [**18\.1\.** 仓颉\-C 互操作](../../source_zh_cn/FFI/cangjie-c.html)
	2. [**18\.2\.** 仓颉\-Python 互操作](../../source_zh_cn/FFI/cangjie-python.html)
37. **19\.** 编译和构建❱
38. 1. [**19\.1\.** cjc 使用](../../source_zh_cn/Compile-And-Build/cjc_usage.html)
	2. [**19\.2\.** cjpm 介绍](../../source_zh_cn/Compile-And-Build/cjpm_usage.html)
	3. [**19\.3\.** 条件编译](../../source_zh_cn/Compile-And-Build/conditional_compilation.html)
39. **20\.** 附录❱
40. 1. [**20\.1\.** cjc 编译选项](../../source_zh_cn/Appendix/compile_options.html)
	2. [**20\.2\.** Linux 版本工具链的支持与安装](../../source_zh_cn/Appendix/linux_toolchain_install.html)
	3. [**20\.3\.** runtime 环境变量使用手册](../../source_zh_cn/Appendix/runtime_env.html)
	4. [**20\.4\.** 关键字](../../source_zh_cn/Appendix/keyword.html)
	5. [**20\.5\.** 操作符](../../source_zh_cn/Appendix/operator.html)
	6. [**20\.6\.** 操作符函数](../../source_zh_cn/Appendix/operator_function.html)
	7. [**20\.7\.** TokenKind 类型](../../source_zh_cn/Appendix/tokenkind_type.html)




















* Light
* Rust
* Coal
* Navy
* Ayu






仓颉语言用户指南
========




















[HashSet](#hashset)
===================


使用 HashSet 类型需要导入 collection 包：




```
import std.collection.*

```

我们可以使用 HashSet 类型来构造只拥有不重复元素的 Collection。


仓颉使用 `HashSet<T>` 表示 HashSet 类型，T 表示 HashSet 的元素类型，T 必须是实现了 Hashable 和 `Equatable<T>` 接口的类型，例如数值或 String。



```
var a: HashSet<Int64> = ... // HashSet whose element type is Int64
var b: HashSet<String> = ... // HashSet whose element type is String

```

元素类型不相同的 HashSet 是不相同的类型，所以它们之间不可以互相赋值。


因此以下例子是不合法的。



```
b = a // Type mismatch

```

仓颉中可以使用构造函数的方式构造一个指定的 HashSet。




```
let a = HashSet<String>() // Created an empty HashSet whose element type is String
let b = HashSet<String>(100) // Created a HashSet whose capacity is 100
let c = HashSet<Int64>([0, 1, 2]) // Created a HashSet whose element type is Int64, containing elements 0, 1, 2
let d = HashSet<Int64>(c) // Use another Collection to initialize a HashSet
let e = HashSet<Int64>(10, {x: Int64 => (x * x)}) // Created a HashSet whose element type is Int64 and size is 10. All elements are initialized by specified rule function

```

[访问 HashSet 成员](#访问-hashset-成员)
-------------------------------


当我们需要对 HashSet 的所有元素进行访问时，可以使用 for\-in 循环遍历 HashSet 的所有元素。


需要注意的是，HashSet 并不保证按插入元素的顺序排列，因此遍历的顺序和插入的顺序可能不同。




```
import std.collection.*

main() {
    let mySet = HashSet<Int64>([0, 1, 2])
    for (i in mySet) {
        println("The element is ${i}")
    }
}

```

编译并执行上面的代码，有可能会输出：



```
The element is 0
The element is 1
The element is 2

```

当我们需要知道某个 HashSet 包含的元素个数时，可以使用 size 属性获得对应信息。




```
import std.collection.*

main() {
    let mySet = HashSet<Int64>([0, 1, 2])
    if (mySet.size == 0) {
        println("This is an empty hashset")
    } else {
        println("The size of hashset is ${mySet.size}")
    }
}

```

编译并执行上面的代码，会输出：



```
The size of hashset is 3

```

当我们想判断某个元素是否被包含在某个 HashSet 中时，可以使用 contains 函数。如果该元素存在会返回 true，否则返回 false。




```
let mySet = HashSet<Int64>([0, 1, 2])
let a = mySet.contains(0) // a == true
let b = mySet.contains(-1) // b == false

```

[修改 HashSet](#修改-hashset)
-------------------------


HashSet 是一种可变的引用类型，HashSet 类型提供了添加元素、删除元素的功能。


HashSet 的可变性是一个非常有用的特征，我们可以让同一个 HashSet 实例的所有引用都共享同样的元素，并且对它们统一进行修改。


如果需要将单个元素添加到 HashSet 的末尾，请使用 put 函数。如果希望同时添加多个元素，可以使用 putAll 函数，这个函数可以接受另一个相同元素类型的 Collection 类型（例如 Array）。当元素不存在时，put 函数会执行添加的操作，当 HashSet 中存在相同元素时，put 函数将不会有效果。




```
let mySet = HashSet<Int64>()
mySet.put(0) // mySet contains elements 0
mySet.put(0) // mySet contains elements 0
mySet.put(1) // mySet contains elements 0, 1
let li = [2, 3]
mySet.putAll(li) // mySet contains elements 0, 1, 2, 3

```

HashSet 是引用类型，HashSet 在作为表达式使用时不会拷贝副本，同一个 HashSet 实例的所有引用都会共享同样的数据。


因此对 HashSet 元素的修改会影响到该实例的所有引用。




```
let set1 = HashSet<Int64>([0, 1, 2])
let set2 = set1
set2.put(3)
// set1 contains elements 0, 1, 2, 3
// set2 contains elements 0, 1, 2, 3

```

从 HashSet 中删除元素，可以使用 remove 函数，需要指定删除的元素。




```
let mySet = HashSet<Int64>([0, 1, 2, 3])
mySet.remove(1) // mySet contains elements 0, 2, 3

```






























