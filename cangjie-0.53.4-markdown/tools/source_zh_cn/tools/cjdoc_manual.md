





API文档生成工具 \- 仓颉语言工具使用指南




































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




















[API 文档生成工具](#api-文档生成工具)
=========================


[功能简介](#功能简介)
-------------


`cjdoc(Cangjie Doc)` 是一个支持仓颉语言的 API 文档生成器。


`cjdoc` 能提取源文件的全局变量、函数、类、结构体、接口、枚举、扩展等语法的文档注释，并输出 HTML 格式的 API 接口文档。


[文档注释介绍](#文档注释介绍)
-----------------


### [什么是文档注释](#什么是文档注释)


文档注释是为自动生成文档而写的注释，它是一种带有特殊功能的注释。 `cjdoc` 能够识别遵循 `cjdoc` 风格注释的文档注释。


`cjdoc` 风格文档注释以 `/**` 开头、以 `*/` 结尾，并且当编辑多行注释时，每行要以星号开头。文档注释与一般注释的最大区别在于起始符号是`/**`而不是`/*`或`//`。



```
/**
 * 这是文档注释
 */

/** 这是文档注释 */

/*
 * 这是一般注释
 */

// 这是一般注释

```

### [文档注释格式](#文档注释格式)


`cjdoc` 的一个文档注释由两部分组成，分别为描述部分和注解部分，描述部分又可分为简要描述和详细描述。不同的写法举例如下：



> **说明：**
> 
> 
> 以下写法的描述部分如果需要有换行效果，需要在换行地方加上`\n`。


* 写法 1： 描述部分不区分简要描述和详细描述



```
/**
 * this is description （描述部分）
 *
 * @param parameter-name explanation （注解部分）
 * @return explanation （注解部分）
 */

```

* 写法 2：只有描述部分



```
/**
 * this is description （描述部分）
 */

```

* 写法 3：文档注释只有一行，描述部分不区分简要描述和详细描述



```
/** this is description （描述部分）*/

```

* 写法 4：描述部分区分简要描述和详细描述



```
/**
 * @brief this is brief description （简要描述）
 *
 * this is detailed description （详细描述）
 *
 * @param parameter-name explanation （注解部分）
 */

```

* 写法 5：描述部分需要换行，需要在换行地方加上`\n`


正例:



```
/**
 * this is description.\n
 * add a new line
 */

```

html 文档效果:



```
this is description
add a new line

```

反例：



```
/**
 * this is description.
 * add a new line
 */

```

html 文档效果:



```
this is description. add a new line

```

### [cjdoc 支持的注解](#cjdoc-支持的注解)




| **标签** | **描述** | **示例** |
| --- | --- | --- |
| @file | 文件描述信息 | @file file description |
| @author | 标识作者 | @author description |
| @version | 指定版本 | @version info |
| @date | 指定日期 | @date datetime |
| @since | 标记当引入一个特定的变化时 | @since release |
| @see | 指定一个到另一个主题的链接 | @see anchor |
| @brief | 标记简要描述 | @brief brief description |
| @param | 说明一个方法的参数 | @param parameter\-name explanation |
| @return | 说明返回值类型 | @return explanation |
| @throws | 和 @exception 标签一样 | The @throws tag has the same meaning as the @exception tag |
| @exception | 标志抛出的异常 | @exception exception\-name explanation |
| @note | 标记提示信息 | @note note text |
| @warning | 标记告警信息 | @warning warning text |
| @attention | 标记需要注意的信息 | @attention attention text |



以下 3 个注解正式代码中不建议用，但是 `cjdoc` 也支持:




| **标签** | **描述** | **示例** |
| --- | --- | --- |
| @todo | 标记后续需要做的事 | @todo paragraph describing what is to be done |
| @bug | 标记代码中未解决的 bug | @bug bug description |
| @deprecated | 标记过期的用法 | @deprecated description |



[使用说明](#使用说明)
-------------


使用`cjdoc -h` 查看 `cjdoc` 工具的命令帮助。



```
Doxygen version 1.9.3 (cd5f678d1ce70159572e23563d4e21735e8dfe29*)
Copyright Dimitri van Heesch 1997-2021

You can use doxygen in a number of ways:

1) Use doxygen to generate a template configuration file:
    ./cjdoc [-s] -g [configName]

2) Use doxygen to update an old configuration file:
    ./cjdoc [-s] -u [configName]

3) Use doxygen to generate documentation using an existing configuration file:
    ./cjdoc [configName]

4) Use doxygen to generate a template file controlling the layout of the
   generated documentation:
    ./cjdoc -l [layoutFileName]

    In case layoutFileName is omitted layoutFileName.xml will be used as filename.
    If - is used for layoutFileName doxygen will write to standard output.

5) Use doxygen to generate a template style sheet file for RTF, HTML or Latex.
    RTF:        ./cjdoc -w rtf styleSheetFile
    HTML:       ./cjdoc -w html headerFile footerFile styleSheetFile [configFile]
    LaTeX:      ./cjdoc -w latex headerFile footerFile styleSheetFile [configFile]

6) Use doxygen to generate a rtf extensions file
    ./cjdoc -e rtf extensionsFile

    If - is used for extensionsFile doxygen will write to standard output.

7) Use doxygen to compare the used configuration file with the template configuration file
    ./cjdoc -x [configFile]

8) Use doxygen to show a list of built-in emojis.
    ./cjdoc -f emoji outputFileName

    If - is used for outputFileName doxygen will write to standard output.

If -s is specified the comments of the configuration items in the config file will be omitted.
If configName is omitted 'Doxyfile' will be used as a default.
If - is used for configFile doxygen will write / read the configuration to /from standard output / input.

If -q is used for a doxygen documentation run, doxygen will see this as if QUIET=YES has been set.

-v print version string, -V print extended version information

```

下面是几个常用的和配置文件相关的命令。


### [生成配置文件](#生成配置文件)


生成配置文件模板，如果没有输入 configName ，则默认生成文件名为 Doxyfile 的配置文件。



```
cjdoc -g [configName]

```

使用配置文件 configName 生成文档。



```
cjdoc [configName]

```

将 configFile 和默认配置比较，可以看到当前配置修改了哪些条目。



```
cjdoc -x [configFile]

```


> **说明：**
> 
> 
> 若使用`-g`命令时，`configName`或`Doxyfile`已存在，则会生成`.bak`配置文件以备份旧的配置文件信息，并生成新的默认配置文件`configName`或`Doxyfile`。


### [常用配置选项](#常用配置选项)


#### [建议配置的选项](#建议配置的选项)


\| 配置选项 \| 默认值 \| 描述 \|
\| \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\- \| \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\- \|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\|
\| RECURSIVE \| 默认 NO，建议配置成 YES \| 是否递归扫描 INPUT 配置的路径 \|
\| EXTRACT\_ALL \| 默认 NO，建议配置成 YES \| 如果配置 NO，只会显示带有文档注释的 API 接口 \|
\| GENERATE\_LATEX \| 默认 YES，建议配置成 NO \| 是否生成 latex 文件 \|
\| INPUT \| 默认空，不配置默认当前路径 \| 用于指定生成文档的源文件的路径 \|
\| OUTPUT\_DIRECTORY \| 默认空，不配置默认当前路径 \| 文档输出路径 \|


* `INPUT`使用示例



> **说明：**
> 
> 
> 若有多个源文件路径，可以在`INPUT`输入多个路径（文件或目录），以空格相隔， 也可以使用`INPUT +=`添加多个路径。


例 1：添加以执行`cjdoc`所在的相对路径。



```
INPUT = src/spirit/annotation src/spirit/dbconnection src/spirit/util/enum_enhance.cj

```

例 2：添加绝对路径。



```
INPUT = /home/project/src/spirit/annotation /home/project/src/spirit/dbconnection /home/project/src/spirit/util

```

例 3：INPUT \+\= 添加多个路径。



```
INPUT = src/spirit/annotation
INPUT += src/spirit/dbconnection
INPUT += src/spirit/util

```


> **注意：**
> 
> 
> 若所输入路径是不存在的路径，会在执行 cjdoc 过程中显示：warning: source 'xxx' is not a readable file or directory... skipping。
* `EXCLUDE`使用示例



> **说明：**
> 
> 
> `EXCLUDE`配置选项可用于从`INPUT`中排除相应的文件或目录。


例 1：添加以执行`cjdoc`所在的相对路径。



```
EXCLUDE = src/spirit/annotation src/spirit/dbconnection src/spirit/util/enum_enhance.cj

```

例 2：添加绝对路径。



```
EXCLUDE = /home/project/src/spirit/annotation /home/project/src/spirit/dbconnection /home/project/src/spirit/util

```

例 3：EXCLUDE \+\= 添加多个路径。



```
EXCLUDE = src/spirit/annotation
EXCLUDE += src/spirit/dbconnection
EXCLUDE += src/spirit/util

```


#### [其他常用选项](#其他常用选项)




| 配置选项 | 默认值 | 描述 |
| --- | --- | --- |
| PROJECT\_NAME | 默认空，可不配 | 工程名，最后会显示在 html 页面标题上 |
| GENERATE\_HTML | 默认 YES | 生成 html 格式的 API 文档 |
| HTML\_OUTPUT | 默认 html | html 文件生成在 {OUTPUT\_DIRECTORY}/{HTML\_OUTPUT} 目录下 |
| EXTRACT\_PRIVATE | 默认 NO | 是否显示属性为 private 的接口 |
| EXTRACT\_PROTECTED | 默认 NO | 是否显示属性为 protected 的接口 |
| EXTRACT\_PACKAGE | 默认 NO | 是否显示属性为 package 的接口 |
| EXTRACT\_STATIC | 默认 NO | 是否显示属性为 static 的接口 |



### [执行 cjdoc](#执行-cjdoc)



```
cjdoc [configName]

```

使用配置文件 `configName` 生成 API 文档。如果没有指定 `configName`，默认使用当前目录下文件名为 `Doxyfile` 的配置文件，`configName`文件可以命名为任何 Linux 支持的文件名。


执行完`cjdoc`后，在输出路径下生成`html`格式文档，可在`html`目录下点击`index.html`查看文档构建效果。


[相关资料](#相关资料)
-------------


`cjdoc` 是基于开源工具 doxygen 扩展了仓颉语言。doxygen 本身功能非常庞大，资料丰富，cjdoc 中非语言相关的特性，与 doxygen 是互通的。
doxygen 的参考手册可参照: [doxygen 用户手册](https://www.doxygen.nl/manual/index.html)。


[注意事项](#注意事项)
-------------


Windows 版本不支持包含中文的路径生成 API 文档，如需对路径中包含中文的源码文件生成 API 文档，请使用 Linux 版本。





























