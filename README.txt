=======================================
华南理工大学博士学位论文Latex/Lyx模板
=======================================

:Author: Alwin Tsui
:Contact: alwintsui@gmail.com
:Date: Sep 22,2011
:Copyright: This document has been placed in the public domain.

.. Note::

	本文只简单介绍 scutthesis <http://code.google.com/p/scutthesis/> 的配置和使用，更详细的文档请阅读 scutthesis.pdf。

scutthesis设计思想
---------------------------------

指导思想:

	保持框架的简洁性，努力提高文档排版的效率。采用LYX+XeLATEX+LATEX 组合的排版编辑方式。使用Unicode编码的XeLatex编译,
	排除字体编码的不干净性，而且可以方便调用Windows系统中的中文字体。
	
功能结构:

	1. 论文摘要前的封面独立设计，修改校方的封面模板 thesis_cover.doc，再用Openoffice或者MS word转换为thesis_cover.pdf插入Tex文档；
	2. scutthesis.cls只规范论文正文部分(从摘要开始)，有对页面尺寸，字体段落等属性设置；
	3. scutthesis.bst规范参考文献格式。
	
   具备以上提到的三个文件：scutthesis.cls，scutthesis.bst,thesis_cover.pdf，就可以用Texmaker类似软件设计华南理工大学博士论文了，scutthesis.tex就是一个例子。

为了避免Tex编辑的困难和繁琐，在更高一层采用Lyx来排版论文，其自动生成tex文件，使作者注意力集中到论文内容上，为此需要做两步：

	1. 使Lyx能调用xelatex工具编译相应的xelatex语法文档。
	
	方法：网上已经有如何配置调用xelatex菜单项，lyx的wiki也有些说明：http://wiki.lyx.org/LyX/XeTeX，模板《Latex与Lyx排版研究》一文中也将详细说明。

	2. 使Lyx能显示和编辑scutthesis类别的文档，比如我们的scutthesis.lyx，其document class是关联到了scutthesis.cls。
	
	方法：设计一个支持scutthesis类别的lyx layout，也就是发布包中提供的scutthesis.layout 。
	
安装及使用方法
----------------------

以Ubuntu为例，系统参数为：

- Ubuntu10.04 
- XeTeX 3.1415926-2.2-0.9995.2 (TeX Live 2009 full)
- texmarker1.9.9
- LyX 1.6.6.1 (2010-05-28)

假设Texlive2009、中文MS字体、Lyx和exmaker等已经安装了。注意，xelatex包含在Texlive2009中，关于中文字体的安装见网络 `链接 <http://blog.chinaunix.net/u3/109488/showart_2222797.html>`_
对于windows用户安装Lyx和MiKTeX的windows版本,稍加配置同样可行。

[以下两步骤可选]
步骤一、安装scutthesis LaTex宏包文件，使得xelatex能找到。（~/texmf等路径不存在，则自行建立）
	1. scutthesis.cls放置到路径 ~/texmf/tex/latex/scutthesis/scutthesis.cls；
	2. scutthesis.bst放置到路径 ~/texmf/bibtex/bst/scutthesis/scutthesis.bst；
	
步骤二、安装支持scutthesis类别的lyx layout
	1. scutthesis.layout放置到路径  ~/.lyx/layouts/scutthesis.layout；
	2. 打开lyx软件，点击运行：tools->reconfigure

检验是否设置成功：

	以上两步按顺序完成后，用命令cat ~/.lyx/configure.log | grep scut查看是否有如下行信息，有则成功。
	
	+checking for document class scutthesis [scutthesis]... yes
	
	或者，在lyx中的 document->settings->document class下拉列表中能够找到book(SCUT Thesis)项，也表示已经配置成功。

	注意lyx默认是字体使用西文T1编码，不符合scutthesis的要求，处理办法是：
	在所有以上文件都放置好后，运行lyx的tools->reconfigure，在其生成的文件 ~/.lyx/lyxrc.defaults中注释掉默认的西文T1编码，如:
	#\font_encoding "T1"
	注意每次reconfigure，文件~/.lyx/lyxrc.defaults都会覆盖，不要让注释行又还原了，当然排除T1编码的方法应该有更好的，以后补充。

步骤三、安装中文字体
	scutthesis.cls使用的是windows中文字体，在一般Linux没有带这些字体，需要自己安装。
	先在找这些字体，项目中提供了一个现存下载地址：http://scutthesis.googlecode.com/files/winfonts.zip

	安装方法以Ubuntu为例，将压缩包中winfonts目录解压到~/.fonts目录即可。
	再在终端运行fc-cache命令，刷新字体库。
	若用fc-list :lang=zh命令，可以到所安装的中文字体。

	在windows系统下，不需要下载安装这些字体，如果你使用的是其他windows版本的中文字体，编译scutthesis.ly或者scutthesis.tex时提示：
	找不到KaiTi_GB2312和FangSong_GB2312，那么你可能需要替换scutthesis.cls的两行：
	::

	\setCJKfamilyfont{kai}{KaiTi_GB2312}
	\setCJKfamilyfont{fang}{FangSong_GB2312}

