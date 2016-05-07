华南理工大学学位论文Latex/Lyx模板
=============================

###NOTICE###
https://code.google.com/p/scutthesis/ is deprecated after November 11, 2014, and new updates of scutthesis will be released at https://github.com/alwintsui/scutthesis .

【主要特色】
----------

*   至今第一个专业型华南理工大学Latex论文模板
*   全国高校论文模板中，首创支持Lyx论文编辑
*   模板使用与操作系统平台无关，一键生成pdf文件
*   框架简洁高效，适宜作为其他高校Latex／Lyx论文模板设计的母版

【指导思想】
----------
*   创新：把复杂的事简单化，把简单的事自动化 -- scutthesis创始人：Alwin Tsui
*   维护良好framework设计，坚持三大原则：实用性、简洁性和开放性 -- 模板

【设计概要】
----------

本设计包括两部分：latex模板类和lyx模板布局，书写文档时使用其一即可。其流程框架、模板使用和文件关系如图1。

latex模板类包括文本布局类scutthesis.cls和参考文献样式scutthesis.bst。
采用XeLATEX排版引擎编辑方式使用Unicode编码克服多种字体带来麻烦。在传统的Tex使用方式中（way 1），
先用Tex编辑器直接输入你的论文内容(参照例子scutthesis.tex格式)，再运行xelatex，
其调用scutthesis.cls和scutthesis.bst就可以格式化为符合华南理工大学学位论文的排版要求。注意摘要之前的几页排版内容，
如标题和版权页，是以pdf文件方式包括在tex文件中，发布包中提供了相应word的.doc版文件，请自行修改再转换为pdf文件。

你也可以通过lyx间接地使用latex模板类（图中way 2），不需要直面latex源代码。
在lyx中采用scutthesis.layout布局，输入你的论文内容如scutthesis.lyx格式，
再一键调用xelatex自动编译成scutthesis.tex文件，并加入scutthesis.cls和scutthesis.bst生成最终的pdf文件。

详细的设计内容，见发布包中的scutthesis.pdf文件。 图1:
![framework] (figure/scutthesis.png "framework")

【适用对象】
----------

所有能够运行Latex的系统，和所有能够运行lyx的系统（可选）

1.    Linux(ubuntu)测试过的环境为Texlive2009+lyx；
2.    Windows测试过的环境为Ctex + miktex+lyx；
3.    MAC OS X测试过的环境为Mactex2011+Lyx2.0。

_源代码采用了Mercurial进行版本控制，最近更新版直接用hg clone下来，而对于稳定的版本可直接去Downloads区下载。_



【使用简介】
----------

使用之前先确认安装好Xelatex以及必要的中文字体，Lyx软件推荐安装。详见scutthesis.pdf相关章节。

*   用lyx打开论文模板文件scutthesis.lyx,调用xelatex菜单项或者工具栏按钮编译即可，最终生成scutthesis.pdf文件。
*   如果你的lyx未能调用xelatex，那么用lyx将scutthesis.lyx导出为latex plain格式的scutthesis.tex，再用Texmarker+xelatex编译。
*   调用用户的 scutthesis.bib 文件，lyx中有相关设置界面，属于lyx使用的问题；
*   你的论文可以从修改thesis_cover.doc和scutthesis.lyx而来。


【版本状态】
----------
（推荐加入“Tex与lyx讨论”QQ群： 253568537，并关注GitHub上的最新版本）

May 7,2016 发布1.7版本

1.       采用RequirePackage指令导入longtable包，并修正“研究成果”节表格无法自动分页的错误。
2.       修正chapterx指令奇偶页眉互换错误，影响“参考文献”、“攻读＊＊＊的研究成果”和“致谢”节的页眉切换。
3.       修正在最新tex发行版下xeCJK包的CJKnumber选项deprecated的错误，额外引入新包CJKnumb。

Jun 26,2015 发布1.6版本

1.       启用pdfcover模板选项支持pdf封面可选导入
2.       重写附录之后标题格式，修改listing格式，去除草稿模式
3.       更新lyx模板，修改部分布局，修改说明文档

Dec 21,2012 发布1.5版本

