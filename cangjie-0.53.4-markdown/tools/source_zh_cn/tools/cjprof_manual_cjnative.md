





性能分析工具 \- 仓颉语言工具使用指南




































1. [**1\.** IDE 插件使用指南](../../source_zh_cn/IDE/user_manual_community.html)
2. [**2\.** 命令行工具使用指南](../../source_zh_cn/tools/user_manual_cjnative.html)❱
3. 1. [**2\.1\.** 包管理工具](../../source_zh_cn/tools/cjpm_manual_cjnative_community.html)
	2. [**2\.2\.** 调试工具](../../source_zh_cn/tools/cjdb_manual_cjnative.html)
	3. [**2\.3\.** 静态检查工具](../../source_zh_cn/tools/cjlint_manual_community.html)
	4. [**2\.4\.** 格式化工具](../../source_zh_cn/tools/cjfmt_manual.html)
	5. [**2\.5\.** 覆盖率工具](../../source_zh_cn/tools/cjcov_manual_cjnative.html)
	6. [**2\.6\.** 性能分析工具](../../source_zh_cn/tools/cjprof_manual_cjnative.html)
	7. [**2\.7\.** API文档生成工具](../../source_zh_cn/tools/cjdoc_manual.html)




















* Light
* Rust
* Coal
* Navy
* Ayu






仓颉语言工具使用指南
==========




