为
	::

	\setCJKfamilyfont{kai}{KaiTi}
	\setCJKfamilyfont{fang}{FangSong}

步骤四、在Lyx中添加Xelatex编译菜单项
	打开lyx->tools->performances->file handling->file formats来添加一个新项，如下图填写，再按new命令新建一个，再保存。

.. image:: figure/pdf_xelatex.png
	:align: center

再点击file handling->converters按钮，form format和to format如下图，其他参数也要一样，再按add新建一个选，保存以后你可以看到Lyx->view->Pdf(xelatex)菜单命令了，lyx论文文档就是通过这个命令来编译的。

.. image:: figure/latex_pdf_latex.png
	:align: center

使用方法：

	* 用lyx打开论文模板文件scutthesis.lyx,调用xelatex菜单项或者工具栏按钮编译即可，最终生成scutthesis.pdf文件。
	* 如果你的lyx未能调用xelatex，那么用lyx将scutthesis.lyx导出为latex plain格式的scutthesis.tex，再用Texmarker+xelatex编译。
	* 调用用户的 scutthesis.bib 文件，lyx中有相关设置界面，属于lyx使用的问题；
	* 你的论文可以从修改thesis_cover.doc和scutthesis.lyx而来。

linux下面，测试简单例子命令：
make -i sample

文件依赖关系
---------------

.. image:: figure/scutthesis.png
	:align: center

功能变更说明
-----------------
版本1.5, Dec 21,2012:
        - 专注于学位论文（scutthesis）的完善，而放弃对课程论文（scutcourse）的支持，并修正本项目名称
        - 封面更新，修改版权声明，去除页眉中的横线和规范申请人信息
        - 改为本地目录调用Latex模板scutthesis.cls和scutthesis.bst文件，和Lyx模板scutthesis.layout，去除路径设置的繁琐
        - 更正列表项后面的段落为首行空两格
        - 丰富Lyx模板使用的帮助文档 
	- 增加一个名为appendix_style的pagestype, 用在“附录”的头顶, 使得奇数页眉为section标题而不是chapter标题
        - 文档中对公式的引用改用规范的eqref指令
版本1.4, Sep 22,2011:
	- scutthesis.lyx和scutcourse.lyx更新支持至Lyx2.0版本（详见scutthesis.pdf中4.3.1节）；
	- 纠正scutthesis.lyx和scutcourse.lyx 文件中按空格断行方式；
	- 设置目录后的空白页无页码
        - 将原有的hypersetup宏库的引入从scutcourse.cls和scutthesis.cls中剔除,改在外部的tex和lyx中设置，这样用户可灵活自由修改属性。
        - 增加了install.sh脚本，方便Linux和MAC OS X系统下的安装

版本1.3, Apr 14,2011:
	- 修改scutthesis.bst 文件，修正会议论文集格式以符合学校要求：增加［A] 和地址、出版社；
        - 在scutthesis.cls中草稿引入水印，加入定理环境，完善标题、表格和程序代码等格式
	- 修正scutcourse.cls不能插入pdf论文封面页的问题
	- 正式发布scutcourse.cls(附带scutcourse.lyx)，硕士和博士通用
	- reference/scutthesis.bib转化为utf-8编码以防止参考文献条目中中文乱码。
        - 整理scutthesis.layout和scutcourse.layout以适应新的cls格式
	- 在scutthesis.lyx中添加一章，专门讲解模板的使用。
	- 修正scutthesis.lyx中发表论文列表格式。
	- 修正scutthesis.lyx的图标题为下居中，表标题为上居中，使用隐含lyx居中控制。
	- 在README中添加了字体安装和新建Xelatex菜单选项两个步骤说明

版本1.2, Jan 13,2011:
	- 整理项目文档结构，增加figure,reference,cover和lyx_layout等目录。
	- 完善scutthesis.lyx文档内容，使得读起来像是有逻辑的人话。
	- scutthesis.cls默认使用中文断行方式
	- 将README.txt转换为reStructuredText格式文档,并提供相应的README.html文件。
	- 增加课程论文模板lyx_layout/scutcourse.layout和scutcourse.cls等测试版。
	
版本1.1, Oct 16, 2010:
	- scutthesis.lyx直接调用cover/thesis_front.pdf
	- 去除scutthesis.cls默认博士论文格式，可以传入master选项修改为硕士论文格式。
	- 补充完善README.txt

附言
-----------------

	当前还没很好的lyx软件学习文档，建议参阅lyx自带的help->tutorial。同时scutthesis项目还在更新完善中，有些bug和配置文档将陆续发布，望关注
	如有使用问题、建议和bugs欢迎提出来交流，可email给作者。
	最后，号召应该加入的同学加入该项目。