1.      专注于学位论文（scutthesis）的完善，而放弃对课程论文（scutcourse）的支持，并修正本项目名称
2.      封面更新，修改版权声明，去除页眉中的横线和规范申请人信息
3.      改为本地目录调用Latex模板scutthesis.cls和scutthesis.bst文件，和Lyx模板scutthesis.layout，去除路径设置的繁琐
4.      更正列表项后面的段落为首行空两格
5.      丰富Lyx模板使用的帮助文档
6.      增加一个名为appendix_style的pagestype, 用在“附录”的头顶, 使得奇数页眉为section标题而不是chapter标题
7.      文档中对公式的引用改用规范的eqref指令

Sep 22, 2011 发布1.4版本

1.      scutthesis.lyx和scutcourse.lyx更新支持至Lyx2.0版本；Lyx1.X用户请继续使用scutthesis 1.3版本（强烈推荐阅读scutthesis.pdf中4.3.1节）
2.      纠正scutthesis.lyx和scutcourse.lyx 文件中按空格断行方式
3.      设置目录后的空白页无页码
4.      将原有的hypersetup宏库的引入从scutcourse.cls和scutthesis.cls中剔除,改在外部的tex和lyx中自由设置。
5.      增加了install.sh脚本，方便Linux和MAC OS X系统下的安装

Apr 14, 2011 发布1.3版本

1.      修改scutthesis.bst 文件，修正会议论文集格式以符合学校要求：增加［A] 和地址、出版社
2.      在scutthesis.cls中草稿引入水印，加入定理环境，完善标题、表格和程序代码等格式
3.      修正scutcourse.cls不能插入pdf论文封面页的问题
4.      正式发布scutcourse.cls(附带scutcourse.lyx)，调用scutthesis.bst格式化参考文献，硕士和博士通用
5.      reference/scutthesis.bib转化为utf-8编码以防止参考文献条目中中文乱码。
6.      整理scutthesis.layout和scutcourse.layout以适应新的cls格式
7.      在scutthesis.lyx中添加一章，专门讲解模板的使用。
8.      修正scutthesis.lyx中发表论文列表格式
9.      修正scutthesis.lyx的图标题为下居中，表标题为上居中，使用隐含lyx居中控制
10.     在README中添加了字体安装和新建Xelatex菜单选项两个步骤说明

Jan 13, 2011 发布1.2版本

1.      整理项目文档结构，增加figure,reference,cover,latex_cls_bst和lyx_layout等目录
2.      完善scutthesis.lyx文档内容，使得读起来像是有逻辑的人话
3.      scutthesis.cls默认改为使用中文断行方式
4.      将README.txt转换为reStructuredText格式文档,并提供相应的README.html文件
5.      增加课程论文模板lyx_layout/scutcourse.layout和scutcourse.cls等测试版

Oct 16, 2010 1.1版本在最新Ubuntu10.10平台和Lyx1.6.7测试编译通过。

Jul 26, 2010 发布1.1版本，详见README.txt和视频演示文件scutthesis1.1.ogv。

Jul 11, 2010 在download区，添加使用方法视频演示文件scutthesis_lyx_xelatex_demo.mpg。

Jun 27, 2010 发布1.0版本，含Latex+Lyx博士学位论文模板，不含课程论文模板。

Jun 23, 2010 模板的初版已经完成，基本达到了课程论文和博士论文要求的格式规范（不排除有些未知的格式），
	在ubuntu 10.04 LTS下，用Lyx layout先输入内容，再用XeLatex (texlive2009)顺利编译成了pdf文件，
	一切正常,相关文件等稍加整理后发布。

【期望目标】
----------

*   模板设计样式忠实于校方要求
*   指导用Latex/Lyx写论文,摆脱格式排版的繁琐

【问题讨论】
----------

*   QQ群： 253568537，讨论Tex和lyx的应用与开发，论文编辑排版的所有相关问题，和发布scutthesis最新动态。
*   提问前先看过Issues和Wiki版FAQ，新问题可以在Issue中直接发布。Wiki版是常见问题的解答（含QQ群中讨论的典型问题）
*   当前还没很好的lyx软件学习文档，建议参阅lyx自带的help->tutorial，或进QQ群讨论。


【责任声明】
----------
 本模板采用GPL3版权，发布的目的是最大程度减轻华工学生论文排版的工作，本项目虽然基本完善，
但难免有不足之处，对此引起的论文事故不承担相应负责！（补充：本模板格式完全可通过华工学位办和图书馆审核）
