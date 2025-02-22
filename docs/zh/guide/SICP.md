# 《零基础SICP》公开课
《零基础SICP》面向任何无编程基础、对Scheme和编程的本质感兴趣的小伙伴。

我们期望读者：
+ 具有高中水平的数学基础和英文基础
+ 对操作系统（Windows/macOS/Linux三者之一）有一定了解，能够学会如何打开终端，并使用cd命令切换当前目录

如果您已经学会编程了，《零基础SICP》公开课仍旧值得您花时间观看和学习，您可以通过练习题来判断是否可以直接跳过其中的一些课程。

在墨干中点击`帮助->墨客星球`，可以找到《零基础SICP》的讲义、课件、练习、勘误等信息。

相关资料：
+ 交互式SICP：https://gitee.com/XmacsLabs/interactive-sicp
  - 本公开课所使用的讲义，源自SICP网页版，由墨客实验室手动整理为TeXmacs文档
  - 该仓库中每一课的讲义和练习以单独的TeXmacs文档存在
+ S7 Scheme Binary: https://gitee.com/XmacsLabs/s7-scheme-binary
  - 本课程所使用的S7 Scheme解释器
  - S7 Scheme官网：https://ccrma.stanford.edu/software/s7/
+ SICP官网：https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/index.html
+ SICP中文译本：[《计算机程序的构造和解释》](https://book.douban.com/subject/1148282/)
+ 南京大学的SICP课程主页：https://cs.nju.edu.cn/xyfeng/teaching/SICP/index.htm
+ MIT的SICP课程：https://ocw.mit.edu/courses/6-001-structure-and-interpretation-of-computer-programs-spring-2005/pages/syllabus/


## 第4.2课：递归与迭代 习题1.11~1.13
+ B站回放：https://www.bilibili.com/video/BV14t421L7Pg/
+ 操作系统：Windows 10
+ 墨干版本：v1.2.5

MathAgape（人类）总结的视频内容：
+ `00:23` 习题 1.9 复习
  - 辨析过程（procedure）与计算过程（process）
+ `03:57` 习题 1.10 复习
  - 考虑n为非自然数的情况
+ `08:13` 习题1.12 杨辉三角
+ `11:48` 怎样下载、使用解释器（这次是Windows系统的教程，MacOS 见上期）
+ `22:26` 副作用
+ `30:53` 在cmd里打印杨辉三角
+ `36:08` 练习：写出和书上格式一样居中对齐的杨辉三角】
+ `43:42` 在墨干的调试控制台里打印杨辉三角（用for）
+ `55:48` for 循环的定义（宏）
+ `37:42` 习题1.13 证明Fib(n)以指数增长
+ `59:53` 答疑：习题1.2

注意：这一期中讲到quasiquote，实际上是墨干V1.2.5的一个错误，这个错误我们将在下周一（2024/03/18）之前发布的墨干V1.2.5.1中解决，目前不会影响大家学习SICP第一章的。

## 第4.1课：递归与迭代 习题1.9~1.10
+ B站回放：https://www.bilibili.com/video/BV1Kz421Q72B/
+ 操作系统：macOS 14
+ 墨干版本：v1.2.5
+ 勘误：英文课件习题1.13的希腊字母 ψ 应读作 psai

MathAgape（人类）总结的视频内容：
+ `01:31` 复习：代码清单
+ `04:44` 技巧：用scheme生成墨干里的树
  ``` scheme
  (stree->tree '
         (tree "a"
            (tree "b")
            (tree "c")))
  ```

+ `06:28` 习题1.9 
  - 用 inc、dec实现加法的两种方式
  - 递归/迭代的计算过程（可参考书上p.21-23）

+ `11:41` 习题1.10
  - Ackermann 函数
  - 墨干的可折叠结构（13:04）
    * 插入->可运行->Scheme
    * 通过回车操控折叠

+ `16:09` 习题1.13 提示

+ `20:21` 怎样下载、使用解释器
- `20:51` 下载地址
- `20:59` macOS 演示教程
  ``` bash
  ; 首先打开“终端”
  cd ; 进入家目录
  ls ; 查看家目录

  mkdir bin ; 新建文件夹
  ; 把下载的文件放到 bin 文件夹，可改短文件名为 s7
  cd bin
  chmod +x s7 ; 添加可执行权限
  ./s7 ; 运行
  ctrl+c ; 退出
  touch add.scm ; 创建 scm 文件

  ; 编辑 scm 文件，例如：
  (display (+ 1 1))
  (display "\n")

  time ./s7 add.scm ; 运行并查看时间
  ```


## 第3课：递归与迭代
+ B站回放：https://www.bilibili.com/video/BV1UJ4m1a7PA/
+ 操作系统: Windows 11
+ 墨干版本: v1.2.5

MathAgape（人类）总结的视频内容：
+ `00:45` 答疑 关于REPL
  - 以文心一言类比REPL
  - 没有REPL的语言？ c语言
  - 编译器与解释器的区别
+ `12:01` 复习：条件表达式
  - 应用序求值
  - 短路运算
  - 以围棋类比scheme语言
+ `31:15` 循环：求和（书上是阶乘）
  - 伪代码与常规写法（for、set!）
  - 线性递归
  - 线性递归的应用序展开
+ `01:03:00` 递归&迭代：斐波那契数列
  - 树形递归
  - 两种迭代法实现
  - 比较三种算法的效率（焦点工具栏->输出选项->显示花费时间）

## 第2.2课：编程的基本原理 习题1.7~1.9
+ B站回放: https://www.bilibili.com/video/BV1gx4y1C7wn/
+ 操作系统: macOS 13 (M1芯片)
+ 墨干版本：v1.2.4

MathAgape（人类）总结的视频内容：
+ `00:35` 习题1.7
  - 关键1：把 good-enough? 的算法从“绝对误差”改成“相对误差”，即可避免被开方数过小或过大导致的问题；
  - 关键2：由于 sqrt 已经在标准库中，做练习时建议起一个新名字如 sqrt-new，以免混淆
+ `06:40` 开发技巧：如何一次性执行全部代码，而不是一个个回车
  - 方法1：转成 .scm 文件，再使用“调试控制台”或“终端”查看
  - 方法2：焦点工具栏：求值->全部求值
+ `16:48` 如何交作业
  - 文件->导出->可编辑PDF（方便我们在邮箱预览）
+ `24:47` 习题1.9
  - 预热讨论：什么是inc、dec；什么是寄存器
## 第2.1课：编程的基本原理 习题1.1~1.8
+ B站回放: https://www.bilibili.com/video/BV1kU421d7jz/
+ 操作系统: macOS 13 (M1芯片)
+ 墨干版本：v1.2.4
+ 内容：第一章第一节的练习题
+ 勘误：习题1.7的讲解有误，正确思路是：把绝对误差的算法改成相对误差。
## 第1课：编程的基本原理
+ B站回放：https://www.bilibili.com/video/BV1cp421f7xP/
+ 操作系统：macOS 13 (M1芯片)
+ 墨干版本：v1.2.4
+ 内容
  - 表达式
  - 命名与环境
  - 组合式的求值
  - 复合函数
  - 函数应用的代换模型
  - 条件表达式和谓词
## 第0课：准备Scheme编程的环境
+ B站回放：https://www.bilibili.com/video/BV1CK421y77g/
+ 操作系统：UOS 1050 (龙芯3A5000)
+ 墨干版本：v1.2.4
+ 内容：
  - 如何下载安装墨干
  - 如何在墨干中插入Scheme会话
  - 如何通过`帮助->墨客星球`找到《零基础SICP》的交互式讲义、课件、练习、代码清单