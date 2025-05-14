





调试工具 \- 仓颉语言工具使用指南




































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




















[调试工具](#调试工具)
=============


[功能简介](#功能简介)
-------------


`cjdb` 是一款基于 `lldb` 开发的仓颉程序命令行调试工具，为仓颉开发者提供程序调试的能力，特性列表如下：


* 调试器启动被调程序（launch，attach）
* 源码断点/函数断点/条件断点（breakpoint）
* 观察点（watchpoint）
* 程序运行（s，n， finish， continue）
* 变量查看/变量修改（print，set）
* 仓颉线程查看（cjthread）


[使用说明](#使用说明)
-------------


### [调试器加载被调程序（launch，attach）](#调试器加载被调程序launchattach)


#### [launch 方式加载被调程序](#launch-方式加载被调程序)


launch 方式有两种加载方式，如下：


\<1\> 启动调试器的同时加载被调程序。



```
~/0901/cangjie_test$ cjdb test
(cjdb) target create "test"
Current executable set to '/0901/cangjie-linux-x86_64-release/bin/test' (x86_64).
(cjdb)

```

\<2\> 先启动调试器，然后通过 file 命令加载被调程序。



```
~/0901/cangjie_test$ cjdb
(cjdb) file test
Current executable set to '/0901/cangjie/test' (x86_64).
(cjdb)

```

#### [attach 方式调试被调程序](#attach-方式调试被调程序)


针对正在运行的程序，支持 attach 方式调试被调程序，如下：



```
~/0901/cangjie-linux-x86_64-release/bin$ cjdb
(cjdb) attach 15325
Process 15325 stopped
* thread #1, name = 'test', stop reason = signal SIGSTOP
    frame #0: 0x00000000004014cd test`default.main() at test.cj:7:9
   4      var a : Int32 = 12
   5      a = a + 23
   6      while (true) {
-> 7        a = 1
   8      }
   9      a = test(10, 34)
   10     return 1
  thread #2, name = 'FinalProcessor', stop reason = signal SIGSTOP
    frame #0: 0x00007f48c12fc065 libpthread.so.0`__pthread_cond_timedwait at futex-internal.h:205
  thread #3, name = 'PoolGC_1', stop reason = signal SIGSTOP
    frame #0: 0x00007f48c12fbad3 libpthread.so.0`__pthread_cond_wait at futex-internal.h:88
  thread #4, name = 'MainGC', stop reason = signal SIGSTOP
    frame #0: 0x00007f48c12fc065 libpthread.so.0`__pthread_cond_timedwait at futex-internal.h:205
  thread #5, name = 'schmon', stop reason = signal SIGSTOP
    frame #0: 0x00007f48c0fe17a0 libc.so.6`__GI___nanosleep(requested_time=0x00007f48a8ffcb70, remaining=0x0000000000000000) at nanosleep.c:28

Executable module set to "/0901/cangjie-linux-x86_64-release/bin/test".
Architecture set to: x86_64-unknown-linux-gnu.

```

### [设置断点](#设置断点)


#### [设置源码断点](#设置源码断点)



```
breakpoint set --file test.cj --line line_number

```

`--line` 指定行号。
`--file` 指定文件。
对于单文件，只需要输入行号即可，对于多文件，需要加上文件名字。
`b test.cj:4`是`breakpoint set --file test.cj --line 4`的缩写。


例：**breakpoint set \-\-line 2**



```
(cjdb) b 2
Breakpoint 1: where = test`default.main() + 13 at test.cj:4:3, address = 0x0000000000401491
(cjdb) b test.cj : 4
Breakpoint 2: where = test`default.main() + 13 at test.cj:4:3, address = 0x0000000000401491
(cjdb)

```

#### [设置函数断点](#设置函数断点)



```
breakpoint set --name function_name

```

`--name` 指定要设置函数断点的函数名。
`b test`是`breakpoint set --name test`的缩写。


例：**breakpoint set \-\-method test**



```
(cjdb) b test
Breakpoint 3: where = test`default.test(int, int) + 19 at test.cj:12:10, address = 0x0000000000401547
(cjdb)

```

#### [设置条件断点](#设置条件断点)



```
breakpoint set --file xx.cj --line line_number --condition expression

```

`--file` 指定文件。
`--condition` 指定条件，支持 `==, !=, >, <, >=, <=, and, or`。
缩写是 `b -f test.cj -l 4 -c a==12`。


例：**breakpoint set \-\-file test.cj \-\-line 4 \-\-condition a\=\=12**



```
(cjdb) breakpoint set --file test.cj --line 4 --condition a==12
Breakpoint 2: where = main`default::main() + 60 at test.cj:4:9, address = 0x00005555555b62d0
(cjdb) c
Process 3128551 resuming
Process 3128551 stopped
* thread #1, name = 'schmon', stop reason = breakpoint 2.1
    frame #0: 0x00005555555b62d0 main`default::main() at test.cj:4:9
   1    main(): Int64 {
   2
   3        var a : Int32 = 12
-> 4        a = a + 23
   5        return 1
   6    }

```

仅支持基础类型变量条件设置（Int8，Int16，Int32，Int64，UInt8，UInt16，UInt32，UInt64，Float32，Float64，Bool，Rune），暂时不支持 Float16 变量类型条件设置。


### [设置观察点](#设置观察点)



```
watchpoint set variable -w read variable_name

```

`-w` 指定观察点点类型，有 `read、write、read_write` 三种类型。
`wa s v`是`watchpoint set variable`的缩写。


例：**watchpoint set variable \-w read a**



```
(cjdb) wa s v -w read a
Watchpoint created: Watchpoint 1: addr = 0x7fffddffed70 size = 8 state = enabled type = r
    declare @ 'test.cj:27'
    watchpoint spec = 'a'
    new value: 10
(cjdb)

```

只支持在基础类型设置观察点。


### [启动被调程序](#启动被调程序)


执行 `r（run）`命令



```
(cjdb) r
Process 2884 launched: '/0901/cangjie-linux-x86_64-release/bin/test' (x86_64)
Process 2884 stopped
* thread #1, name = 'test', stop reason = breakpoint 1.1 2.1
    frame #0: 0x0000000000401491 test`default.main() at test.cj:4:3
   1
   2    main(): Int64 {
   3
-> 4        var a : Int32 = 12
   5        a = a + 23
   6        a = test(10, 34)
   7

```

可以看到程序停到初始化断点处。


### [执行](#执行)


#### [单步执行，`n（next）`](#单步执行nnext)



```
(cjdb) n
Process 2884 stopped
* thread #1, name = 'test', stop reason = step over
    frame #0: 0x0000000000401498 test`default.main() at test.cj:5:7
   2    main(): Int64 {
   3
   4       var a : Int32 = 12
-> 5       a = a + 23
   6       a = test(10, 34)
   7       return 1
   8    }
(cjdb)

```

从第 4 行运行到第 5 行。


#### [执行到下一个断点停止，`c（continue）`](#执行到下一个断点停止ccontinue)



```
(cjdb) c
Process 2884 resuming
Process 2884 stopped
* thread #1, name = 'test', stop reason = breakpoint 3.1
    frame #0: 0x0000000000401547 test`default.test(a=10, b=34) at test.cj:12:10
   9
   10   func test(a : Int32, b : Int32) : Int32 {
   11
-> 12     return a + b
   13   }
   14
(cjdb)

```

#### [函数进入，`s`](#函数进入s)



```
(cjdb) n
Process 5240 stopped
* thread #1, name = 'test', stop reason = step over
    frame #0: 0x00000000004014d8 test`default.main() at test.cj:6:7
   3
   4      var a : Int32 = 12
   5      a = a + 23
-> 6      a = test(10, 34)
   7      return 1
   8    }
   9
(cjdb) s
Process 5240 stopped
* thread #1, name = 'test', stop reason = step in
    frame #0: 0x0000000000401547 test`default.test(a=10, b=34) at test.cj:12:10
   9
   10   func test(a : Int32, b : Int32) : Int32 {
   11
-> 12     return a + b
   13   }
   14
(cjdb)

```

当遇到函数调用的时候，可通过`s`命令进入到被调函数的定义声明处。


#### [函数退出，`finish`](#函数退出finish)



```
(cjdb) s
Process 5240 stopped
* thread #1, name = 'test', stop reason = step in
    frame #0: 0x0000000000401547 test`default.test(a=10, b=34) at test.cj:12:10
   9
   10   func test(a : Int32, b : Int32) : Int32 {
   11
-> 12     return a + b
   13   }
   14
(cjdb) finish
Process 5240 stopped
* thread #1, name = 'test', stop reason = step out

Return value: (int) $0 = 44

    frame #0: 0x00000000004014dd test`default.main() at test.cj:6:7
   3
   4      var a : Int32 = 12
   5      a = a + 23
-> 6      a = test(10, 34)
   7      return 1
   8    }
   9
(cjdb)

```

执行`finish`命令，退出当前函数，返回到上一个调用栈函数。


### [变量查看](#变量查看)


#### [查看局部变量，`locals`](#查看局部变量locals)



```
(cjdb) locals
(Int32) a = 12
(Int64) b = 68
(Int32) c = 13
(Array<Int64>) array = {
  [0] = 2
  [1] = 4
  [2] = 6
}
(pkgs.Rec) newR2 = {
  age = 5
  name = "string"
}
(cjdb)

```

当调试器停到程序的某个位置时，使用`locals`可以看到程序当前位置所在函数生命周期范围内，所有的局部变量，只能正确查看当前位置已经初始化的变量，当前未初始化的变量无法正确查看。


#### [查看单个变量，`print variable_name`](#查看单个变量print-variable_name)


例：**print b**



```
(cjdb) print b
(Int64) $0 = 110
(cjdb)

```

使用`print`命令(简写`p`)，后跟要查看具体变量的名字。


##### [查看 String 类型变量](#查看-string-类型变量)



```
(cjdb) print newR2.name
(String) $0 = "string"
(cjdb)

```

##### [查看 struct、class 类型变量](#查看-structclass-类型变量)



```
(cjdb) print newR2
(pkgs.Rec) $0 = {
  age = 5
  name = "string"
}
(cjdb)

```

##### [查看数组](#查看数组)



```
(cjdb) print array
(Array<Int64>) $0 = {
  [0] = 2
  [1] = 4
  [2] = 6
  [3] = 8
}
(cjdb) print array[1..3]
(Array<Int64>) $1 = {
  [1] = 4
  [2] = 6
}
(cjdb)

```

支持查看基础类型（Int8，Int16，Int32，Int64，UInt8，UInt16，UInt32，UInt64，Float16，Float32，Float64，Bool，Unit，Rune）。


支持范围查看，区间 `[start..end)` 为左闭右开区间，暂不支持逆序。


对于非法区间或对非数组类型查看区间会有报错提示。



```
(cjdb) print array
(Array<Int64>) $0 = {
  [0] = 0
  [1] = 1
}
(cjdb) print array[1..3]
error: unsupported expression
(cjdb) print array[0][0]
error: unsupported expression

```

##### [查看 CString 类型变量](#查看-cstring-类型变量)



```
(cjdb) p cstr
(cro.CString) $0 = "abc"
(cjdb) p cstr
(cro.CString) $1 = null

```

#### [查看全局变量，`globals`](#查看全局变量globals)



```
(cjdb) globals
(Int64) pkgs.Rec.g_age = 100
(Int64) pkgs.g_var = 123
(cjdb)

```

使用 `print` 命令查看单个全局变量时，不支持 `print` \+ 包名 \+ 变量名查看全局变量，仅支持 `print` \+ 变量名 进行查看，例如查看全局变量 `g_age` 应该用如下命令查看。



```
(cjdb) p g_age
(Int64) $0 = 100
(cjdb)

```

### [变量修改](#变量修改)



```
(cjdb) set a=30
(Int32) $4 = 30
(cjdb)

```

可以使用`set`修改某个局部变量的值，只支持基础数值类型（Int8，Int16，Int32，Int64，UInt8，UInt16，UInt32，UInt64，Float32，Float64）。


对于 `Bool` 类型的变量，可以使用数值 0（false）和非 0（true）进行修改，`Rune` 类型变量，可以使用对应的 `ASCII` 码进行修改。



```
(cjdb) set b = 0
(Bool) $0 = false
(cjdb) set b = 1
(Bool) $1 = true
(cjdb) set c = 0x41
(Rune) $2 = 'A'
(cjdb)

```

如果修改的值为非数值，或是超出变量的范围，则会报错提示。



```
(cjdb) p c
(Rune) $0 = 'A'
(cjdb) set c = 'B'
error: unsupported expression
(cjdb) p b
(Bool) $1 = false
(cjdb) set b = true
error: unsupported expression
(cjdb) p u8
(UInt8) $3 = 123
(cjdb) set u8 = 256
error: unsupported expression
(cjdb) set u8 = -1
error: unsupported expression

```

### [仓颉线程查看](#仓颉线程查看)


支持查看仓颉线程 `id` 状态以及 `frame` 信息，暂不支持仓颉线程切换。


#### [查看所有仓颉线程](#查看所有仓颉线程)



```
(cjdb) cjthread list
cjthread id: 1, state: running name: cjthread1
    frame #0: 0x000055555557c140 main`ab::main() at varray.cj:16:1
cjthread id: 2, state: pending name: cjthread2
    frame #0: 0x00007ffff7d8b9d5 libcangjie-runtime.so`CJ_CJThreadPark + 117
(cjdb)

```

#### [查看仓颉线程调用栈](#查看仓颉线程调用栈)


查看指定仓颉线程调用栈。



```
(cjdb) cjthread backtrace 1
cjthread #1 state: pending name: cangjie
  frame #0: 0x00007ffff7d8b9d5 libcangjie-runtime.so`CJ_CJThreadPark + 117
  frame #1: 0x00007ffff7d97252 libcangjie-runtime.so`CJ_TimerSleep + 66
  frame #2: 0x00007ffff7d51b5d libcangjie-runtime.so`CJ_MRT_FuncSleep + 33
  frame #3: 0x0000555555591031 main`std/sync::sleep(std/time::Duration) + 45
  frame #4: 0x0000555555560941 main`default::lambda.0() at complex.cj:9:3
  frame #5: 0x000055555555f68b main`default::std/core::Future<Unit>::execute(this=<unavailable>) at future.cj:124:35
  frame #6: 0x00007ffff7d514f1 libcangjie-runtime.so`___lldb_unnamed_symbol1219 + 7
  frame #7: 0x00007ffff7d4dc52 libcangjie-runtime.so`___lldb_unnamed_symbol1192 + 114
  frame #8: 0x00007ffff7d8b09a libcangjie-runtime.so`CJ_CJThreadEntry + 26
(cjdb)

```

`cjthread backtrace 1` 命令中 `1` 为指定的 `cjthread ID`。


[注意事项](#注意事项)
-------------


1. 进行调试的程序必须已经经过编译的 `debug` 版本，如使用下述命令编译的程序文件：



```
cjc -g test.cj -o test

```
2. 开发者定义了一个泛型对象后，调试单步进入该对象的 `init` 函数时，栈信息显示的函数名称会包含两个包名，一个是实例化该泛型对象所在的包名，另外一个是泛型定义所在的包名。



```
* thread #1, name = 'main', stop reason = step in
    frame #0: 0x0000000000404057 main`default.p1.Pair<String, Int64>.init(a="hello", b=0) at a.cj:21:9
   18       let x: T
   19       let y: U
   20       public init(a: T, b: U) {
-> 21           x = a
   22           y = b
   23       }

```
3. 对于 `Enum` 类型的显示, 如果该 `Enum` 的构造器存在参数的情况下, 会显示成如下样式:



```
enum E {
    Ctor(Int64, String) | Ctor
}

main() {
    var temp = E.Ctor(10, "String")
    0
}

========================================
(cjdb) p temp
(E) $0 = Ctor {
  arg_1 = 10
  arg_2 = "String"
}

```

其中 `arg_x` 并非是一个可打印的成员变量，`Enum` 内实际并没有命名为 `arg_x` 的成员变量。
4. 仓颉 `CJDB` 基于 `lldb` 构建, 所以支持 `lldb` 原生基础功能，详情见 [lldb 官方文档](https://lldb.llvm.org)。


[FAQ](#faq)
-----------


1. `docker` 环境下 cjdb 报 `error: process launch failed: 'A' packet returned an error: 8`。



```
root@xxx:/home/cj/cangjie-example#cjdb ./hello
(cjdb) target create "./hello"
Current executable set to '/home/cj/cangjie-example/hello' (x86_64).
(cjdb) b main
Breakpoint 1: 2 locations.
(cjdb) r
error: process launch failed: 'A' packet returned an error: 8
(cjdb)

```

问题原因：`docker` 创建容器时，未开启 SYS\_PTRACE 权限。


解决方案：创建新容器时加上如下选项，并且删除已存在容器。



```
docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --security-opt apparmor=unconfined

```
2. cjdb 报 `stop reason = signal XXX`。



```
Process 32491 stopped
* thread #2, name = 'PoolGC_1', stop reason = signal SIGABRT
    frame #0: 0x00007ffff450bfb7 lib.so.6`__GI_raise(sig=2) at raise.c:51

```

问题原因：程序持续产生 `SIGABRT` 信号触发调试器暂停。


解决方案：可执行如下命令屏蔽此类信号。



```
(cjdb) process handle --pass true --stop false --notify true SIGBUS
NAME         PASS   STOP   NOTIFY
===========  =====  =====  ======
SIGBUS       true   false  true
(cjdb)

```
3. cjdb 没有捕获 `SIGSEGV` 信号。


问题原因：cjdb 在启动时会默认不捕获 `SIGSEGV` 信号。


解决方案：开发者如果需要在调试时捕获此信号，可使用如下命令重新设置。



```
(cjdb)process handle -p true -s true -n true SIGSEGV
NAME         PASS   STOP   NOTIFY
===========  =====  =====  ======
SIGSEGV      true   true   true
(cjdb)

```
4. cjdb 无法通过 `next/s` 等调试指令进入 `catch` 块。


问题原因：仓颉使用 `LLVM` 的 `LandingPad` 机制的来实现异常处理, 而该机制无法通过控制流明确 try 语句块中的抛出的异常会由哪一个 catch 语句块捕获，所以无法明确执行的代码。类似问题在 clang\+\+ 中也存在。


解决方案：开发者如果需要调试 `catch` 块中的代码，可以在 `catch` 中打上断点。



```
(cjdb) b 31
Breakpoint 2: where = main`default::test(Int64) + 299 at a.cj:31:18, address = 0x000055555557caff
(cjdb) n
Process 1761640 stopped
* thread #1, name = 'schmon', stop reason = breakpoint 2.1
    frame #0: 0x000055555557caff main`default::test(a=0) at a.cj:31:18
  28      s = 12/a
  29    } catch (e:Exception) {
  30
->31     error_result = e.toString()
  32     println(error_result)
  33    }
  34    s
(cjdb)

```
5. `windows` 平台表达式计算报错 `Expression can't be run, because there is no JIT compiled function` 。


问题原因：部分表达式暂不支持在 `windows` 平台使用，主要涉及类型转换表达式，赋值表达式，函数调用，自定义类型变量查看， `collection` 类型变量查看。


[附录](#附录)
---------



> **cjdb 特有命令**




| 命令 | 简写 | 简要描述 | 参数说明 |
| --- | --- | --- | --- |
| globals | 无 | 查看全局变量 | 无参数 |
| locals | 无 | 查看局部变量 | 无参数 |
| print | p | 查看单个变量 | 参数为变量名称，例 print variable\_name |
| set | 无 | 修改变量 | 参数为表达式，例 set variable\_name \= value |
| finish | 无 | 函数退出 | 无参数 |
| cjthread | 无 | 轻量级线程查看 | 无参数 |
































