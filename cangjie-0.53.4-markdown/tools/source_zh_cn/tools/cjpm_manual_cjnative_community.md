





包管理工具 \- 仓颉语言工具使用指南




































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




















[命令行模式编译](#命令行模式编译)
===================


[功能简介](#功能简介)
-------------


`CJPM（Cangjie Package Manager）` 是仓颉语言的官方包管理工具，用于管理、维护仓颉项目的模块系统，并且提供简易统一的编译入口，支持自定义编译命令。


[使用说明](#使用说明)
-------------


通过 `cjpm -h` 即可查看主界面，由几个板块组成，从上到下分别是： 当前命令说明、使用示例（Usage）、支持的可用命令（Available subcommands）、支持的配置项（Available options）、更多提示内容。



```
Cangjie Package Manager

Usage:
  cjpm [subcommand] [option]

Available subcommands:
  init             Init a new cangjie module
  check            Check the dependencies
  update           Update cjpm.lock
  tree             Display the package dependencies in the source code
  build            Compile the current module
  run              Compile and run an executable product
  test             Unittest a local package or module
  clean            Clean up the target directory
  install          Install a cangjie binary
  uninstall        Uninstall a cangjie binary

Available options:
  -h, --help       help for cjpm
  -v, --version    version for cjpm

Use "cjpm [subcommand] --help" for more information about a command.

```

基本的使用操作命令如下所示：



```
cjpm build --help

```

`cjpm` 是主程序的名称， `build` 是当前执行的可用命令， `--help` 是当前可用命令可用的配置项（配置项通常有长和短两种写法，效果相同）。


成功执行后会显示如下结果：



```
Compile a local module and all of its dependencies.

Usage:
  cjpm build [option]

Available options:
  -h, --help                    help for build
  -i, --incremental             enable incremental compilation
  -j, --jobs <N>                the number of jobs to spawn in parallel during the build process
  -V, --verbose                 enable verbose
  -g                            enable compile debug version target
  --coverage                    enable coverage
  --cfg                         enable the customized option 'cfg'
  -m, --member <value>          specify a member module of the workspace
  --target <value>              generate code for the given target platform
  --target-dir <value>          specify target directory
  -o, --output <value>          specify product name when compiling an executable file
  -l, --lint                    enable cjlint code check
  --mock                        enable support of mocking classes in tests
  --skip-script                 disable script 'build.cj'.

```

[命令说明](#命令说明)
-------------


### [init](#init)


`init` 用于初始化一个新的仓颉模块或者工作空间。初始化模块时会默认在当前文件夹创建 `cjpm.toml` 文件，并且新建 `src` 源码文件夹。如果该模块的产物为可执行类型，则会在 `src` 下生成默认的 `main.cj` 文件，并在编译后打印输出 `hello world`。初始化工作空间时仅会创建 `cjpm.toml` 文件，默认会扫描该路径下已有的仓颉模块并添加到 `members` 字段中。若已存在 `cjpm.toml` 文件，或源码文件夹内已存在 `main.cj`，则会跳过对应的文件创建步骤。


`init` 有多个可配置项：


* `--name <value>` 指定新建模块的 `root` 包名，不指定时默认为上一级子文件夹名称
* `--path <value>` 指定新建模块的路径，不指定时默认为当前文件夹
* `--type=<executable|static|dynamic>` 指定新建模块的产物类型，缺省时默认为 `executable`
* `--workspace` 新建一个工作空间配置文件，指定该选项时以上其它选项无效会自动忽略


例如：



```
输入: cjpm init
输出: cjpm init success

输入: cjpm init --name demo --path project
输出: cjpm init success

输入: cjpm init --type=static
输出: cjpm init success

```

### [check](#check)


`check` 命令用于检查项目中所需的依赖项，执行成功将会打印有效的包编译顺序。


`check` 有多个可配置项：


* `-m, --member <value>` 仅可在工作空间下使用，可用于指定单个模块作为检查入口
* `--no-tests` 配置后，测试相关的依赖将不会被打印
* `--skip-script` 配置后，将会跳过构建脚本的编译运行


例如：



```
输入: cjpm check
输出:
The valid serial compilation order is:
    b.pkgA -> b
cjpm check success

输入: cjpm check
输出:
Error: cyclic dependency
b.B -> c.C
c.C -> d.D
d.D -> b.B
输出说明：上述输出中，b.B 代表以 b 为 root 包的模块中的一个名为 b.B 的子包

输入: cjpm check
输出:
Error: can not find the following dependencies
    pro1.xoo
    pro1.yoo
    pro2.zoo

```

### [update](#update)


`update` 用于将 `cjpm.toml` 里的内容更新到 `cjpm.lock`。当 `cjpm.lock` 不存在时，将会生成该文件。`cjpm.lock` 文件记录着 git 依赖的版本号等元信息，用于下次构建使用。


`update` 有以下可配置项：


* `--skip-script` 配置后，将会跳过构建脚本的编译运行



```
输入: cjpm update
输出: cjpm update success

```

### [tree](#tree)


`tree` 命令用于可视化地展示仓颉源码中的包依赖关系。


`tree` 有多个可配置项：


* `-p, --package <value>` 指定某个包为根节点，从而展示它的子依赖包，需要配置的值是包名
* `--invert <value>` 指定某个包为根节点并反转依赖树，从而展示它被哪些包所依赖，需要配置的值是包名
* `--depth <N>` 指定依赖树的最大深度，可选值是非负整数。指定该选项时，默认会以所有包作为根节点。其中，N 的值代表每个依赖树的子节点最大深度
* `--target <value>` 将指定目标平台的依赖项加入分析，并展示依赖关系
* `--no-tests` 排除 `test-dependencies` 字段的依赖项
* `-V, --verbose` 增加包节点的详细信息，包括包名、版本号和包路径
* `--skip-script` 配置后，将会跳过构建脚本的编译运行



```
输入: cjpm tree
输出:
|-- a
    └── a.aoo
        └── a.coo
    └── a.boo
        └── a.coo
|-- a.doo
    └── a.coo
|-- a.eoo
cjpm tree success

输入: cjpm tree --depth 2 -p a
输出:
|-- a
    └── a.aoo
        └── a.coo
    └── a.boo
        └── a.coo
cjpm tree success

输入: cjpm tree --depth 0
输出:
|-- a
|-- a.eoo
|-- a.aoo
|-- a.boo
|-- a.doo
|-- a.coo
cjpm tree success

输入: cjpm tree --invert a.coo --verbose
输出:
|-- a.coo 1.2.0 （.../src/coo）
    └── a.aoo 1.1.0 （.../src/aoo）
            └── a 1.0.0 （.../src）
    └── a.boo 1.1.0 （.../src/boo）
            └── a 1.0.0 （.../src）
    └── a.doo 1.3.0 （.../src/doo）
cjpm tree success

```

### [build](#build)


`build` 用于构建当前仓颉项目，执行该命令前会先检查依赖项，检查通过后调用 `cjc` 进行构建。


`build` 有多个可配置项：


* `-i, --incremental` 用于指定增量编译，默认情况下是全量编译
* `-j, --jobs <N>` 用于指定并行编译的最大并发数，最终的最大并发数取 `N` 和 `2倍 CPU 核数` 的最小值
* `-V, --verbose` 用于展示编译日志
* `-g` 用于生成 `debug` 版本的输出产物
* `--mock` 带有此选项的构建版本中的类可用于在测试中进行 `mock` 测试
* `--coverage` 用于生成覆盖率信息，默认情况下不开启覆盖率功能
* `--cfg` 指定后，能够透传 `cjpm.toml` 中的自定义 `cfg` 选项
* `-m, --member <value>` 仅可在工作空间下使用，可用于指定单个模块作为编译入口
* `--target-dir <value>` 用于指定输出产物的存放路径
* `-o, --output <value>` 用于指定输出可执行文件的名称，默认名称为 `main`（`windows` 下则默认为 `main.exe`）
* `--target <value>` 指定后，可交叉编译代码到目标平台，`cjpm.toml` 中的配置可参考[target](./cjpm_manual_cjnative_community.html#target)章节
* `-l, --lint` 用于在编译时调用仓颉语言静态检查工具进行代码检查
* `--skip-script` 配置后，将会跳过构建脚本的编译运行



> **注意：**
> 
> 
> * `-i, --incremental` 选项仅会开启 `cjpm` 包级别的增量编译。开发者可以在配置文件的 `compile-option` 字段自行透传 `--incremental-compile` 编译选项，从而开启 `cjc` 编译器提供的函数粒度增量功能。
> * `-i, --incremental` 选项目前仅支持基于源码的增量分析。如果导入的库内容有变更，需要开发者重新使用全量方式构建。


编译生成的中间文件默认会存放在 `target` 文件夹，而可执行文件会根据编译模式存放到 `target/release/bin` 或 `target/debug/bin` 文件夹。为了提供可复制的构建，此命令会创建 `cjpm.lock` 文件，该文件包含所有可传递依赖项的确切版本，这些依赖项将用于所有后续构建，需要更新该文件时请使用 `update` 命令。如果有必要保证每个项目参与者都有可复制的构建，那么此文件应提交到版本控制系统中。


例如：



```
输入: cjpm build -V
输出:
compile package module1.package1: cjc --import-path "target/release" --output-dir "target/release/module1" -p "src/package1" --output-type=staticlib -o libmodule1.package1.a
compile package module1: cjc --import-path "target/release" --output-dir "target/release/bin" -p "src" --output-type=exe -o main
cjpm build success

输入: cjpm build
输出: cjpm build success

```

`cjpm build` 配置 `-l, --lint` 选项时，会在编译期间调用仓颉语言静态检查工具 `cjlint` 进行代码检查。如果检查到【要求】级别的代码规范违规，则此次编译会失败，相应检查结果会输出至错误流；检查到【建议】级别的违规时仅会告警，并正常完成编译。`cjlint` 支持检查的代码规则列表及其级别详见 [cjlint 用户手册](./cjlint_manual.html#%E6%94%AF%E6%8C%81%E6%A3%80%E6%9F%A5%E7%9A%84%E8%A7%84%E8%8C%83%E5%88%97%E8%A1%A8%E6%8C%81%E7%BB%AD%E6%96%B0%E5%A2%9E%E4%B8%AD)。


### [run](#run)


`run` 用于运行当前项目构建出的二进制产物。


`run` 有多个可配置项：


* `--name <value>` 指定运行的二进制名称，不指定时默认为 `main`，工作空间下的二进制产物默认存放在 `target/release/bin` 路径下
* `--build-args <value>` 控制 `cjpm` 编译流程的参数
* `--skip-build` 跳过编译流程，直接运行
* `--run-args <value>` 透传参数给本次运行的二进制产物
* `--target-dir <value>` 用于指定运行产物的存放路径
* `-g` 用于运行 `debug` 版本的产物
* `-V, --verbose` 用于展示运行日志
* `--skip-script` 配置后，将会跳过构建脚本的编译运行


例如：



```
输入: cjpm run
输出: cjpm run success

输入: cjpm run -g // 此时会默认执行 cjpm build -i -g 命令
输出: cjpm run success

输入: cjpm run --build-args="-s -j16" --run-args="a b c" -V
输出: cjpm run success

```

### [test](#test)


`test` 用于执行仓颉文件的单元测试用例，并直接打印测试结果，编译产物默认存放在 `target/release/unittest_bin` 文件夹。单元测试用例代码的写法可参考《仓颉编程语言库 API》中 `std.unittest` 库的说明。


该命令可以指定待测试的单包路径（支持指定多个单包，形如 `cjpm test path1 path2`），不指定路径时默认执行模块级别的单元测试。`test` 执行前提是当前项目能够 `build` 编译成功。


模块的单元测试代码结构如下所示，其中 `xxx.cj` 存放该包的源码，`xxx_test.cj` 存放单元测试代码：



```
│   └── src
│       ├── koo
│       │   ├── koo.cj
│       │   └── koo_test.cj
│       ├── zoo
│       │   ├── zoo.cj
│       │   └── zoo_test.cj
│       ├── main.cj
│       └── main_test.cj
│   ├── cjpm.toml

```


```
多模块测试场景
输入: cjpm test
输出:
--------------------------------------------------------------------------------------------------
TM: test, TP: default, time elapsed: 177921 ns, RESULT:
    TCS: TestM, time elapsed: 177921 ns, RESULT:
    [ PASSED ] CASE: sayhi (177921 ns)
    Summary: TOTAL: 1
    PASSED: 1, SKIPPED: 0, ERROR: 0
    FAILED: 0
--------------------------------------------------------------------------------------------------
TM: test, TP: koo, time elapsed: 134904 ns, RESULT:
    TCS: TestK, time elapsed: 134904 ns, RESULT:
    [ PASSED ] CASE: sayhi (134904 ns)
    Summary: TOTAL: 1
    PASSED: 1, SKIPPED: 0, ERROR: 0
    FAILED: 0
--------------------------------------------------------------------------------------------------
TM: pro0, TP: zoo, time elapsed: 132013 ns, RESULT:
    TCS: TestZ, time elapsed: 132013 ns, RESULT:
    [ PASSED ] CASE: sayhi (132013 ns)
    Summary: TOTAL: 1
    PASSED: 1, SKIPPED: 0, ERROR: 0
    FAILED: 0
--------------------------------------------------------------------------------------------------
Project tests finished, time elapsed: 444838 ns, RESULT:
TM: pro0, time elapsed: 132013 ns, RESULT:
    PASSED:
    TP: zoo, time elapsed: 132013 ns
TM: test, time elapsed: 312825 ns, RESULT:
    PASSED:
    TP: koo, time elapsed: 312825 ns
    TP: default, time elapsed: 312825 ns
Summary: TOTAL: 3
    PASSED: 3, SKIPPED: 0, ERROR: 0
    FAILED: 0
--------------------------------------------------------------------------------------------------

cjpm test success

单包测试场景
输入: cjpm test src/koo
输出:
--------------------------------------------------------------------------------------------------
TM: test, TP: koo, time elapsed: 160133 ns, RESULT:
    TCS: TestK, time elapsed: 160133 ns, RESULT:
    [ PASSED ] CASE: sayhi (160133 ns)
    Summary: TOTAL: 1
    PASSED: 1, SKIPPED: 0, ERROR: 0
    FAILED: 0
--------------------------------------------------------------------------------------------------
Project tests finished, time elapsed: 160133 ns, RESULT:
TM: test, time elapsed: 160133 ns, RESULT:
    PASSED:
    TP: koo, time elapsed: 160133 ns
Summary: TOTAL: 1
    PASSED: 1, SKIPPED: 0, ERROR: 0
    FAILED: 0
--------------------------------------------------------------------------------------------------
cjpm test success

多包测试场景
输入: cjpm test src/koo src
输出:
--------------------------------------------------------------------------------------------------
TM: test, TP: koo, time elapsed: 168204 ns, RESULT:
    TCS: TestK, time elapsed: 168204 ns, RESULT:
    [ PASSED ] CASE: sayhi (168204 ns)
    Summary: TOTAL: 1
    PASSED: 1, SKIPPED: 0, ERROR: 0
    FAILED: 0
--------------------------------------------------------------------------------------------------
TM: test, TP: default, time elapsed: 171541 ns, RESULT:
    TCS: TestM, time elapsed: 171541 ns, RESULT:
    [ PASSED ] CASE: sayhi (171541 ns)
    Summary: TOTAL: 1
    PASSED: 1, SKIPPED: 0, ERROR: 0
    FAILED: 0
--------------------------------------------------------------------------------------------------
Project tests finished, time elapsed: 339745 ns, RESULT:
TM: test, time elapsed: 339745 ns, RESULT:
    PASSED:
    TP: koo, time elapsed: 339745 ns
    TP: default, time elapsed: 339745 ns
Summary: TOTAL: 2
    PASSED: 2, SKIPPED: 0, ERROR: 0
    FAILED: 0
--------------------------------------------------------------------------------------------------
cjpm test success

```

`test` 有多个可配置项：


* `--no-run` 用于仅编译单元测试产物
* `--skip-build` 用于仅执行单元测试产物
* `-j, --jobs <N>` 用于指定并行编译的最大并发数，最终的最大并发数取 `N` 和 `2倍 CPU 核数` 的最小值
* `-V, --verbose` 配置项开启后，会输出单元测试的日志
* `-g` 用于生成 `debug` 版本的单元测试产物，此时的产物存放在 `target/debug/unittest_bin` 文件夹
* `--bench` 用于指定只执行 `@bench` 宏修饰用例的测试结果
* `--target-dir <value>` 用于指定单侧产物的存放路径
* `--coverage` 配合 `cjcov` 命令可以生成单元测试的覆盖率报告。使用 `cjpm test --coverage` 统计覆盖率时，源代码中的 `main` 不会再作为程序入口执行，因此会显示为未被覆盖。建议使用 `cjpm test` 之后，不再手写多余的 `main`
* `--cfg` 指定后，能够透传 `cjpm.toml` 中的自定义 `cfg` 选项
* `-m, --member <value>` 仅可在工作空间下使用，可用于指定测试单个模块
* `--target <value>` 指定后，可交叉编译生成目标平台的单元测试结果，`cjpm.toml` 中的配置可参考[target](./cjpm_manual_cjnative_community.md.html#target)章节
* `--filter <value>` 用于过滤测试的子集，`value` 的形式如下所示：
	+ `--filter=*` 匹配所有测试类
	+ `--filter=*.*` 匹配所有测试类的所有测试用例（结果和\*相同）
	+ `--filter=*.*Test,*.*case*` 匹配所有测试类中以 `Test` 结尾的用例，或者所有测试类中名字中带有 `case` 的测试用例
	+ `--filter=MyTest*.*Test,*.*case*,-*.*myTest` 匹配所有 `MyTest` 开头测试类中以 `Test` 结尾的用例，或者名字中带有 `case` 的用例，或者名字中不带有 `myTest` 的测试用例
* `--random-seed <N>` 用于指定随机种子的值
* `--no-color` 关闭控制台颜色显示
* `--timeout-each <value>` value 的格式为 `%d[millis|s|m|h]`，为每个测试用例指定默认的超时时间
* `--parallel` 用于指定测试用例并行执行的方案， `value` 的形式如下所示：
	+ `<BOOL>` 可为 `true` 或 `false`，指定为 `true` 时，测试类可被并行运行，并行进程个数将受运行系统上的 CPU 核数控制
	+ `nCores` 指定了并行的测试进程个数应该等于可用的 CPU 核数
	+ `NUMBER` 指定了并行的测试进程个数值。该数值应该为正整数
	+ `NUMBERnCores` 指定了并行的测试进程个数值为可用的 CPU 核数的指定数值倍。该数值应该为正数（支持浮点数或整数）
* `--report-path <value>` 指定测试执行后的报告生成路径
* `--report-format <value>` 指定报告输出格式，当前单元测试报告仅支持 `xml` 格式（可忽略大小写），使用其它值将会抛出异常, 性能测试报告仅支持 `csv` 和 `csv-raw` 格式
* `--skip-script` 配置后，将会跳过构建脚本的编译运行


`cjpm test` 参数选项使用示例:



```
输入：
cjpm test src --coverage
cjcov --root=./ --html-details -o html_output
输出：cjpm test success
覆盖率生成：在 html_output 目录下会生成 html 文件，总的覆盖率报告文件名固定为 index.html

输入: cjpm test --bench
输出: cjpm test success

输入: cjpm test src --bench
输出: cjpm test success

输入: cjpm test src --filter=*
输出: cjpm test success

输入: cjpm test src --report-path=reports --report-format=xml
输出: cjpm test success

```


> **注意：**
> 
> 
> `cjpm test` 会自动构建所有带有 `mock` 支持的包，因此在测试中，开发者可以对自定义的类或依赖源模块的类进行 `mock` 测试。为了能够从一些二进制依赖中 `mock` 类，应该通过 `cjpm build --mock` 来构建带有 `mock` 支持的类。
> 带有 `--bench` 选项的 `cjpm test` 并不包含完全的 `mock` 支持，以避免在基准测试中由于在编译器中的 `mock` 处理而增加的任何开销。
> 使用 `--bench` 选项时，如果使用 `mock` ，编译器不会报错，以便能够将常规测试和基准测试一起编译。但是要避免运行使用 `mock` 的基准测试，否则会抛出运行时异常。


### [install](#install)


`install` 用于安装仓颉项目，执行该命令前会先进行编译，然后将编译产物安装到指定路径，安装产物以仓颉项目名命名（`windows` 系统上会有 `.exe` 后缀）。`install` 安装的项目产物类型需要是 `executable`。


`install` 有多个可配置项：


* `-V, --verbose` 用于展示安装日志
* `-g` 用于生成 `debug` 版本的安装产物
* `--path <value>` 用于指定本地安装项目的路径，默认为当前路径下的项目
* `--root <value>` 用于指定可执行文件的安装路径，不配置时 `linux/macOS` 系统下默认为 `$HOME/.cjpm`，`windows` 默认为 `%USERPROFILE%/.cjpm`，配置时将会安装于 `value`
* `-m, --member <value>` 仅可在工作空间下使用，可用于指定单个模块作为编译入口以安装单一模块
* `--target-dir <value>` 用于指定编译产物的存放路径
* `--name <value>` 用于指定最终安装的产物名
* `--git <value>` 用于指定 `git` 安装的项目 `url`
* `--branch <value>` 用于指定 `git` 安装的项目分支
* `--tag <value>` 用于指定 `git` 安装的项目 `tag`
* `--commit <value>` 用于指定 `git` 安装的项目 `commit ID`
* `--list` 用于打印已安装产物列表
* `--skip-build` 用于跳过编译阶段以直接安装产物，需要项目处于编译完成状态，且仅在本地安装场景下生效
* `-j, --jobs <N>` 用于指定并行编译的最大并发数，最终的最大并发数取 `N` 和 `2倍 CPU 核数` 的最小值
* `--cfg` 指定后，能够透传 `cjpm.toml` 中的自定义 `cfg` 选项
* `--skip-script` 配置后，将会跳过待安装模块的构建脚本的编译运行


`install` 功能有如下注意事项：


* `install` 共有两种安装方式：安装本地项目（通过 `--path` 配置项目路径）和安装 `git` 项目（通过 `--git` 配置项目 `url`）。这两种安装方式至多只能配置一种，否则 `install` 将报错。任意一种均未配置时，默认安装当前目录下的本地项目。
* `install` 编译项目时，默认开启增量编译。
* `git` 相关配置仅在配置 `--git` 后生效，否则会被忽略，包括 `--branch`, `--tag` 和 `--commit`。当配置多个 `git` 相关配置时，仅会生效优先级更高的配置，优先级排序为 `--commit` \> `--branch` \> `--tag`。
* 若已存在同名可执行文件被安装，则原来的文件将被替换。
* 假设安装路径为 `root`（`root` 为配置的安装路径，不配置则为默认路径），则可执行文件将被安装于 `root/bin`。
* 若项目存在动态库依赖，可执行程序所需动态库会被安装到 `root/libs`，按程序名分隔为若干目录，开发者需要将对应目录加入相应路径（`linux/macOS` 中为 `LD_LIBRARY_PATH`，`windows` 中为 `PATH`）方可使用。
* 默认安装路径（`linux/macOS` 系统下默认为 `$HOME/.cjpm`，`windows` 默认为 `%USERPROFILE%/.cjpm`）会在 `envsetup` 中被加入 `PATH`。
* `install` 在安装 `git` 项目后，对应的编译产物目录会被清除。
* 在待安装项目仅存在一个可执行文件产物时，指定 `--name` 会将其更名后安装；若存在多个可执行文件产物，指定 `--name` 会仅安装对应名称的产物。
* 配置 `--list` 时，`install` 会打印已安装产物列表，此时除 `--root` 以外的所有配置项均会被忽略。配置 `--root` 后，`--list` 会打印配置路径下已安装的产物列表，否则会打印默认路径下的列表。


例如：



```
cjpm install --path path/to/project # 从本地路径 path/to/project 中安装
cjpm install --git url              # 从 git 对应地址安装

```

### [uninstall](#uninstall)


`uninstall` 用于卸载仓颉项目，清除对应的可执行文件和依赖文件。


`uninstall` 需要配置参数 `name`，以卸载名为 `name` 的产物，配置多个 `name` 时会依次删除。`uninstall` 可以通过 `--root <value>` 指定卸载的可执行文件路径，不配置时 `linux/macOS` 系统下默认为 `$HOME/.cjpm`，`windows` 默认为 `%USERPROFILE%/.cjpm`，配置时将会卸载安装于 `value/bin` 的产物和安装于 `value/libs` 的依赖


### [clean](#clean)


`clean` 用于清理构建过程中的临时产物（`target` 文件夹）。该命令支持通过短选项 `-g` 指定仅清理 `debug` 版本的产物。该命令支持通过长选项 `--target-dir <value>` 用于指定清理的产物存放路径，开发者需自身保证清理该目录行为的安全性。如果使用了 `cjpm build --coverage` 或者 `cjpm test --coverage` 功能，还会清除 `cov_output` 文件夹，以及当前目录下的 `*.gcno` 文件和 `*.gcda` 文件。同时，该命令也支持通过 `--skip-script` 配置跳过构建脚本的编译运行。


例如：



```
输入: cjpm clean
输出: cjpm clean success

输入: cjpm clean --target-dir temp
输出: cjpm clean success

```


> **注意：**
> 
> 
> 在 `windows` 平台上，在子进程执行完成后立即清理子进程的可执行文件或父目录可能会失败。如果遇到该问题，可以在一小段延迟后重新尝试 `clean` 命令。


[模块配置文件说明](#模块配置文件说明)
---------------------


模块配置文件 `cjpm.toml` 用于配置一些基础信息、依赖项、编译选项等内容，`cjpm` 主要通过这个文件进行解析执行。其中，模块名可以在 `cjpm.toml` 中进行重命名，但是包名不能在 `cjpm.toml` 中进行重命名。


配置文件代码如下所示：



```
[package] # 单模块配置字段，与 workspace 字段不能同时存在
  cjc-version = "0.49.1" # 所需 `cjc` 的最低版本要求，必须
  name = "demo" # 模块名及模块 root 包名，必须
  description = "nothing here" # 描述信息，非必须
  version = "1.0.0" # 模块版本信息，必须
  compile-option = "" # 额外编译命令选项，非必须
  link-option = "" # 链接器透传选项，可透传安全编译命令，非必须
  output-type = "executable" # 编译输出产物类型，必须
  src-dir = "" # 指定源码存放路径，非必须
  target-dir = "" # 指定产物存放路径，非必须
  package-configuration = {} # 单包配置选项，非必须

[workspace] # 工作空间管理字段，与 package 字段不能同时存在
  members = [] # 工作空间成员模块列表，必须
  build-members = [] # 工作空间编译模块列表，需要是成员模块列表的子集，非必须
  test-members = [] # 工作空间测试模块列表，需要是编译模块列表的子集，非必须
  compile-option = "" # 应用于所有工作空间成员模块的额外编译命令选项，非必须
  link-option = "" # 应用于所有工作空间成员模块的链接器透传选项，非必须
  target-dir = "" # 指定产物存放路径，非必须

[dependencies] # 源码依赖配置项
  coo = { git = "xxx"，branch = "dev" , version = "1.0.0"} # 导入 `git` 依赖，`version`字段可缺省
  doo = { path = "./pro1" ,version = "1.0.0"} # 导入源码依赖，`version`字段可缺省

[test-dependencies] # 测试阶段的依赖配置项，格式同 dependencies

[ffi.c] # 导入 `c` 库依赖
  clib1.path = "xxx"

[profile] # 命令剖面配置项
  build = {}
  test = {}
  customized-option = {}

[target.x86_64-unknown-linux-gnu] # 后端和平台隔离配置项
  compile-option = "value1" # 额外编译命令选项，适用于特定 target 的编译流程和指定该 target 作为交叉编译目标平台的编译流程，非必须
  link-option = "value2" # 链接器透传选项，适用于特定 target 的编译流程和指定该 target 作为交叉编译目标平台的编译流程，非必须

[target.x86_64-w64-mingw32.dependencies] # 适用于对应 target 的源码依赖配置项，非必须

[target.x86_64-w64-mingw32.test-dependencies] # 适用于对应 target 的测试阶段依赖配置项，非必须

[target.x86_64-unknown-linux-gnu.bin-dependencies] # 仓颉二进制库依赖，适用于特定 target 的编译流程和指定该 target 作为交叉编译目标平台的编译流程，非必须
  path-option = ["./test/pro0", "./test/pro1"]
[target.x86_64-unknown-linux-gnu.bin-dependencies.package-option]
  "pro0.xoo" = "./test/pro0/pro0.xoo.cjo"
  "pro0.yoo" = "./test/pro0/pro0.yoo.cjo"
  "pro1.zoo" = "./test/pro1/pro1.zoo.cjo"

```

当以上字段在 `cjpm.toml` 中没有使用时，默认为空（对于路径，默认为配置文件所在的路径）。


### ["cjc\-version"](#cjc-version)


仓颉编译器最低版本要求，必须和当前环境版本兼容才可以执行。一个合法的仓颉版本号是由三段数字组成，中间使用 `.` 隔开，每个数字均为自然数，且没有多余的前缀 `0`。例如：


* `0.49.1` 是一个合法的仓颉版本号；
* `0.049.1` 不是一个合法的仓颉版本号，`049` 中含有多余的前缀 `0`；
* `0.2e.1` 不是一个合法的仓颉版本号，`2e` 不为自然数。


### ["name"](#name)


当前仓颉模块名称，同时也是模块 `root` 包名。


一个合法的仓颉模块名称必须是一个合法的标识符。标识符可由字母、数字、下划线组成，标识符的开头必须是字母，例如 `cjDemo` 或者 `cj_demo_1`。


### ["description"](#description)


当前仓颉模块描述信息，仅作说明用，不限制格式。


### ["version"](#version)


当前仓颉模块版本号，由模块所有者管理，主要供模块校验使用。模块版本号的格式同 `cjc-version`。


### ["compile\-option"](#compile-option)


传给 `cjc` 的额外编译选项。多模块编译时，每个模块设置的 `compile-option` 对该模块内的所有包生效。


例如：



```
compile-option = "-O1 -V"

```

这里填入的命令会在 `build` 执行时插入到编译命令中间，多个命令可以用空格隔开。可用的命令参考《仓颉编程语言开发指南》的编译选项章节内容。


### ["link\-option"](#link-option)


传给链接器的编译选项，可用于透传安全编译命令，如下所示:



```
link-option = "-z noexecstack -z relro -z now --strip-all"

```


> **注意：**
> 
> 
> `link-option` 中配置的命令在编译时只会自动透传给动态库和可执行产物对应的包。


### ["output\-type"](#output-type)


编译输出产物的类型，包含可执行程序和库两种形式，相关的输入如下表格所示。如果想生成 `cjpm.toml` 时该字段自动填充为 `static`，可使用命令 `cjpm init --type=static --name=modName`，不指定类型时默认生成为 `executable`。只有主模块的该字段可以为 `executable`。




| 输入 | 说明 |
| --- | --- |
| "executable" | 可执行程序 |
| "static" | 静态库 |
| "dynamic" | 动态库 |
| 其它 | 报错 |



### ["src\-dir"](#src-dir)


该字段可以指定源码的存放路径，不指定时默认为 `src` 文件夹。


### ["target\-dir"](#target-dir)


该字段可以指定编译产物的存放路径，不指定时默认为 `target` 文件夹。若该字段不为空，执行 `cjpm clean` 时会删除该字段所指向的文件夹，开发者需自身保证清理该目录行为的安全性。



> **注意：**
> 
> 
> 若在编译时同时指定了 `--target-dir` 选项，则该选项的优先级会更高。



```
target-dir = "temp"

```

### ["package\-configuration"](#package-configuration)


每个模块的单包可配置项。该选项是个 `map` 结构，需要配置的包名作为 `key`，单包配置信息作为 `value`。当前可配置的信息包含输出类型、透传命令选项、条件选项，这几个选项可缺省按需配置。如下所示，`demo` 模块中的 `demo.aoo` 包的输出类型会被指定为动态库类型，`-g` 命令会在编译时透传给 `demo.aoo` 包。



```
[package.package-configuration."demo.aoo"]
  output-type = "dynamic"
  compile-option = "-g"

```

如果在不同字段配置了相互兼容的编译选项，生成命令的优先级如下所示。



```
[package]
  compile-option = "-O1"
[package.package-configuration.demo]
  compile-option = "-O2"

# profile字段会在下文介绍
[package.profile.customized-option]
  cfg1 = "-O0"

输入: cjpm build --cfg1 -V
输出: cjc --import-path build -O0 -O1 -O2 ...

```

通过配置这个字段，可以同时生成多个二进制产物（生成多个二进制产物时，`-o, --output <value>` 选项将会失效），示例如下：


源码结构的示例，模块名为 `demo`：



```
`-- src
    |-- aoo
    |   `-- aoo.cj
    |-- boo
    |   `-- boo.cj
    |-- coo
    |   `-- coo.cj
    `-- main.cj

```

配置方式的示例：



```
[package.package-configuration."demo.aoo"]
  output-type = "executable"
[package.package-configuration."demo.boo"]
  output-type = "executable"

```

多个二进制产物的示例：



```
❯ cjpm build
cjpm build success

❯ tree target/release/bin
target/release/bin
|-- demo.aoo
|-- demo.boo
`-- demo

```

### ["workspace"](#workspace)


该字段可管理多个模块作为一个工作空间，支持以下配置项：


* `members = ["aoo", "path/to/boo"]`：列举包含在此工作空间的本地源码模块，支持绝对路径和相对路径。该字段的成员必须是一个模块，不允许是另一个工作空间
* `build-members = []`：本次编译的模块，不指定时默认编译该工作空间内的所有模块。该字段的成员必须被包含在 `members` 字段中
* `test-members = []`：本次测试的模块，不指定时默认单元测试该工作空间内的所有模块。该字段的成员必须被包含在 `build-members` 字段中
* `compile-option = ""`：工作空间的公共编译选项，非必须
* `link-option = ""`：工作空间的公共链接选项，非必须
* `target-dir = ""`：工作空间的产物存放路径，非必须，默认为 `target`


工作空间内的公共配置项，对所有成员模块生效。例如：配置了 `[dependencies] xoo = { path = "path_xoo" }` 的源码依赖，则所有成员模块可以直接使用 `xoo` 模块，无需在每个子模块的 `cjpm.toml` 中再配置。



> **注意：**
> 
> 
> `package` 字段用于配置模块的通用信息，不允许和 `workspace` 字段出现在同一个 `cjpm.toml` 中，除 `package` 外的其它字段均可在工作空间中使用。


工作空间目录举例：



```
root_path
 │   └─ aoo
 │       ├─ src
 │       └─ cjpm.toml
 │   └─ boo
 │       ├─ src
 │       └─ cjpm.toml
 │   └─ coo
 │       ├─ src
 │       └─ cjpm.toml
 └─ cjpm.toml

```

工作空间的配置文件使用举例：



```
[workspace]
members = ["aoo", "boo", "coo"]
build-members = ["aoo", "boo"]
test-members = ["aoo"]
compile-option = "-Woff all"

[dependencies]
xoo = { path = "path_xoo" }

[ffi.c]
abc = { path = "libs" }

```

### ["dependencies"](#dependencies)


该字段通过源码方式导入依赖的其它仓颉模块，里面配置了当前构建所需要的其它模块的信息。目前，该字段支持本地路径依赖和远程 git 依赖。


要指定本地依赖项，请使用 `path` 字段，并且它必须包含有效的本地路径。例如，下面的两个子模块 `pro0` 和 `pro1` 和主模块的代码结构如下：



```
|-- pro0
|   |-- cjpm.toml
|   `-- src
|       `-- zoo
|           `-- zoo.cj

|-- pro1
|   |-- cjpm.toml
|   `-- src
|       |-- xoo
|       |   `-- xoo.cj
|       `-- yoo
|           `-- yoo.cj

|-- cjpm.toml
`-- src
    |-- aoo
    |   `-- aoo.cj
    |-- boo
    |   `-- boo.cj
    `-- main.cj

```

在主模块的 `cjpm.toml` 中进行如下配置后，即可在源码中使用 `pro0` 和 `pro1` 模块：



```
[dependencies]
  pro0 = { path = "./pro0" }
  pro1 = { path = "./pro1" }

```

要指定远程 git 依赖项，请使用 `git` 字段，并且它必须包含 git 支持的任何格式的有效 url。要配置 git 依赖关系，最多可以有一个 `branch`、`tag` 和 `commitId` 字段，这些字段允许分别选择特定的分支、标记或提交哈希，若配置多个此类字段则仅会生效优先级最高的配置，优先级顺序为 `commitId` \> `branch` \> `tag`。此外，还有可选的 `version` 字段，用于检查依赖项是否具有正确的版本，并且没有意外更新。例如，进行如下配置后，即可在源码中使用特定 git 仓库地址的 `pro0` 和 `pro1` 模块：



```
[dependencies]
  pro0 = { git = "git://github.com/org/pro0.git", tag = "v1.0.0"}
  pro1 = { git = "https://gitee.com/anotherorg/pro1", branch = "dev"}

```

在这种情况下， `cjpm` 将下载对应存储库的最新版本，并将当前 `commit-hash` 保存在 `cjpm.lock` 文件中。所有后续的 `cjpm` 调用都将使用保存的版本，直到使用 `cjpm update`。


通常需要一些身份验证才能访问 git 存储库。 `cjpm` 不要求提供所需的凭据，因此应使用现有的 git 身份验证支持。如果用于 git 的协议是 `https` ，则需要使用一些现有的 git 凭据帮助程序。在 windows 上，可在安装 git 时一起安装凭据帮助程序，默认使用。在 linux 上，请参阅 [`git-config` 配置说明](https://git-scm.com/docs/gitcredentials) ，了解有关设置凭据帮助程序的详细信息。如果协议是 `ssh` 或 `git` ，则应使用基于密钥的身份验证。如果密钥受密码短语保护，则开发者应确保 `ssh-agent` 正在运行，并且在使用 `cjpm` 之前通过 `ssh-add` 添加密钥。


`dependencies` 字段可以通过 `output-type` 属性指定编译产物类型，指定的类型可以与源码依赖自身的编译产物类型不一致，且仅能为 `static` 或者 `dynamic`， 如下所示：



```
[dependencies]
  pro0 = { path = "./pro0", output-type = "static" }
  pro1 = { git = "https://gitee.com/anotherorg/pro1", output-type = "dynamic" }

```

进行如上配置后，将会忽略 `pro0` 和 `pro1` 的 `cjpm.toml` 中的 `output-type` 配置，将这两个模块的产物分别编译成 `static` 和 `dynamic` 类型。


### ["test\-dependencies"](#test-dependencies)


具有与 `dependencies` 字段相同的格式。它用于指定仅在测试过程中使用的依赖项，而不是构建主项目所需的依赖项。模块开发者应将此字段用于此模块的下游用户不需要感知的依赖项。


`test-dependencies` 内的依赖仅可用于文件名形如 `xxx_test.cj` 的测试文件，在编译时这些依赖将不会被编译。`test-dependencies` 在 `cjpm.toml` 中的配置格式与 `dependencies` 相同。


### ["script\-dependencies"](#script-dependencies)


具有与 `dependencies` 字段相同的格式。它用于指定仅在编译构建脚本中使用的依赖项，而不是构建主项目所需的依赖项。构建脚本相关功能将在[其他\-构建脚本](./cjpm_manual_cjnative_community.html#%E6%9E%84%E5%BB%BA%E8%84%9A%E6%9C%AC)章节中详述。


### ["ffi.c"](#ffic)


当前仓颉模块外部依赖 `c` 库的配置。该字段配置了依赖该库所需要的信息，包含库名和路径。


开发者需要自行编出动态库或静态库放到设置的 `path` 下，可参考下面的例子。


仓颉调用外部 `c` 动态库的方法说明：


* 自行将相应的 `hello.c` 文件编成 `.so`库（在该文件路径执行 `clang -shared -fPIC hello.c -o libhello.so`）
* 修改该项目的 `cjpm.toml` 文件，配置 `ffi.c` 字段，如下面的例子所示。其中，`./src/` 是编出的 `libhello.so` 相对当前目录的地址，`hello` 为库名。
* 执行 `cjpm build`，即可编译成功。



```
[ffi.c]
hello = { path = "./src/" }

```

### ["profile"](#profile)


`profile` 作为一种命令剖面配置项，用于控制某个命令执行时的默认配置项。目前支持四种场景：`build`、`test`、`run` 和 `customized-option`。


#### ["profile.build"](#profilebuild)



```
[profile.build]
lto = "full"  # 是否开启 LTO （Link Time Optimization 链接时优化）优化编译模式，仅 linux 平台支持该功能。
incremental = true # 是否默认开启增量编译

```

编译流程的控制项，所有字段均可缺省，不配置时不生效，顶层模块设置的 `profile.build` 项才会生效。


`lto` 配置项的取值为 `full` 或 `thin`，对应 LTO 优化支持的两种编译模式：full LTO 将所有编译模块合并到一起，在全局上进行优化，这种方式可以获得最大的优化潜力，同时也需要更长的编译时间；thin LTO 在多模块上使用并行优化，同时默认支持链接时增量编译，编译时间比 full LTO 短，但是因为失去了更多的全局信息，所以优化效果不如 full LTO。


#### ["profile.test"](#profiletest)



```
[profile.test] # 使用举例
noColor = true
timeout-each = "4m"
randomSeed = 10
bench = true
reportPath = "reports"
reportFormat = "xml"
[profile.test.compilation-options]
  verbose = true
  no-run = false
  lto = "thin"
  mock = "on"
[profile.test.env]
MY_ENV = { value = "abc" }
cjHeapSize = { value = "32GB", splice-type = "replace" }
PATH = { value = "/usr/bin", splice-type = "prepend" }

```

测试配置支持指定编译和运行测试用例时的选项，所有字段均可缺省，不配置时不生效，顶层模块设置的 `profile.test` 项才会生效。选项列表与 `cjpm test` 提供的控制台执行选项一致。如果选项在配置文件和控制台中同时被配置，则控制台中的选项优先级高于配置文件中的选项。`profile.test` 支持的运行时选项：


* `bench` 指定用例按性能用例方式执行，值为 `true` 或 `false`
* `filter` 指定用例过滤器，参数值类型为字符串，格式与 [test 命令说明](./cjpm_manual_cjnative_community.html#test)中 `--filter` 的值格式一致
* `timeout-each <value>` value 的格式为 `%d[millis|s|m|h]`，为每个测试用例指定默认的超时时间
* `parallel` 指定测试用例并行执行的方案，`value` 的形式如下所示：
	+ `<BOOL>` 值为 `true` 或 `false`，指定为 `true` 时，测试类可被并行运行，并行进程个数将受运行系统上的 CPU 核数控制
	+ `nCores` 指定并行的测试进程个数应该等于可用的 CPU 核数
	+ `NUMBER` 指定并行的测试进程个数值。该数值应该为正整数
	+ `NUMBERnCores` 指定并行的测试进程个数值为可用的 CPU 核数的指定数值倍。该数值应该为正数（支持浮点数或整数）
* `option:<value>` 与 `@Configuration` 协同定义运行选项。例如，如下选项：
	+ `randomSeed` 指定随机种子的值，参数值类型为正整数
	+ `noColor` 指定执行结果在控制台中是否无颜色显示，值为 `true` 或 `false`
	+ `reportPath` 指定测试执行后的报告生成路径（不能通过 `@Configuration` 配置）
	+ `reportFormat` 指定报告输出格式，当前当前单元测试报告仅支持 `xml` 格式（可忽略大小写），使用其它值将会抛出异常（不能通过 `@Configuration` 配置）, 性能测试报告仅支持 `csv` 和 `csv-raw` 格式
* `compilation-options` 为支持的编译选项，其列表如下：
	+ `verbose` 指定显示编译过程详细信息，参数值类型为 `BOOL`, 即值可为 `true` 或 `false`
	+ `no-run` 指定仅编译单元测试产物，参数值类型为 `BOOL`, 即值可为 `true` 或 `false`
	+ `lto` 指定是否开启 LTO 优化编译模式，该值可为 `thin` 或 `full` ，windows 平台暂不支持该功能
	+ `mock` 显式设置 mock 模式，可能的选项：`on`、`off`、`runtime-error`
* `env` 支持在 `test` 命令时运行可执行文件时配置临时环境变量，`key` 值为需要配置的环境变量的名称，有如下配置项：
	+ `value` 指定配置的环境变量值
	+ `splice-type` 指定环境变量的拼接方式，非必填，不配置时默认为 `absent`，共有以下四种取值：
		- `absent`：该配置仅在环境内不存在同名环境变量时生效，若存在同名环境变量则忽略该配置
		- `replace`：该配置会替代环境中已有的同名环境变量
		- `prepend`：该配置会拼接在环境中已有的同名环境变量之前
		- `append`：该配置会拼接在环境中已有的同名环境变量之后


#### ["profile.run"](#profilerun)


运行可执行文件时的选项，支持配置在 `run` 命令时运行可执行文件时的环境变量配置 `env`，配置方式同 `profile.test.env`。


#### ["profile.customized\-option"](#profilecustomized-option)



```
[profile.customized-option]
cfg1 = "--cfg=\"feature1=lion, feature2=cat\""
cfg2 = "--cfg=\"feature1=tiger, feature2=dog\""
cfg3 = "-O2"

```

自定义透传给 `cjc` 的选项，通过 `--cfg1 --cfg3` 使能，每个模块设置的 `customized-option` 对该模块内的所有包生效。例如，执行 `cjpm build --cfg1 --cfg3` 命令时，透传给 `cjc` 的命令则为 `--cfg="feature1=lion, feature2=cat" -O2`。



> **注意：**
> 
> 
> 这里的条件值必须是一个合法的标识符。


### ["target"](#target)


多后端、多平台隔离选项，用于配置不同后端、不同平台情况下的一系列不同配置项。`target` 配置方式如下：



```
[target.x86_64-unknown-linux-gnu] # linux 系统的配置项
  compile-option = "value1" # 额外编译命令选项
  link-option = "value2" # 链接器透传选项
  [target.x86_64-unknown-linux-gnu.dependencies] # 源码依赖配置项
  [target.x86_64-unknown-linux-gnu.test-dependencies] # 测试阶段依赖配置项
  [target.x86_64-unknown-linux-gnu.bin-dependencies] # 仓颉二进制库依赖
    path-option = ["./test/pro0", "./test/pro1"]
  [target.x86_64-unknown-linux-gnu.bin-dependencies.package-option]
    "pro0.xoo" = "./test/pro0/pro0.xoo.cjo"
    "pro0.yoo" = "./test/pro0/pro0.yoo.cjo"
    "pro1.zoo" = "./test/pro1/pro1.zoo.cjo"

[target.x86_64-w64-mingw32] # windows 系统的配置项
  compile-option = "value3"
  link-option = "value4"

[target.x86_64-unknown-linux-gnu.debug] # linux 系统的 debug 配置项
  [target.x86_64-unknown-linux-gnu.debug.test-dependencies]

[target.x86_64-unknown-linux-gnu.release] # linux 系统的 release 配置项
  [target.x86_64-unknown-linux-gnu.release.bin-dependencies]

```

开发者可以通过配置 `target.target-name` 字段为某个 `target` 添加一系列配置项。`target` 的名称可以在相应的仓颉环境下通过命令 `cjc -v` 获取，命令输出中的 `Target` 项目即为该环境对应的 `target` 名称。


可为特定 `target` 配置的专用配置项，将会适用于该 `target` 下的编译流程，同时也会适用于其他 `target` 指定该 `target` 作为目标平台的交叉编译流程。配置项列表如下：


* `compile-option`：额外编译命令选项
* `link-option`：链接器透传选项
* `dependencies`：源码依赖配置项，结构同 `dependencies` 字段
* `test-dependencies`：测试阶段依赖配置项，结构同 `test-dependencies` 字段
* `bin-dependencies`：仓颉二进制库依赖，结构在下文中介绍
* `compile-macros-for-target`：交叉编译时的宏包控制项，该选项不支持区分下述的 `debug` 和 `release` 编译模式


开发者可以通过配置 `target.target-name.debug` 和 `target.target-name.release` 字段为该 `target` 额外配置在 `debug` 和 `release` 编译模式下特有的配置，可配置的配置项同上。配置于此类字段的配置项将仅应用于该 `target` 的对应编译模式。


#### ["target.target\-name\[.debug/release].bin\-dependencies"](#targettarget-namedebugreleasebin-dependencies)


该字段用于导入已编译好的、适用于指定 `target` 的仓颉库产物文件，以导入下述的 `pro0` 模块和 `pro1` 模块的三个包来举例说明。



> **注意：**
> 
> 
> 非特殊需求场景，不建议使用该字段，请使用上文介绍的 `dependencies` 字段导入模块源码。



```
├── test
│   └── pro0
│       ├── libpro0.xoo.so
│       └── pro0.xoo.cjo
│       ├── libpro0.yoo.so
│       └── pro0.yoo.cjo
│   └── pro1
│       ├── libpro1.zoo.so
│       └── pro1.zoo.cjo
└── src
    └── main.cj
├── cjpm.toml

```

方式一，通过 `package-option` 导入：



```
[target.x86_64-unknown-linux-gnu.bin-dependencies.package-option]
  "pro0.xoo" = "./test/pro0/pro0.xoo.cjo"
  "pro0.yoo" = "./test/pro0/pro0.yoo.cjo"
  "pro1.zoo" = "./test/pro1/pro1.zoo.cjo"

```

`package-option` 选项为 `map` 结构，`pro0.xoo` 名称作为 `key` (`toml` 配置文件中含有 `.` 的字符串作为整体时，需要用 `""` 包含)，值为 `libpro0.xoo.so` 。前端文件 `cjo` 的路径作为 `value`，对应于该 `cjo` 的 `.a` 或 `.so` 需放置在相同路径下。


方式二，通过 `path-option` 导入：



```
[target.x86_64-unknown-linux-gnu.bin-dependencies]
  path-option = ["./test/pro0", "./test/pro1"]

```

`path-option` 选项为字符串数组结构，每个元素代表待导入的路径名称。`cjpm` 会自动导入该路径下所有符合规则的仓颉库包，这里的合规性是指库名称的格式为 `模块名.包名`。库名称不满足该规则的包只能通过 `package-option` 选项进行导入。



> **注意：**
> 
> 
> 如果同时通过 `package-option` 和 `path-option` 导入了相同的包，则 `package-option` 字段的优先级更高。


其中，源码`main.cj` 调用 `pro0.xoo`、`pro0.yoo`、`pro1.zoo` 包的代码示例如下所示。



```
import pro0.xoo.*
import pro0.yoo.*
import pro1.zoo.*

main(): Int64 {
    var res = x + y + z // x, y, z 分别为 pro0.xoo, pro0.yoo, pro1.zoo 中定义的值
    println(res)
    return 0
}

```

#### ["target.target\-name.compile\-macros\-for\-target"](#targettarget-namecompile-macros-for-target)


该字段用于配置宏包的交叉编译方式，有如下三种情况：


方式一：宏包在交叉编译时默认仅编译本地平台的产物，不编译目标平台的产物，对该模块内的所有宏包生效



```
[target.目标平台]
  compile-macros-for-target = ""

```

方式二：在交叉编译时同时编译本地平台和目标平台的产物，对该模块内的所有宏包生效



```
[target.目标平台]
  compile-macros-for-target = "all" # 配置项为字符串形式，可选值必须为 all

```

方式三：指定该模块内的某些宏包在交叉编译时同时编译本地平台和目标平台的产物，其它未指定的宏包采取方式一的默认模式



```
[target.目标平台]
  compile-macros-for-target = ["pkg1", "pkg2"] # 配置项为字符串数字形式，可选值是宏包名

```

#### ["target" 相关字段合并规则](#target-相关字段合并规则)


`target` 配置项中的内容可能同时存在于 `cjpm.toml` 的其他选项中，例如 `compile-option` 字段在 `package` 字段中也可以存在，区别在于 `package` 中的该字段会应用于全部 `target`。`cjpm` 对这些重复的字段会按照特定的方式将所有可应用的配置合并。以 `x86_64-unknown-linux-gnu` 的 `debug` 编译模式为例，有如下的 `target` 配置：



```
[package]
  compile-option = "compile-0"
  link-option = "link-0"

[dependencies]
  dep0 = { path = "./dep0" }

[test-dependencies]
  devDep0 = { path = "./devDep0" }

[target.x86_64-unknown-linux-gnu]
  compile-option = "compile-1"
  link-option = "link-1"
  [target.x86_64-unknown-linux-gnu.dependencies]
    dep1 = { path = "./dep1" }
  [target.x86_64-unknown-linux-gnu.test-dependencies]
    devDep1 = { path = "./devDep1" }
  [target.x86_64-unknown-linux-gnu.bin-dependencies]
    path-option = ["./test/pro1"]
  [target.x86_64-unknown-linux-gnu.bin-dependencies.package-option]
    "pro1.xoo" = "./test/pro1/pro1.xoo.cjo"

[target.x86_64-unknown-linux-gnu.debug]
  compile-option = "compile-2"
  link-option = "link-2"
  [target.x86_64-unknown-linux-gnu.debug.dependencies]
    dep2 = { path = "./dep2" }
  [target.x86_64-unknown-linux-gnu.debug.test-dependencies]
    devDep2 = { path = "./devDep2" }
  [target.x86_64-unknown-linux-gnu.debug.bin-dependencies]
    path-option = ["./test/pro2"]
  [target.x86_64-unknown-linux-gnu.debug.bin-dependencies.package-option]
    "pro2.xoo" = "./test/pro2/pro2.xoo.cjo"

```

`target` 配置项在与 `cjpm.toml` 公共配置项或者相同 `target` 的其他级别的配置项共存时，按照如下的优先级合并：


1. `debug/release` 模式下对应 `target` 的配置
2. `debug/release` 无关的对应 `target` 的配置
3. 公共配置项


以上述的 `target` 配置为例，`target` 各个配置项按照以下规则合并：


* `compile-option`：将所有适用的同名配置项按照优先级拼接，优先级更高的配置拼接在后方。在本例中，在 `x86_64-unknown-linux-gnu` 的 `debug` 编译模式下，最终生效的 `compile-option` 值为 `compile-0 compile-1 compile-2`，在 `release` 编译模式下为 `compile-0 compile-1`，在其他 `target` 中为 `compile-0`。
* `link-option`：同上。
* `dependencies`：源码依赖将被直接合并，如果其中存在依赖冲突则会报错。在本例中，在 `x86_64-unknown-linux-gnu` 的 `debug` 编译模式下，最终生效的 `dependencies` 为 `dep0`, `dep1` 和 `dep2`，而在 `release` 编译模式下仅有 `dep0` 和 `dep1` 生效。在其他 `target` 中，仅有 `dep0` 生效。
* `test-dependencies`：同上。
* `bin-dependencies`：二进制依赖将按照优先级合并，如果有冲突则仅有优先级更高的依赖将会被加入，同优先级的配置先加入 `package-option` 配置。在本例中，在 `x86_64-unknown-linux-gnu` 的 `debug` 编译模式下，`./test/pro1` 和 `./test/pro2` 内的二进制依赖将被加入，而在 `release` 模式下仅会加入 `./test/pro1`。由于 `bin-dependencies` 没有公共配置，因此在其他 `target` 中不会有二进制依赖生效。


在本例的交叉编译场景中，若在其他平台中指定了 `x86_64-unknown-linux-gnu` 作为目标 `target`，则 `target.x86_64-unknown-linux-gnu` 的配置也会按照上述规则与公共配置项合并并应用；如果处于 `debug` 编译模式，也将应用 `target.x86_64-unknown-linux-gnu.debug` 的配置项。


[配置和缓存文件夹](#配置和缓存文件夹)
---------------------


`cjpm` 通过 `git` 下载文件的存储路径可以通过 `CJPM_CONFIG` 环境变量指定。如果未指定，则 linux 上的默认位置为 `$HOME/.cjpm`，windows 上的默认位置为 `%USERPROFILE%/.cjpm` 。


[其他](#其他)
---------


### [命令扩展](#命令扩展)


`cjpm` 提供命令扩展机制，开发者可以通过文件名形如 `cjpm-xxx(.exe)` 的可执行文件扩展 `cjpm` 的命令。


针对可执行文件 `cjpm-xxx`（`windows` 系统中为 `cjpm-xxx.exe`），若系统环境变量 `PATH` 中配置了该文件所在的路径，则可以使用如下的命令运行该可执行文件：



```
cjpm xxx [args]

```

其中 `args` 为可能需要的输入给 `cjpm-xxx(.exe)` 的参数列表。上述命令等价于：



```
cjpm-xxx(.exe) [args]

```

运行 `cjpm-xxx(.exe)` 可能会依赖某些动态库，在这种情况下，开发者需要手动将需要使用的动态库所在的目录添加到环境变量中。


下面以 `cjpm-demo` 为例，该可执行文件由以下仓颉代码编译得到：



```
import std.os.*
import std.collection.*

main(): Int64 {
    var args = ArrayList<String>(getArgs())

    if (args.size < 1) {
        eprintln("Error: failed to get parameters")
        return 1
    }

    println("Output: ${args[0]}")

    return 0
}

```

则在将其目录添加到 `PATH` 之后，运行对应命令，会运行该可执行文件并获得对应的输出。



```
输入：cjpm demo hello,world
输出：Output: hello,world

```

`cjpm` 内部已有的命令优先级更高，因此无法用此方式扩展这些命令。例如，即使系统环境变量中存在名为 `cjpm-build` 的可执行文件，`cjpm build` 也不会运行该文件，而是运行 `cjpm` 并将 `build` 作为参数输入 `cjpm`。


### [构建脚本](#构建脚本)


`cjpm` 提供构建脚本机制，开发者可以在构建脚本中定义需要 `cjpm` 在某个命令前后的行为。


构建脚本源文件固定命名为 `build.cj`，位于仓颉项目主目录下，即与 `cjpm.toml` 同级。执行 `init` 命令新建仓颉项目时，`cjpm` 默认不创建 `build.cj`，开发者若有相关需求，可以自行按如下的模板格式在指定位置新建并编辑 `build.cj`。



```
// build.cj

import std.os.*

// Case of pre/post codes for 'cjpm build'.
/* called before `cjpm build`
 * Success: return 0
 * Error: return any number except 0
 */
// func stagePreBuild(): Int64 {
//     // process before "cjpm build"
//     0
// }

/*
 * called after `cjpm build`
 */
// func stagePostBuild(): Int64 {
//     // process after "cjpm build"
//     0
// }

// Case of pre/post codes for 'cjpm clean'.
/* called before `cjpm clean`
 * Success: return 0
 * Error: return any number except 0
 */
// func stagePreClean(): Int64 {
//     // process before "cjpm clean"
//     0
// }

/*
 * called after `cjpm clean`
 */
// func stagePostClean(): Int64 {
//     // process after "cjpm clean"
//     0
// }

// For other options, define stagePreXXX and stagePostXXX in the same way.

/*
 * Error code:
 * 0: success.
 * other: cjpm will finish running command. Check target-dir/build-script-cache/module-name/script-log for error outputs defind by user in functions.
 */

main(): Int64 {
    match (getArgs()[0]) {
        // Add operation here with format: "pre-"/"post-" + optionName
        // case "pre-build" => stagePreBuild()
        // case "post-build" => stagePostBuild()
        // case "pre-clean" => stagePreClean()
        // case "post-clean" => stagePostClean()
        case _ => 0
    }
}

```

`cjpm` 针对一系列命令支持使用构建脚本定义命令前后行为。例如，针对 `build` 命令，可在 `main` 函数中的 `match` 内定义 `pre-build`，执行想要在 `build` 命令执行前需要执行的功能函数 `stagePreBuild`（功能函数的命名不做要求）。`build` 命令后的行为可以以相同的方式通过添加 `post-build` 的 `case` 选项定义。针对其他命令的命令前后行为的定义类似，只需要添加相应的 `pre/post` 选项和对应的功能函数即可。


在定义某一命令前后的行为后，`cjpm` 在执行该命令时会首先编译 `build.cj`，并在执行前后执行对应的行为。同样以 `build` 为例，在定义了 `pre-build` 和 `post-build` 后运行 `cjpm build`，则会按照如下步骤运行整个 `cjpm build` 流程：


1. 进行编译流程前，首先编译 `build.cj`；
2. 执行 `pre-build` 对应的功能函数；
3. 进行 `cjpm build` 编译流程；
4. 编译流程顺利结束后，`cjpm` 会执行 `post-build` 对应的功能函数。


构建脚本支持的命令如下：


* `build`, `test`：同时支持执行依赖模块构建脚本中定义的 `pre` 和 `post` 流程
* `run`, `install`：仅支持运行对应模块的 `pre` 和 `post` 构建脚本流程，或者在进行编译时执行依赖模块的 `pre-build` 和 `post-build` 流程
* `check`, `tree`, `update`, `publish`：仅支持运行对应模块的 `pre` 和 `post` 构建脚本流程
* `clean`：仅支持运行对应模块的 `pre` 构建脚本流程


在执行这些命令时，若配置了 `--skip-script` 选项，则会跳过所有构建脚本的编译运行，包括依赖模块的构建脚本。


构建脚本的使用说明如下：


* 功能函数的返回值需要满足一定要求：当功能函数执行成功时，需要返回 `0`；执行失败时返回除 `0` 以外的任意 `Int64` 类型变量。
* `build.cj` 中的所有输出都将被重定向到项目目录下，路径为 `build-script-cache/[target|release]/[module-name]/bin/script-log`。开发者如果在功能函数中添加了一些输出内容，可在该文件中查看。
* 若项目根目录下不存在 `build.cj`，则 `cjpm` 将按正常流程执行；若存在 `build.cj` 并定义了某一命令的前后行为，则在 `build.cj` 编译失败或者功能函数返回值不为 `0` 时，即使该命令本身能够顺利执行，命令也将异常中止。
* 多模块场景下，被依赖模块的 `build.cj` 构建脚本会在编译和单元测试流程中生效。被依赖模块构建脚本中的输出同样重定向到 `build-script-cache/[target|release]` 下对应模块名目录中的日志文件。


例如，下面的构建脚本 `build.cj` 定义了 `build` 前后的行为：



```
import std.os.*

func stagePreBuild(): Int64 {
    println("PRE-BUILD")
    0
}

func stagePostBuild(): Int64 {
    println("POST-BUILD")
    0
}

main(): Int64 {
    match (getArgs()[0]) {
        case "pre-build" => stagePreBuild()
        case "post-build" => stagePostBuild()
        case _ => 0
    }
}

```

则在执行 `cjpm build` 命令时，`cjpm` 将会执行 `stagePreBuild` 和 `stagePostBuild`。`cjpm build` 执行完成后，`script-log` 日志文件内会有如下输出：



```
PRE-BUILD
POST-BUILD

```

构建脚本可以通过 `cjpm.toml` 中的 `script-dependencies` 字段导入依赖模块，格式同 `dependencies`。例如，在 `cjpm.toml` 中有如下配置，导入了 `aoo` 模块，并且 `aoo` 模块内有一个名为 `aaa()` 的方法：



```
[script-dependencies]
aoo = { path = "./aoo" }

```

则可以在构建脚本中导入该依赖，使用依赖中的接口 `aaa()`：



```
import std.os.*
import aoo.*

func stagePreBuild(): Int64 {
    aaa()
    0
}

func stagePostBuild(): Int64 {
    println("POST-BUILD")
    0
}

main(): Int64 {
    match (getArgs()[0]) {
        case "pre-build" => stagePreBuild()
        case "post-build" => stagePostBuild()
        case _ => 0
    }
}

```

构建脚本依赖 `script-dependencies` 与源码相关依赖（源码依赖项 `dependencies` 和测试依赖项 `test-dependencies`）相互独立，源码和测试代码无法使用 `script-dependencies` 中的依赖模块，构建脚本也无法使用 `dependencies` 和 `test-dependencies` 中的依赖模块。若需要在构建脚本和源码/测试代码中使用同一模块，需要在 `script-dependencies` 和 `dependencies/test-dependencies` 中同时配置。


[使用示例](#使用示例)
-------------


以下面仓颉项目的目录结构为例，介绍 `cjpm` 的使用方法，该目录下对应的源码文件示例可见[源代码](./cjpm_manual_cjnative_community.html)。该仓颉项目的模块名为 `test`。



```
cj_project
│   ├── pro0
│   │   ├── cjpm.toml
│   │   └── src
│   │       └── zoo
│   │           ├── zoo.cj
│   │           └── zoo_test.cj
│   │       ├── pro0.cj
│   └── src
│       ├── koo
│       │   ├── koo.cj
│       │   └── koo_test.cj
│       ├── main.cj
│       └── main_test.cj
│   ├── cjpm.toml

```

### [init、build 的使用](#initbuild-的使用)


* 新建仓颉项目并编写源码 `xxx.cj` 文件，如示例结构所示的 `koo` 包和 `main.cj` 文件。



```
cjpm init --name test --path .../cj_project
mkdir koo

```

此时，会自动生成 `src` 文件夹和默认的 `cjpm.toml` 配置文件。
* 当前模块需要依赖外部的 `pro0` 模块时，可以新建 `pro0` 模块及该模块的配置文件，接下来编写该模块的源码文件，需要自行在 `pro0` 下新建 `src` 文件夹，在 `src` 下新建 `pro0` 的 root 包 `pro0.cj`，并将编写的仓颉包放置在 `src` 下，如示例结构所示的 `zoo` 包。



```
mkdir pro0 && cd pro0
cjpm init --name pro0 --type=static
mkdir src/zoo

```
* 主模块依赖 `pro0` 时，需要按照手册说明去配置主模块配置文件的 `dependencies` 字段。配置无误后，执行 `cjpm build` 即可，生成的可执行文件在 `target/release/bin/` 目录下。



```
cd cj_project
vim cjpm.toml
cjpm build
cjpm run

```


### [test、clean 的使用](#testclean-的使用)


* 按示例结构，编写完每个文件对应的 `xxx_test.cj` 单元测试文件后，可以执行下述代码进行单元测试，生成的文件在 `target/release/unittest_bin` 目录下。



```
cjpm test

```

或者



```
cjpm test src src/koo pro/src/zoo

```
* 想要手动删除 `target` 、`cov_output` 文件夹、`*.gcno` 、`*.gcda` 等中间件时。



```
cjpm clean

```


### [示例的源代码](#示例的源代码)


cj\_project/src/main.cj



```
package test

import pro0.zoo.*
import test.koo.*

main(): Int64 {
    let res = z + k
    println(res)
    let res2 = concatM("a", "b")
    println(res2)
    return 0
}

func concatM(s1: String, s2: String): String {
    return s1 + s2
}

```

cj\_project/src/main\_test.cj



```
package test

import std.unittest.*//testfame
import std.unittest.testmacro.*//macro_Defintion

@Test
public class TestM{
    @TestCase
    func sayhi(): Unit {
        @Assert(concatM("1", "2"), "12")
        @Assert(concatM("1", "3"), "13")
    }
}

```

cj\_project/src/koo/koo.cj



```
package test.koo

public let k: Int32 = 12

func concatk(s1: String, s2: String): String {
    return s1 + s2
}

```

cj\_project/src/koo/koo\_test.cj



```
package test.koo

import std.unittest.*//testfame
import std.unittest.testmacro.*//macro_Defintion

@Test
public class TestK{
    @TestCase
    func sayhi(): Unit {
        @Assert(concatk("1", "2"), "12")
        @Assert(concatk("1", "3"), "13")
    }
}

```

cj\_project/pro0/src/pro0\.cj



```
package pro0

```

cj\_project/pro0/src/zoo/zoo.cj



```
package pro0.zoo

public let z: Int32 = 26

func concatZ(s1: String, s2: String): String {
    return s1 + s2
}

```

cj\_project/pro0/src/zoo/zoo\_test.cj



```
package pro0.zoo

import std.unittest.*//testfame
import std.unittest.testmacro.*//macro_Defintion

@Test
public class TestZ{
    @TestCase
    func sayhi(): Unit {
        @Assert(concatZ("1", "2"), "12")
        @Assert(concatZ("1", "3"), "13")
    }
}

```

cj\_project/cjpm.toml



```
[package]
cjc-version = "0.40.2"
description = "nothing here"
version = "1.0.0"
name = "test"
output-type = "executable"

[dependencies]
pro0 = { path = "pro0" }

```

cj\_project/pro0/cjpm.toml



```
[package]
cjc-version = "0.40.2"
description = "nothing here"
version = "1.0.0"
name = "pro0"
output-type = "static"

```

[命令行模式覆盖率统计](#命令行模式覆盖率统计)
=========================


[功能简介](#功能简介-1)
---------------


`cjcov`（Cangjie Coverage）是仓颉语言的官方覆盖率统计工具，用于生成仓颉语言程序的覆盖率报告。


[使用说明](#使用说明-1)
---------------


通过 `cjcov -h` 即可查看命令使用方法，如下所示。由几个板块组成，从上到下分别是：当前命令使用形式（Usage）、当前命令用途、支持的可用参数（Options）。



```
Usage: cjcov [options]

A tool used to summarize the coverage in html reports.

Options:
  -v, --version                 Print the version number, then exit.
  -h, --help                    Show this help message, then exit.
  -r ROOT, --root=ROOT          The root directories of your source files, defaults to '.', the current directory.
                                File names are reported relative to this root.
  -o OUTPUT, --output=OUTPUT    The output directories of html reports, defaults to '.', the current directory.
  -b, --branches                Report the branch coverage. (It is an experimental feature and may generate imprecise branch coverage.)
  --verbose                     Print some detail messages, including parsing data for the gcov file.
  --html-details                Generate html reports for each source file.
  -x, --xml                     Generate a xml report.
  -j, --json                    Generate a json report.
  -k, --keep                    Keep gcov files after processing.
  -s SOURCE, --source=SOURCE    The directories of cangjie source files.
  -e EXCLUDE, --exclude=EXCLUDE
                                The cangjie source files starts with EXCLUDE will not be showed in coverage reports.
  -i INCLUDE, --include=INCLUDE
                                The cangjie source files starts with INCLUDE will be showed in coverage reports.

```

基本的命令使用方法如下所示，`cjcov` 为主程序名称，`--version` 表示为显示 `cjcov` 的版本号。部分配置项支持长短选项两种写法，效果相同，具体可以使用 `cjcov --help` 命令参考用法。



```
cjcov -version 或者 cjcov -v

```

### [使用步骤](#使用步骤)


仓颉版本包准备 \-\-\> 仓颉源码准备 \-\-\> 使用 `--coverage` 编译选项构建仓颉源码，生成二进制文件 \-\-\> 执行二进制文件 \-\-\> `cjcov` 生成覆盖率统计结果


下面举一个 `hello world` 的覆盖率的例子（假设当前目录是 `WORKPATH`）：


1. 仓颉版本包准备


假设仓颉版本包解压在 `WORKPATH` 目录下，则执行 `source WORKPATH/cangjie/envsetup.sh` 命令即可。
2. 仓颉源码准备


源码目录结构如下：



```
src/
└── main.cj

```

`main.cj` 源码内容如下：



```
main(): Int64 {
    print("hello world\n")
    return 0
}

```
3. 编译源码，该例子用 `cjpm` 编译举例


在 `WORKPATH` 目录下执行以下命令：



```
cjpm init cangjie test
cjpm build --coverage

```

编译完成之后在 `WORKPATH` 目录下会生成 `default.gcno` 文件。
4. 运行编译出来的二进制


在 `WORKPATH` 目录下执行 `cjpm run --skip-build` 命令，运行完成之后 `WORKPATH` 目录下会生成 `default.gcda` 文件。
5. `cjcov` 生成 `html`


在 `WORKPATH` 目录执行 `cjcov -o output --html-details`，更多 `cjcov` 参数使用可参考[命令说明](./cjpm_manual_cjnative_community.html#cjcov--h----help)章节。


执行完 `cjcov` 命令之后，在 `WORKPATH/output` 目录会有以下文件：



```
output
├── cjcov_logs （该目录存放一些 cjcov 执行过程的详细日志，可不用关注）
│   ├── cjcov.log
│   └── gcov_parse.log
├── index.html （总的覆盖率报告，通过浏览器打开）
└── src_main.cj.html （单个文件的覆盖率，可以通过打开 index.html 自动跳转到该文件）

```

[命令说明](#命令说明-1)
---------------


### [cjcov \-h \| \-\-help](#cjcov--h----help)


显示 `cjcov` 基本使用方法。


### [cjcov \-v \| \-\-version](#cjcov--v----version)


显示 `cjcov` 的版本号，只要指定了 `-v` 或者 `--version` 参数，不管输入其他任何选项参数都不生效，只会显示版本号。如 `--version` 和 `--help` 同时使用，则显示 `version` 信息后退出。


### [cjcov \-\-verbose](#cjcov---verbose)


指定该选项后会将一些日志信息生成到 `cjcov_logs` 目录中，该参数默认不生效，即默认不会打印中间信息。`gcov` 文件是 `cjcov` 工具生成的中间文件，`cjcov` 解析 `gcov` 文件的格式如下：



```
==================== start: main.cj.gcov =====================

noncode line numbers:
[0, 0, 0, 0, 1, 2, 6, 7, 9, 10, 11, 15, 17, 18]

uncovered line numbers:
[5]

covered data:
[(16, 1), (3, 1), (4, 1), (8, 1), (12, 1), (13, 1), (14, 1)]

branches data:
line number:    4  ==>  data: [(0, 0), (1, 1)]

===================== end: main.cj.gcov =======================


```

指定该选项参数，会显示每个 `gcov` 文件的详细覆盖率数据。


具体字段解释如下：


* `start: xxx.gcov, end: xxx.gcov`：两行中间的文本是对应 `xxx.gcov` 文件解析到的覆盖率数据。
* `noncode line numbers`：显示的是不统计到总代码行的行号，在 `html` 中是以白色底呈现，对应 `gcov` 中的以 `-` 开头的行数。
* `uncovered line numbers`：显示的是没有覆盖到的数据，在 `html` 中是以红色底呈现，对应 `gcov` 文件中以 `#####` 开头的行数。
* `covered data`：显示的是覆盖到的数据，以`(代码行数, 覆盖次数)`呈现，在对应 `html` 中以绿色呈现，只要覆盖次数大于 0，在 `html` 中的 `Exec` 一列中显示为 `Y`，对应于 `gcov` 文件以数字开头的行数。
* `branches data`：显示的分支覆盖数据，以`(代码行数, 分支覆盖次数)`呈现，在对应 `html` 中的 `Branch` 一列中，有一个倒三角形，显示的是分支覆盖数/总分支数。该数据对应于 `gcov` 文件中以 `branch` 开头的数据。


### [cjcov \-\-html\-details](#cjcov---html-details)


如果指定该参数，表示会生成仓颉文件对应的 `html`。在总的 `index` 文件里面会有每个子 `html` 的索引。子 `html` 文件和 `index.html` 放在同一个目录。


子 `html` 文件名是由目录和文件名由下划线拼接起来。如源文件是 `src/main.cj`，生成的 `html` 名字为 `src_main.cj.html`。如果源文件路径带有特殊字符会被替换成 `=`，下文[文件名包含特殊字符](./cjpm_manual_cjnative_community.html#%E6%96%87%E4%BB%B6%E5%90%8D%E5%8C%85%E5%90%AB%E7%89%B9%E6%AE%8A%E5%AD%97%E7%AC%A6)章节会有更详细的描述。


如果没有指定该参数，表示不会生成子 `html` 。在总的 `index` 文件里面会显示每个子 `html` 的覆盖率数据，但是不能跳转到对应的子 `html` 文件。


该参数默认不生效。即默认只会生成一个 `index.html`, 不会生成子 `html` 文件。


### [cjcov \-x \| \-\-xml](#cjcov--x----xml)


如果指定该参数，则会在指定输出路径生成 `coverage.xml` 文件，`coverage.xml` 记录的是所有文件的覆盖率数据。


### [cjcov \-j \| \-\-json](#cjcov--j----json)


如果指定该参数，则会在指定输出路径生成 `coverage.json` 文件，`coverage.json` 记录的是所有文件的覆盖率数据。


### [cjcov \-k \| \-\-keep](#cjcov--k-----keep)


指定该参数后则不会删除生成的 `gcov` 中间文件。如果 `gcov` 文件不删除，会造成执行次数的累加，可能会影响覆盖率数据的准确性。


默认该参数不生效，即默认会删除 `gcov` 中间文件。


### [cjcov \-b \| \-\-branches](#cjcov--b----branches)


指定该参数后则会生成分支覆盖率信息。


默认该参数不生效，即默认不生成分支的覆盖率信息，此时在 `html` 报告中的分支覆盖率数据百分比显示为 `-`。


### [cjcov \-r ROOT \| \-\-root\=ROOT](#cjcov--r-root----rootroot)


该参数指定的 `ROOT` 参数，表示在 `ROOT` 目录或者在其递归子目录能找到 `gcda` 文件，`gcda` 和 `gcno` 文件默认会生成在一起，建议不要手动特意去把 `gcda` 文件和 `gcno` 文件分开存放，不然可能会发生程序不能运行的情况。


参数指定的 `ROOT` 目录如果不存在，`cjcov` 工具会有报错提示。


不指定该参数，默认会以当前目录为 `ROOT` 目录。


### [cjcov \-o OUTPUT \| \-\-output\=OUTPUT](#cjcov--o-output-----outputoutput)


该参数指定的 `OUTPUT` 参数，表示 `html` 覆盖率报告的输出路径。


如果该 `OUTPUT` 目录不存在，而且其父目录也不存在，`cjcov` 工具会有报错提示；如果 `OUTPUT` 目录不存在，但其父目录存在，`cjcov` 会帮助创建 `OUTPUT` 目录。


不指定该参数，默认会以当前目录为 `OUTPUT` 目录来存放 `html` 文件。


### [\-s SOURCE \| \-\-source\=SOURCE](#-s-source----sourcesource)


该参数指定的 `SOURCE` 参数，表示仓颉源文件的代码路径，`html` 总覆盖率报告 `index.html` 会有各个源文件的索引，这些文件路径记录的是一个相对路径。如果指定 `-s SOURCE |--source SOURCE` 参数，优先以 `SOURCE` 路径列表中的路径作为相对路径的参考路径，如果没有指定该参数，则以 `-r ROOT | --root=ROOT` 作为相对路径的参考路径，如果都没有指定，则以当前路径作为相对路径的参考路径。


示例：


仓颉代码目录结构如下：



```
/work/cangjie/tests/API/test01/src/1.cj
/work/cangjie/tests/API/test01/src/2.cj
/work/cangjie/tests/LLVM/test02/src/3.cj
/work/cangjie-tools/tests/LLVM/test01/src/4.cj
/work/cangjie-tools/tests/LLVM/test02/src/5.cj

```

1. 在 `/work` 目录执行命令：



```
cjcov --root=./ -s "/work/cangjie /work/cangjie-tools/tests" --html-details --output=html_output

```

最后 html 中呈现的源文件相对路径是：



```
tests/API/test01/src/1.cj
tests/API/test01/src/2.cj
tests/LLVM/test02/src/3.cj
LLVM/test01/src/4.cj
LLVM/test02/src/5.cj

```
2. 在 `/work` 目录执行命令, 没有指定 `--root` 参数和 `--source` 参数，默认当前所在路径为相对路径的参考路径，执行命令如下：



```
cjcov --html-details --output=html_output

```

最后 html 中呈现的源文件相对路径是：



```
cangjie/tests/API/test01/src/1.cj
cangjie/tests/API/test01/src/2.cj
cangjie/tests/LLVM/test02/src/3.cj
cangjie-tools/tests/LLVM/test01/src/4.cj
cangjie-tools/tests/LLVM/test02/src/5.cj

```


### [\-e EXCLUDE \| \-\-exclude\=EXCLUDE](#-e-exclude----excludeexclude)


该参数指定的 `EXCLUDE` 参数，表示不需要生成覆盖率信息的源文件列表，支持指定目录和文件。


示例：


仓颉代码目录结构如下：



```
/usr1/cangjie/tests/API/test01/src/1.cj
/usr1/cangjie/tests/API/test01/src/2.cj
/usr1/cangjie/tests/LLVM/test02/src/3.cj
/usr1/cangjie-tools/tests/LLVM/test01/src/4.cj
/usr1/cangjie-tools/tests/LLVM/test02/src/5.cj

```

在 `/usr1` 目录执行命令：



```
cjcov --root=./ -s "/usr1/cangjie" -e "/usr1/cangjie-tools/tests/LLVM" --html-details --output=html_output

```

最后 `html` 中呈现的源文件相对路径是,其中以 `/usr1/cangjie-tools/tests/LLVM` 路径开头的文件不会出现在 `html` 的文件列表中。



```
tests/API/test01/src/1.cj
tests/API/test01/src/2.cj
tests/LLVM/test02/src/3.cj

```

### [\-i INCLUDE \| \-\-include\=INCLUDE](#-i-include----includeinclude)


该参数指定的 `INCLUDE` 参数，表示以 `INCLUDE` 开头的文件会显示在 `index.html` 的文件列表中，支持指定目录和文件。如果 `-e | --exclude` 和 `-i | --include` 指定的参数有路径重复，会有报错提示。


示例：


仓颉代码目录 `/usr1/cangjie/tests` 结构如下：



```
├── API
│   └── test01
│       └── src
│           ├── 1.cj
│           └── 2.cj
└── LLVM
    └── test02
        └── src
            └── 3.cj

```

在 `/usr1` 目录执行命令, 其中 `-i` 参数表示需要体现在覆盖率报告 `index.html` 的文件，命令如下：



```
cjcov --root=./ -s "/usr1/cangjie" -i "/usr1/cangjie/tests/API/test01/src/1.cj /usr1/cangjie/tests/LLVM/test02" --html-details --output=html_output

```

上面命令执行后, 在 `index.html` 中文件路径列表如下(`tests/API/test01/src/2.cj` 不在 `-i` 参数指定的列表里面，所以不会出现在 `html` 的文件列表中):



```
tests/API/test01/src/1.cj
tests/LLVM/test02/src/3.cj

```

[特殊场景](#特殊场景)
-------------


### [二进制无法正常执行结束](#二进制无法正常执行结束)


对于常驻的网络服务程序无法正常结束二进制文件并生成 `gcda` 覆盖率数据的场景，需要手动执行退出脚本生成 `gcda` 覆盖率数据。


1）将以下脚本内容保存为 `stop.sh`（此脚本执行依赖 `gdb`）



```
#!/bin/sh
SERVER_NAME=$1

pid=`ps -ef | grep $SERVER_NAME | grep -v "grep" | awk '{print $2}'`
echo $pid
gdb -q attach $pid <<__EOF__
p exit(0)
__EOF__

```

2）常驻服务程序完成业务逻辑操作覆盖后，执行 `stop.sh {service_name}`，如通过 `./main` 启动常驻服务进程，通过如下方式停止进程产生 `gcda` 数据



```
sh stop.sh ./main

```

### [文件名包含特殊字符](#文件名包含特殊字符)


建议遵循仓颉编程规范命名文件，不建议包含除 \[0\-9a\-zA\-Z\_] 之外的字符，特殊字符会被替换成 `=`。


如果文件名有特殊字符，为保证 `html` 跳转正确，`index.html` 中呈现的 `html` 名字和 `html` 本身文件名会不一致，`html` 文件名的特殊字符都会被替换成 `=`。


示例如下：


代码结构：



```
src
├── 1file#.cj
├── file10_abc.cj
├── file11_.aaa-bbb.cj
├── file12!#aaa!bbb.cj
├── file13~####.cj
├── file14*aa.cj
├── file15`.cj
├── file16(#).cj
├── file2;aa.cj
├── file3,?.cj
├── file4@###.cj
├── file5&cc.cj
├── file6=.cj
├── file7+=.cj
├── file8$.cj
├── file9-aaa.cj
└── main.cj

```

生成 html 文件名，其中除了 `[0-9a-zA-Z_.=]` 之外，其他特殊字符都被替换成了 `'='`：



```
.
├── index.html
├── src_1file=.cj.html
├── src_file10_abc.cj.html
├── src_file11_.aaa=bbb.cj.html
├── src_file12==aaa=bbb.cj.html
├── src_file13=####.cj.html
├── src_file14=aa.cj.html
├── src_file15=.cj.html
├── src_file16===.cj.html
├── src_file2=aa.cj.html
├── src_file3==.cj.html
├── src_file4=###.cj.html
├── src_file5=cc.cj.html
├── src_file6=.cj.html
├── src_file7==.cj.html
├── src_file8=.cj.html
├── src_file9=aaa.cj.html
└── src_main.cj.html

```

### [分支覆盖率功能](#分支覆盖率功能)


分支覆盖率是一个试验阶段的功能，会出现分支覆盖率数据不准确的情况。


目前已知会出现分支覆盖率数据不准确的场景包含以下几种表达式：


* `try-catch-finally` 表达式
* 循环表达式（包括 `for` 表达式、`while` 表达式）
* `if-else` 表达式


### [部分代码未记录到行覆盖率数据中](#部分代码未记录到行覆盖率数据中)


部分代码不会记录到行覆盖率数据中，属于正常情况。整体而言，如果一行代码*仅包含定义、声明*而没有实际的可执行代码，那么这一行代码不会被统计到覆盖率中。目前已知不会统计的场景有：


* 全局变量的定义，示例如下：



```
let HIGH_1_UInt8: UInt8 = 0b10000000;

```
* 成员变量仅声明未初始化赋值，示例如下：



```
public class StringBuilder <: Collection & ToString {
    private var myData: Array
    private var mySize: Int64
    private var endIndex: Int64
}

```
* 仅有函数声明未包含函数体（包括 `foreign` 函数等），示例如下：



```
foreign func cj_core_free(p: CPointer): Unit

```
* 枚举类型定义，示例如下：



```
enum Numeric {
    NumDay | NumYearDay | NumYearWeek | NumHour12 | NumHour24 | NumMinute | NumSecond
}

```
* class、extend 等定义，其中 extend 和 class 所在的一行不会记录到覆盖率数据中，示例如下：



```
extend Int8 <: Formatter { // This line wil not account for the coverage.
  ...
}

public class StringBuilder <: Collection & ToString { // This line will not account for the coverage.
   ...
}

```


### [源代码中的 `main` 函数未被覆盖](#源代码中的-main-函数未被覆盖)


**原因：** 使用 `cjc --test` 编译，仓颉测试框架会生成一个新的 `main` 作为程序入口，源代码中的 `main` 不再作为程序入口并且不会被执行。


**建议：** 在使用 `cjc --test` 之后，建议不用再手写多余的 `main` 。


[FAQ](#faq)
-----------


### [报错找不到 `llvm-cov` 命令](#报错找不到-llvm-cov-命令)


**解决方法：**


方法1：设置 `CANGJIE_HOME` 环境变量, `cjcov` 可通过 `CANGJIE_HOME` 环境变量找到 `llvm-cov` 命令，设置方法如下：
假设 `which cjc` 显示 `/work/cangjie/bin/cjc`, 并且 `/work/cangjie/bin/llvm/bin` 和 `/work/cangjie/bin/llvm/lib` 目录都存在，则可设置：



```
export CANGJIE_HOME=/work/cangjie

```

方法2：在 `/root/.bashrc` 里面直接设置环境变量，如 `cjc` 放在 `/work/cangjie/bin/cjc` 目录下，则设置方法如下：



```
export PATH=/work/cangjie/bin/llvm/bin:$PATH
export LIBRARY_PATH=/work/cangjie/bin/llvm/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=/work/cangjie/bin/llvm/lib:$LD_LIBRARY_PATH

```

方法3：手动安装 `llvm-cov` 命令，如 `ubuntu` 上可执行命令：



```
apt install llvm-cov

```

### [出现 VirtualMachineError OutOfMemoryError](#出现-virtualmachineerror-outofmemoryerror)


**问题现象：**



```
An exception has occurred:
Error VirtualMachineError OutOfMemoryError

```

**解决方法：** 仓颉默认规格 stack 1MB，heap 256 MB，建议根据文件数量大小将堆内存调到合适的大小。通常 2GB 的内存能够满足大多数情况，如果不够用则根据具体情况再增加内存大小。


示例：



```
把堆内存扩大到2GB：
export cjHeapSize=2GB

```






