[性能分析工具](#性能分析工具)
=================


[功能简介](#功能简介)
-------------


`cjprof`（Cangjie Profile）是仓颉语言的性能分析工具，支持以下功能：


* 对仓颉语言程序进行 CPU 热点函数采样，导出采样数据。
* 对热点函数采样数据进行分析，生成 CPU 热点函数统计报告或火焰图。
* 导出仓颉语言应用程序堆内存，并对其进行分析生成分析报告。


目前 `cjprof` 仅支持 `Linux` 系统。


[使用说明](#使用说明)
-------------


通过 `cjprof --help` 即可查看命令使用方法。支持 `record`，`report` 和 `heap` 子命令，分别用于采集 CPU 热点函数信息， 生成 CPU 热点函数报告（包含火焰图）和导出与分析堆内存。



```
cjprof --help
 Usage: cjprof [--help] COMMAND [ARGS]

The supported commands are:
  heap      Dump heap into a dump file or analyze the heap dump file
  record    Run a command and record its profile data into data file
  report    Read profile data file (created by cjprof record) and display the profile


```


> **注意：**
> 
> 
> 由于 `cjprof record` 依赖系统的 `perf` 权限，因此使用需要满足以下两个条件之一：
> 
> 
> * 使用 `root` 用户或 `sudo` 权限执行。
> * 系统的 `perf_event_paranoid` 参数（通过 `/proc/sys/kernel/perf_event_paranoid` 文件）配置为 \-1 。
> 
> 
> 否则可能会出现权限不足的问题。


### [采集 CPU 热点函数信息](#采集-cpu-热点函数信息)


#### [命令](#命令)



```
cjprof record

```

#### [格式](#格式)



```
cjprof record [<options>] [<command>]
cjprof record [<options>] -- <command> [<options>]

```

#### [选项](#选项)


`-f, --freq <freq>` 指定采样频率，单位为赫兹（Hz），即每秒采样次数，默认为 1000 Hz，当指定为 max 或超过系统支持的最大频率时，取系统支持的最大频率。


`-o, --output <file>` 指定采样结束后生成的采样数据文件名，默认为 `cjprof.data` 。


`-p, --pid <pid>` 指定被采样应用程序的进程 ID，当指定 `<command>` 新启动应用程序进行采样时，该选项会被忽略。


#### [示例](#示例)


* 采样正在运行的应用程序。



```
# 以 10000 Hz 的采样频率对正在运行的应用程序（进程号为 12345）进行采样，采样结束后将采样数据生成在当前路径下名为 sample.data 的文件中。
cjprof record -f 10000 -p 12345 -o sample.data

```

* 新启动应用程序并对其进行采样。



```
# 执行当前路径下的 `test` 应用程序，参数为 `arg1 arg2` ，并以系统支持的最大采样频率对其进行采样，采样结束后将采样数据生成在当前路径下名为 `cjprof.data` （默认文件名）的文件中。
cjprof record -f max -- ./test arg1 arg2

```

#### [注意事项](#注意事项)


* 开始采样后，只有被采样程序退出后才会结束采样，如果需要提前结束采样，可以在采样过程中通过按 `Ctrl+C` 主动停止采样。


### [生成 CPU 热点函数报告](#生成-cpu-热点函数报告)


#### [命令](#命令-1)



```
cjprof report

```

#### [格式](#格式-1)



```
cjprof report [<options>]

```

#### [选项](#选项-1)


`-F, --flame-graph` 生成 CPU 热点函数火焰图，而非默认的文本报告。


`-i, --input <file>` 采样数据文件名，默认为 `cjprof.data` 。


`-o, --output <file>` 生成的 CPU 热点函数火焰图文件名，默认为 `FlameGraph.svg`，仅当生成火焰图时才有效。


#### [示例](#示例-1)


* 生成默认的 CPU 热点函数文本报告。



```
# 分析 sample.data 中的采样数据，生成 CPU 热点函数文本报告。
cjprof report -i sample.data

```

* 生成 CPU 热点函数火焰图。



```
# 分析 cjprof.data（默认文件）中的采样数据，生成名为 test.svg 的 CPU 热点函数火焰图。
cjprof report -F -o test.svg

```

#### [报告形式说明](#报告形式说明)


* 文本形式的报告包含函数采样总占比（包含子函数）、函数采样占比（自身）以及函数名（如果没有对应的符号信息则显示为地址）三部分，报告结果以函数采样总占比降序排列。
* 火焰图中的横轴代表采样占比大小，越宽表示采样占比越大，即运行时间越长，纵轴表示调用栈，父函数在下，子函数在上。


### [导出和分析堆内存](#导出和分析堆内存)


#### [命令](#命令-2)



```
cjprof heap

```

#### [格式](#格式-2)



```
cjprof heap [<options>]

```

#### [选项](#选项-2)


`-D, --depth <depth>` 指定对象的引用/被引用关系最大展示深度，默认为 10 层，仅在指定了 `--show-reference` 时才能生效。


`-d, --dump <pid>` 导出仓颉应用程序当前时刻的堆内存，`pid` 为应用程序进程号，当指定为应用程序的子线程号时，同样可导出。


`-i, --input <file>` 指定进行分析的堆内存数据文件名，默认为 `cjprof.data` 。


`-o, --output <file>` 指定导出的堆内存数据文件名，默认为 `cjprof.data` 。


`--show-reference[=<objnames>]` 分析报告中展示对象的引用关系，`objnames` 为需要展示的对象名，多个对象使用 `;` 隔开，不指定时默认展示所有对象。


`--incoming-reference` 展示对象的被引用关系，而非引用关系，需要与 `--show-reference` 配合使用。


`-t, --show-thread` 分析报告中展示仓颉线程栈，以及在栈中引用的对象。


`-V, --verbose` 维测选项，解析堆内存数据文件时打印解析日志。


#### [示例](#示例-2)


* 导出堆内存数据。



```
# 将正在运行的应用程序（进程号为 12345）当前时刻的堆内存导出到当前路径下名为 heap.data 的文件中
cjprof heap -d 12345 -o heap.data

```


> **注意：**
> 
> 
> 导出堆内存时会向进程发送 `SIG_USR1` 信号，在不确定目标进程是否为仓颉应用程序时，需要谨慎操作，否则可能会给目标进程误发送信号导致非预期错误。


* 分析堆内存数据，展示对象信息。



```
# 解析并分析 ~ 目录下名为 heap.data 的堆内存数据文件，展示堆中各激活对象的对象类型名、实例个数、浅堆大小和深堆大小。
cjprof heap -i ~/heap.data

```

执行上述命令的效果如下：



```
Object Type           Objects        Shallow Heap   Retained Heap
====================  =============  =============  =============
AAA                               1            80             400
BBB                               4            32             196
CCC                               2            16              32

```

* 分析堆内存数据，展示仓颉线程栈及对象引用。



```
# 解析并分析当前目录下名为 cjprof.data（默认文件）的堆内存数据文件，展示仓颉线程栈与栈中引用的对象。
cjprof heap --show-thread

```

执行上述命令的效果如下：



```
Object/Stack Frame                   Shallow Heap   Retained Heap
===================================  =============  =============
thread0
  at Func2() (/home/test/test.cj:10)
    <local> AAA @ 0x7f1234567800                80            400
  at Func1() (/home/test/test.cj:20)
    <local> CCC @ 0x7f12345678c0                16             16
  at main (/home/test/test.cj:30)

```

* 分析堆内存数据，展示对象的引用关系。



```
# 解析并分析当前目录下名为 cjprof.data（默认文件）的堆内存数据文件，展示 AAA 和 BBB 类型对象的引用关系。
cjprof heap --show-reference="AAA;BBB"

```

执行上述命令的效果如下：



```
Objects with outgoing references:
Object Type                          Shallow Heap   Retained Heap
===================================  =============  =============
AAA @ 0x7f1234567800                            80            400
  BBB @ 0x7f1234567880                          32             48
    CCC @ 0x7f12345678c0                        16             16
  CCC @ 0x7f12345678e0                          16             16
BBB @ 0x7f1234567880                            32             48
  CCC @ 0x7f12345678c0                          16             16

```

* 分析堆内存数据，展示对象的被引用关系。



```
# 解析并分析当前目录下名为 cjprof.data（默认文件）的堆内存数据文件，展示 CCC 类型对象的被引用关系。
cjprof heap --show-reference="CCC" --incoming-reference

```

执行上述命令的效果如下：



```
Objects with incoming references:
Object Type                          Shallow Heap   Retained Heap
===================================  =============  =============
CCC @ 0x7f12345678c0                            16             16
  BBB @ 0x7f1234567880                          32             48
    AAA @ 0x7f1234567800                        80            400
CCC @ 0x7f12345678e0                            16             16
  AAA @ 0x7f1234567800                          80            400

```

#### [堆内存分析报告说明](#堆内存分析报告说明)


* 对象类型名使用 `RawArray<Byte>[]`，`RawArray<Half>[]`，`RawArray<Word>[]` 和 `RawArray<DWord>[]` 分别表示 1 字节、2 字节、4 字节和 8 字节大小的基础数据类型原始数组。
* 浅堆是指对象自身所占用的堆内存大小，深堆是指对象被垃圾回收后，可以被释放的所有对象（即仅能通过该对象直接或间接引用到的对象）的浅堆大小之和。
* 当对象的引用关系层级超出最大展示深度后，或是存在循环引用出现重复对象后，会使用 `...` 来省略后续引用。































