





runtime 环境变量使用手册 \- 仓颉语言用户指南




































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




















[runtime 环境变量使用手册](#runtime-环境变量使用手册)
=====================================


本节介绍 `runtime`（运行时）所提供的环境变量。


在 Linux shell 与 macOS shell 中，您可以使用以下方式设置仓颉运行时提供的环境变量：



```
$ export VARIABLE=value

```

在 Windows cmd 中，您可以使用以下方式设置仓颉运行时提供的环境变量：



```
> set VARAIBLE=value

```

本节后续的示例都为 Linux shell 中的设置方式，若与您的运行平台不符，请根据您的运行平台选择合适的环境变量设置方式。


[runtime 初始化可选配置](#runtime-初始化可选配置)
-----------------------------------


注意：


1. 所有整型参数为 Int64 类型，浮点型参数为 Float64 类型;
2. 所有参数如果未显式规定最大值，默认隐式最大值为该类型最大值;
3. 所有参数若超出范围则设置无效，自动使用默认值。


### [`cjHeapSize`](#cjheapsize)


指定仓颉堆的最大值，支持单位为 kb（KB）、mb（MB）、gb（GB），支持设置范围为\[4MB, 系统物理内存]，超出范围的设置无效，仍旧使用默认值。若物理内存低于 1GB，默认值为 64 MB，否则为 256 MB。


例如：



```
export cjHeapSize=32GB

```

### [`cjRegionSize`](#cjregionsize)


指定 region 分配器 thread local buffer 的大小，支持设置范围为\[4, 2048]，单位为 KB，超出范围的设置无效，仍旧使用默认值。默认值为 1024 KB。


例如：



```
export cjRegionSize=1024

```

### [`cjExemptionThreshold`](#cjexemptionthreshold)


指定存活 region 的水线值，取值 (0,1]，该值与 region 的大小相乘，若 region 中存活对象数量大于相乘后的值，则该 region 不会被回收（其中死亡对象继续占用内存）。该值指定得越大，region 被回收的概率越大，堆中的碎片空间就越少，但频繁回收 region 也会影响性能。超出范围的设置无效，仍旧使用默认值。默认值为 1024 KB。默认值为 0\.8，即 80%。


例如：



```
export cjExemptionThreshold=0.8

```

### [`cjHeapUtilization`](#cjheaputilization)


指定仓颉堆的利用率，该参数用于 GC 后更新堆水线的参考依据之一，取值 (0, 1]，堆水线是指当堆中对象总大小达到水线值时则进行 GC。该参数指定越小，则更新后的堆水线会越高，则触发 GC 的概率会相对变低。超出范围的设置无效，仍旧使用默认值。默认值为 0\.8，即 80%。


例如：



```
export cjHeapUtilization=0.8

```

### [`cjHeapGrowth`](#cjheapgrowth)


指定仓颉堆的增长率，该参数用于 GC 后更新堆水线的参考依据之一，取值必须大于 0。增长率的计算方式为 1 \+ cjHeapGrowth。该参数指定越大，则更新后的堆水线会越高，则触发 GC 的概率会相对变低。默认值为 0\.15，表示增长率为 1\.15。


例如：



```
export cjHeapGrowth=0.15

```

### [`cjAlloctionRate`](#cjalloctionrate)


指定仓颉运行时分配对象的速率，该值必须大于 0，单位为 MB/s，表示每秒可分配对象的数量。默认值为 10240，表示每秒可分配 10240 MB 对象。


例如：



```
export cjAlloctionRate=10240

```

### [`cjAlloctionWaitTime`](#cjalloctionwaittime)


指定仓颉运行时分配对象时的等待时间，该值必须大于 0，支持单位为 s、ms、us、ns，推荐单位为纳秒（ns）。若本次分配对象距离上一次分配对象的时间间隔小于此值，则将等待。默认值为 1000 ns。


例如：



```
export cjAlloctionWaitTime=1000ns

```

### [`cjGCThreshold`](#cjgcthreshold)


指定仓颉堆的参考水线值，支持单位为 kb（KB）、mb（MB）、gb（GB）, 取值必须为大于 0 的整数。当仓颉堆大小超过该值时，触发 GC。默认值为堆大小。


例如：



```
export cjGCThreshold=20480KB

```

### [`cjGarbageThreshold`](#cjgarbagethreshold)


当 GC 发生时，如果 region 中死亡对象所占比率大于此环境变量，此 region 会被放入回收候选集中，后续可被回收（如果受到其它策略影响也可能不被回收），默认值为 0\.5，无量纲，支持设置的区间为\[0\.0, 1\.0]。


例如：



```
export cjGarbageThreshold=0.5

```

### [`cjGCInterval`](#cjgcinterval)


指定 2 次 GC 的间隔时间值，取值必须大于 0，支持单位为 s、ms、us、ns，推荐单位为毫秒（ms）。若本次 GC 距离上次 GC 的间隔小于此值，则本次 GC 将被忽略。该参数可以控制 GC 的频率。默认值为 150 ms。


例如：



```
export cjGCInterval=150ms

```

### [`cjBackupGCInterval`](#cjbackupgcinterval)


指定 backup GC 的间隔值，取值必须大于 0，支持单位为 s、ms、us、ns，推荐单位为秒（s），当仓颉运行时在该参数设定时间内未触发 GC，则触发一次 backup GC。默认值为 240 秒，即 4 分钟。


例如：



```
export cjBackupGCInterval=240s

```

### [`cjGCThreads`](#cjgcthreads)


指定影响 GC 线程数的因数，取值必须大于 0。GC 线程数的计算方式为：(系统支持的并发线程数 / cjGCThreads) \- 1。默认值为 8。


例如：



```
export cjGCThreads=8

```

### [`cjProcessorNum`](#cjprocessornum)


指定仓颉线程的最大并发数，支持设置范围为 (0, CPU 核数 \* 2]，超出范围的设置无效，仍旧使用默认值。调用系统 API 获取 cpu 核数，若成功默认值为 cpu 核数，否则默认值为 8。


例如：



```
export cjProcessorNum=2

```

### [`cjStackSize`](#cjstacksize)


指定仓颉线程的栈大小，支持单位为 kb（KB）、mb（MB）、gb（GB），支持设置范围为 Linux 平台下\[64KB, 1GB]，Windows 平台下\[128KB, 1GB]，超出范围的设置无效，仍旧使用默认值。Linux 平台下默认值为 64KB，Windows 平台下为 128KB。


例如：



```
export cjStackSize=100kb

```

### [运维日志可选配置](#运维日志可选配置)


#### [`MRT_LOG_FILE_SIZE`](#mrt_log_file_size)


指定 runtime 运维日志的文件大小，默认值为 10 MB，支持单位为 kb（KB）、mb（MB）、gb（GB），设置值需大于 0。


日志大小超过该值时，会重新回到日志开头进行打印。


最终生成日志大小略大于 MRT\_LOG\_FILE\_SIZE。


例如：



```
export MRT_LOG_FILE_SIZE=100kb

```

#### [`MRT_LOG_PATH`](#mrt_log_path)


指定 runtime 运维日志的输出路径，若该环境变量未设置或路径设置失败，则运维日志默认打印到 stdout（标准输出）或 stderr（标准错误）中。


例如：



```
export MRT_LOG_PATH=/home/cangjie/runtime/runtime_log.txt

```

#### [`MRT_LOG_LEVEL`](#mrt_log_level)


指定 runtime 运维日志的最小输出级别，大于等于这个级别的日志会被打印，默认值为 e，支持设置值为\[v\|d\|i\|w\|e\|f\|s]。v（VERBOSE）、d（DEBUGY）、i（INFO）、w（WARNING）、e（ERROR）、f（FATAL）、s（FATAL\_WITHOUT\_ABORT）。


例如：



```
export MRT_LOG_LEVEL=v

```

#### [`MRT_REPORT`](#mrt_report)


指定 runtime GC 日志的输出路径，若该环境变量未设置或路径设置失败，该日志默认不打印。


例如：



```
export MRT_REPORT=/home/cangjie/runtime/gc_log.txt

```

#### [`MRT_LOG_COROUTINE`](#mrt_log_coroutine)


指定 coroutine 日志的输出路径，若该环境变量未设置或路径设置失败，该日志默认不打印。


例如：



```
export MRT_LOG_COROUTINE=/home/cangjie/runtime/coroutine_log.txt

```

#### [`cjHeapDumpOnOOM`](#cjheapdumponoom)


指定是否要在发生堆溢出后输出堆快照文件，默认不开启，支持设置值为\[on\|off]，设定为 on 时开启功能，设定 off 或者其他值不开启功能。


例如：



```
export cjHeapDumpOnOOM=on

```

#### [`cjHeapDumpLog`](#cjheapdumplog)


指定输出堆快照文件的路径，注意指定的路径必须存在，且应用执行者对其具有读写权限。如果不指定，堆快照文件将输出到当前执行目录。


例如：



```
export cjHeapDumpLog=/home/cangjie

```

### [运行环境可选配置](#运行环境可选配置)


#### [`MRT_STACK_CHECK`](#mrt_stack_check)


开启 native stack overflow 检查，默认不开启，支持设置值为 1、true、TRUE 开启功能。


例如：



```
export MRT_STACK_CHECK=true

```

#### [`CJ_SOF_SIZE`](#cj_sof_size)


当 StackOverflowError 发生时，将自动进行异常栈折叠方便用户阅读，折叠后栈帧层数默认值是 32。可以通过配置此环境变量控制折叠栈长度，支持设置为 int 范围内的整数。
CJ\_SOF\_SIZE \= 0，打印所有调用栈；
CJ\_SOF\_SIZE \< 0，从栈底开始打印环境变量配置层数；
CJ\_SOF\_SIZE \> 0，从栈顶开始打印环境变量配置层数；
CJ\_SOF\_SIZE 未配置，默认打印栈顶开始 32 层调用栈；


例如：



```
export CJ_SOF_SIZE=30

```






























