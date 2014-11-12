% Copyright (C) 2010-2011 by Alwin Tsui <alwintsui@gmail.com>
% and Quansheng Guan <qshguan@gmail.com>
% 
% This file is part of the scutthesis package project.
% http://scutthesis.googlecode.com/
% ---------------------------------------------------
% This file may be distributed and/or modified under the
% conditions of the GNU General Public License v3
% of this license or (at your option) any later version.
% 
% modified from thuthesis.cls,seuthesis.cls and tjthesis.cls

% 本cls只对中文摘要开始的格式进行设置，至于论文签名的标题，版权声明等，建议到研究生院下载doc版本，
% 填写好转换为pdf格式，再用pdfpages宏include进latex文档。

%% Jun 19,2010.参照现有国内各高校论文latex模板(东南，清华，北航等)，取其精华去其糟粕，写成初版
%% Jun 20,2010,修改abstract,keywords,Appendence支持lyx的scutthesis.layout
%% Jun 22,2010,用natbib来控制引用标的显示
%% v2.0.1, Mar 31,2011,合并了Quansheng Guan部分修改,主要包含：草稿引入水印，加入定理环境，完善标题、表格和程序代码等格式


\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{scutthesis}[2011/03/31 2.0.1 The LaTeX class for the thesis of South China University of Technology]

%% import global options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifmasterdegree\masterdegreefalse %默认为doctor
\newif\ifpdfcover\pdfcoverfalse % To do
\newif\ifdraftmode\draftmodefalse % added by Quansheng Guan, 初稿加上水印背景
\DeclareOption{draftmode}{\draftmodetrue} % added by Quansheng Guan

\DeclareOption{master}{\masterdegreetrue}
\DeclareOption{pdfcover}{\pdfcovertrue} %using pdfcover,TOdo

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax %revised by Quansheng Guan \ProcessOptions
\LoadClass[12pt,a4paper,openany]{book}

\newif\ifonepage\onepagefalse

%% define 几个宏
\newcommand{\scutthesis}{%
  S\hspace{-0.3ex}\raisebox{-0.5ex}{C}\hspace{-0.3ex}U\hspace{0.1em}\raisebox{-0.5ex}{T}%
  \textsc{Thesis}
}
\ifmasterdegree \newcommand{\@degree}{硕士} \else \newcommand{\@degree}{博士} \fi
\newcommand{\thesissubject}{华南理工大学\@degree{}学位论文}
\renewcommand{\today}{\the\year~年~\the\month~月~\the\day~日}


%% 加载几个常用的sty packages
\RequirePackage{ifpdf}
\RequirePackage{ifthen}
\RequirePackage{doc}
\RequirePackage{keyval}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{indentfirst}
\RequirePackage{makeidx} % 索引
\RequirePackage{amssymb} %this package conflicts with xeCJK, place it before xeCJK to avoid the coflict.
\RequirePackage[final]{pdfpages}
\RequirePackage{color}
%\RequirePackage{prettyref} %不需要
\ifdraftmode 
   \RequirePackage{draftwatermark} %  added by Quansheng Guan, 初稿加上水印背景
   \SetWatermarkText{初稿\small\today}
\fi

%% 设置页面布局
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[left=2.5cm,right=2.5cm,bottom=2.5cm,top=2.5cm,%设置页面上下左右各为25mm
 headheight=1.5cm,%页眉所占高度
 footskip=1cm %页脚所占高度
]{geometry}

%% 字体设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[BoldFont, SlantFont, CJKnumber]{xeCJK} % xeCJK package
%\punctstyle{kaiming}
\setmainfont[Mapping=tex-text]{Times New Roman}%\rmfamily 使用的字体,默认英文和数字的字体。
\XeTeXlinebreaklocale "zh" %采用中文断行方式
\XeTeXlinebreakskip = 0pt plus 1pt %字元间可加入0pt~1pt 的弹性间距，这样才能排出左右对齐的段落。

\setCJKmainfont{SimSun}
\setCJKfamilyfont{song}{SimSun}
\setCJKfamilyfont{hei}{SimHei}
\setCJKfamilyfont{kai}{KaiTi_GB2312}
\setCJKfamilyfont{fang}{FangSong_GB2312}

\newcommand{\songti}{\CJKfamily{song}}
\newcommand{\heiti}{\CJKfamily{hei}}
\newcommand{\kaiti}{\CJKfamily{kai}}
\newcommand{\fangsong}{\CJKfamily{fang}}

%% Font size
\newcommand{\chuhao}{\fontsize{42pt}{46pt}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}{40pt}\selectfont}
\newcommand{\yichu}{\fontsize{32pt}{36pt}\selectfont}
\newcommand{\yihao}{\fontsize{28pt}{32pt}\selectfont}
\newcommand{\erhao}{\fontsize{21pt}{24pt}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{20}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75pt}{18pt}\selectfont}
%\newcommand{\xiaosanhao}{\fontsize{15bp}{18pt plus .3pt minus .2pt}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{22.5pt}\selectfont}%1.5
\newcommand{\sihao}{\fontsize{14pt}{16pt}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{14pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{13pt}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9pt}{11pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{9pt}\selectfont}
\newcommand{\xiaoliuhao}{\fontsize{6.5pt}{7.5pt}\selectfont}
\newcommand{\qihao}{\fontsize{5.5pt}{6.5pt}\selectfont}

% 中文段首缩进
\newlength\CJK@twochars %set \CJK@twochars zero
\def\CJK@spaceChar{\Unicode{48}{7}}
\def\CJKindent{%
    \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}%
    \parindent\CJK@twochars}
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}} % 中文破折号,added by Quansheng

% 报警处理
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%不要拉大行距使得页面充满
\raggedbottom
% 去掉页面中的badboxes报警，同上
% \setlength\parskip{.5\baselineskip
% 	plus .1\baselineskip
% 	minus .4\baselineskip
% }
\hbadness=10000 \tolerance=10000 \hfuzz=150pt % 去掉表格中的badboxes报警,看着不爽

% My fonts for Scut thesis
\renewcommand{\normalsize}{\xiaosihao\songti\normalfont} % Normal font size 小四号宋体
\newcommand{\absnamecn}{\heiti\xiaoerhao}         % 中文“摘要”字样的字体
\newcommand{\abskeycn}{\heiti\xiaosihao}       % 中文摘要“关键字”字样的字体
\newcommand{\abskeyscn}{\songti\xiaosihao\normalfont} % 中文摘要关键字的字体
\newcommand{\absnameen}{\heiti\xiaosihao}               % 英文``Abstract''字样的字体
\newcommand{\abskeyen}{\bfseries\xiaosihao}   % 英文``KEY WORDS''字样的字体
\newcommand{\abskeysen}{\songti\xiaosihao\normalfont}        % 英文关键字的字体
\newcommand{\headfont}{\songti\wuhao\normalfont} 	% 页眉字体
\newcommand{\toctitlefont}{\heiti\xiaoerhao}            % “目录”字样的字体
\newcommand{\tocchapterfont}{\heiti\xiaosihao} % 目录上第X章的字体
\newcommand{\tocsectionfont}{\normalsize}         % 目录上X.Y节的字体
\newcommand{\tocsubsectionfont}{\normalsize}      % 目录上X.Y.Z小节的字体
\newcommand{\tocsubsubsectionfont}{\normalsize}      % 目录上X.Y.Z小节的字体
\newcommand{\textchapterfont}{\centering\heiti\xiaoerhao} % 正文上第X章的字体
\newcommand{\textsectionfont}{\heiti\xiaosanhao}            % 正文上X.Y节的字体
\newcommand{\textsubsectionfont}{\heiti\sihao}     % 正文上X.Y.Z小节的字体
\newcommand{\textsubsubsectionfont}{\heiti\xiaosihao}     % 正文上X.Y.Z.K小节的字体
\newcommand{\footnotefont}{\songti\xiaowuhao\normalfont}     % 脚注字体
\newcommand{\ftcaptionfont}{\kaiti\wuhao\normalfont}         % 图表标题的字体
\newcommand{\reftitlefont}{\heiti\xiaoerhao}      % “参考文献”字样的字体
\newcommand{\refbodyfont}{\songti\wuhao\normalfont}          % 参考文献字体
\newcommand{\thanktitlefont}{\heiti\sanhao}    % “致谢”字样的字体
\newcommand{\appendixtitlefont}{\heiti\sanhao} % “附录”字样的字体
%\normalfont command (essentially) executes the command sequence:
%  \fontencoding{\encodingdefault}
%  \fontfamily{\familydefault}
%  \fontseries{\seriesdefault}
%  \fontshape{\shapedefault}
%  \selectfont



%% 图表环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%图题(由图号和图名组成)。图号为“图1-1”格式。图题置于图下，有图注或其他说明时应置于图题之上。
%表序与表名置于表上。
%图题和表题在lyx中插图或插表时，可以参照标题的位置，在上还是在下。

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png} % 如果插入的图片没有指定扩展名,那么依次搜索下面的扩展名所对应的文件
\RequirePackage{subfig} % config兼容subfigure命令
\RequirePackage{float} % 可以使用［H］命令
%\RequirePackage{ccaption}  %与subfig冲突，弃用
\RequirePackage{caption} % 定义图的标题格式：居中. 使用caption3.0
\DeclareCaptionFont{capFont}{\ftcaptionfont} % 表格名及图名
\DeclareCaptionLabelSeparator{twospace}{~~}
\captionsetup{ labelsep=twospace,% 去掉图标签后的冒号
  belowskip=0bp,aboveskip=0bp,
  font={capFont}, figurename=图,tablename=表,listfigurename=插图目录,listtablename=表格目录}
\captionsetup[figure]{position=bottom}
\captionsetup[subfloat]{captionskip=6bp,nearskip=0bp,farskip=0bp,topadjust=0bp,justification=centering}
%%%%%%%%%%定义双标题命令
\newcommand{\FigureBicaption}[2]{
  \renewcommand{\figurename}{图}
  \vspace{8pt}
  \caption{#1}
  \addtocounter{figure}{-1}
  \renewcommand{\figurename}{Fig.}
  \captionsetup{list=false}
  \vspace{6pt}
  \caption{#2}
  \captionsetup{list=true}
  \renewcommand{\figurename}{图}
}
\newcommand{\SubfloatCaption}[4]  % Two Parameters, the first one is the width of the subfigure,
{
  \subfloat[#2]{
    \label{#3}
    \addtocounter{subfigure}{-1} 
    \subfloat[\vspace{-5pt}#1]{#4}
  }%
}
 


%% 表格 
\RequirePackage{array} % 扩展了 array 和 tabular 环境功能
\RequirePackage{booktabs} % 增加对三线表格的支持 % \toprule，\midrule，\bottomrule
\usepackage{longtable} % 长表格支持，截断跨页
\RequirePackage{ctable, threeparttable} % 支持表格注释,复杂表格，一般用不上
\RequirePackage{slashbox} % 表格中的反斜线
%\RequirePackage{tabularx}
\captionsetup[table]{position=top}
%定义双标题命令
\newcommand{\TableBicaption}[2]{
  \renewcommand{\tablename}{表}
  \vspace{8pt}
  \caption{#1}
  \vspace{6pt}
  \addtocounter{table}{-1}
  \renewcommand{\tablename}{Table}
  \captionsetup{list=false}
  \caption{#2}
  \captionsetup{list=true}
  \renewcommand{\tablename}{表}
}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

\renewcommand{\thefootnote}{注\arabic{footnote}} \setcounter{footnote}{0}

\renewcommand\fps@figure{htbp} % 设置图浮动的默认参数
\renewcommand\fps@table{htbp}

\renewcommand{\textfraction}{0.07}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\floatpagefraction}{0.85}

%% 列表
%\RequirePackage{enumitem}
%\setlist{noitemsep,nolistsep,topsep=0pt,itemindent=1em}
%\setenumerate[1]{label=\arabic*), ref=\arabic*}
%\setenumerate[2]{label=\emph{\alph*}),ref=\theenumi.\emph{\alph*}}
%\setenumerate[3]{label=\roman*), ref=\theenumii.\roman*}
% Ref: http://bbs.ctex.org/viewthread.php?tid=52331&page=1
% \setitemize{itemindent=38pt,leftmargin=0pt,itemsep=0ex,listparindent=26pt,partopsep=0pt,parsep=\parskip,topsep=-0.25ex}
% \setenumerate{itemindent=38pt,leftmargin=0pt,itemsep=0ex,listparindent=26pt,partopsep=0pt,parsep=\parskip,topsep=-0.25ex}
% \setdescription{itemindent=38pt,leftmargin=0pt,itemsep=0ex,listparindent=26pt,partopsep=0pt,parsep=\parskip,topsep=-0.25ex}

\RequirePackage{paralist}% 修改列表格式
\setdefaultenum{1)}{a)}{i.}{A.}% 设置列表模式,for \enumerate
\setdefaultleftmargin{4ex}{}{}{}{}{}%standard \itemize :• – ∗ ·

\RequirePackage[numbers,super,square,sort&compress]{natbib} % 修改引用参考文献格式
% 用natbib代替下面的一些设置
%\let\originalcite=\cite
%\renewcommand{\cite}[1]{\textsuperscript{\originalcite{#1}}}
%\renewcommand{\citet}[1]{\originalcite{#1}}

%% 程序代码格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[ruled,vlined,algochapter]{algorithm2e}
% algorithm2e 中文标题定制
\renewcommand{\algorithmcfname}{算法}
\renewcommand\thealgocf{\csname the\algocf@within\endcsname-\@arabic\c@algocf}%

\RequirePackage{listings}
\lstset{
  tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle=\footnotesize, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  %aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  % texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=false
  numbersep=-1em
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头 added by Guan

%参考文献bibi style
%%%%%%%%%%%%%%%%%%%%%%
%\bibliographystyle{scutthesis}
%\renewcommand\@biblabel[1]{#1}  % Reference list option change from [1] to 1
\let\orig@bibliography=\bibliography
\renewcommand{\bibliography}[1]{
	\clearpage % 使参考文献使用 seunolabel 页面样式
	\refbodyfont
	\orig@bibliography{#1}
	\normalsize
} 

\RequirePackage{array} % 扩展了 array 和 tabular 环境功能
\RequirePackage[nottoc]{tocbibind} % 将参考文献、索引、表格目录和图形
\renewcommand{\bibname}{参考文献}

% 设置目录
%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc} 
\renewcommand\contentsname{\centerline{\toctitlefont{目\quad{}录}}}
\titlecontents{chapter}[0ex]{\tocchapterfont}{%
    第\CJKnumber{\thecontentslabel}章\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{section}[1em]{\tocsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{subsection}[2em]{\tocsubsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{subsubsection}[3em]{\tocsubsubsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%

% 设定章节深度和目录深度
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}

% Text style
%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[pagestyles, rm]{titlesec}%调用titlesec涵盖fancyhdr的功能
\renewcommand{\chaptername}{第\CJKnumber{\thechapter}章}
\titleformat{\chapter}[hang]{\textchapterfont}{第\CJKnumber{\thechapter}章}{1em}{}
\titleformat{\section}[hang]{\textsectionfont}{\thesection}{1em}{}
\titleformat{\subsection}[hang]{\textsubsectionfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[hang]{\textsubsectionfont}{\thesubsubsection}{1ex}{}% 小四黑体居左

%\titlespacing{\chapter}{0pt}{3ex plus .5ex minus .5ex}{3ex plus .5ex minus .5ex} % 缩短章节标题的上边距
\setlength{\parskip}{0ex}% 正文段前段后距：无空行
\titlespacing{\chapter}{0pt}{-20pt}{1pt} % 缩短章标题上间距，revised by Quansheng Guan
\titlespacing{\section}{0pt}{1pt}{1pt}  % 标题间距
\titlespacing{\subsection}{0pt}{4pt}{0pt} 
\titlespacing{\subsubsection}{0pt}{6pt}{6pt} 

\newcommand{\linespacing}[1]{\linespread{#1}\selectfont}% 行距命令

%\sethead[ even-left ][ even-center ][ even-right ]    { odd-left }{ odd-center }{ odd-right }
\newpagestyle{revtitlestyle}{
  \sethead[][{\headfont{}\thesissubject}][] % 页眉偶数页，五号字体，居中
  {}{{\headfont{}\chaptertitlename\quad\chaptertitle}}{} % 页眉奇数页，五号字体，居中
  \setfoot{}{\headfont{}\thepage}{}%页码五号宋体居中
  \headrule%上横线
  \setheadrule{1.5pt}%设置横线粗细

}
% added by Quansheng Guan
% page style for chapters without label number
\newpagestyle{nolabelchapterstyle}{
    \sethead[][{\headfont{}\thesissubject}][] % 页眉偶数页，五号字体，居中
    {}{{\headfont\chaptertitle}}{} % 页眉奇数页，五号字体，居中, no label
    \setfoot{}{\headfont{}\thepage}{}%页码五号宋体居中
    \headrule%上横线
    \setheadrule{1.5pt}%设置横线粗细
} 

\newpagestyle{appendix_style}{ %针对附录的特殊要求，以section而不是chapter为页眉。
    \sethead[][{\headfont{}\thesissubject}][] % 页眉偶数页，五号字体，居中
    {}{{\headfont\thesection\quad\sectiontitle}}{} % 页眉奇数页，五号字体，居中, no label
    \setfoot{}{\headfont{}\thepage}{}%页码五号宋体居中
    \headrule%上横线
    \setheadrule{1.5pt}%设置横线粗细
} 

\newpagestyle{frontstyle}{ 
  \setfoot{}{\thepage}{}
}
%%%%%%
\newcommand{\myclearpage}{%
  \ifonepage
    \clearpage
  \else
    \cleardoublepage
  \fi
}

\renewcommand\frontmatter{
    %\@frontmattertrue % added by Quansheng Guan
    \pagestyle{empty}  % added by Quansheng Guan 摘要之前的部分不需要页码
    \myclearpage
    \pagenumbering{Roman}% Roman style page number
    % added by Quansheng Guan
    \let\ps@plain=\ps@frontstyle
    \pagestyle{plain}
	\@mainmatterfalse
}%

\renewcommand\mainmatter{%
  \@mainmattertrue
  \ifodd \arabic{page} % 目录后如果是奇数页结尾，则插入一个无页码空白页
   \clearpage
   \pagestyle{empty}
   \mbox{} %空白占位符
  \fi
  \clearpage
  \pagenumbering{arabic}
   % the original plainstyle is revised to add the pagehead to the first page in a chapter 
   % the default style of the first page is plain. 
   % \pagestyle{yourstyle} can be used to define the style of other pages,
   % or keep the same as plain.
   \let\ps@plain=\ps@revtitlestyle
  \pagestyle{revtitlestyle} % revised by Quansheng Guan 
  %\pagestyle{plain} 
  % 开始正文部分
}
\renewcommand\backmatter{%
  % there is no label number for reference chapter
 \let\ps@plain=\ps@nolabelchapterstyle
  \pagestyle{plain} % revised by Quansheng Guan 
}
%==========
\AtBeginDocument{\CJKindent{}%
    \makeindex%
    \normalsize%正文字体格式
    \linespacing{1.682}% 主行距～1.5倍
  }
\AtEndDocument{}
%------------------
\newcommand{\preface}[1]{%
  \chapter*{#1}
  \addcontentsline{toc}{chapter}{#1}
}

\newenvironment{abstractCn}{
  \chapter*{摘\quad 要}
  \addcontentsline{toc}{chapter}{摘要} 
}{}

\newcommand{\keywordsCn}[1]{
  \par
 \vspace{1em}
  \newcommand{\@keywords}{#1}
  {\noindent\abskeycn 关键词：} {\abskeyscn \@keywords} % \noindent去掉缩进 
}
  
\newenvironment{abstractEn}
{
  \chapter*{Abstract}
  \addcontentsline{toc}{chapter}{Abstract}
}{
}

\newcommand{\keywordsEn}[1]{
  \par
 \vspace{1em}
  {\noindent\abskeyen Keywords:} {\abskeysen #1} % \noindent去掉缩进
}

\renewcommand{\appendix}[1]{%
  %\myclearpage % commented by Quansheng Guan
  % added by Quansheng Guan
  % \chaptertitle is not available for those chapters without label number.
  \renewpagestyle{plain}{
    \sethead[][{\headfont{}\thesissubject}][] % 页眉偶数页，五号字体，居中
    {}{{\headfont{#1}}}{} % 页眉奇数页，五号字体，居中
    \setfoot{}{\headfont{}\thepage}{}%页码五号宋体居中
    \headrule%上横线
    \setheadrule{1.5pt}%设置横线粗细
  }

   \renewcommand{\thesection}{{#1}\arabic{section}} 
   \chapter*{#1}
   \addcontentsline{toc}{chapter}{#1}
   \setcounter{section}{0}

}

%examples:
%\appendix{附\quad 录}% 
%\section{随机数的生成}%
%\appendix{攻读博士学位期间取得的研究成果}
%\appendix{致\quad 谢}%

% added by Quansheng Guan
\renewenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\renewenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\renewenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%\vspace{-15pt}
                \item\relax}
               {\endlist}
            
%%定理环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{bm} % 数学符号粗体
%\RequirePackage[amsmath,thmmarks]{ntheorem}
\RequirePackage{amsmath,amsthm,mathrsfs} 
%允许公式换页显示,否则大型推导公式都在一页内，
%一页显示不下放到第二页，导致很大的空白空间，很不好看
\allowdisplaybreaks[4]
%\setlength\jot{1pt} %公式之间的距离,TODO

\newtheoremstyle{definition}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{definition}
\newtheorem{definition}{定义~}[chapter]
\newtheorem{example}{例~}[chapter]
\newtheorem{remark}{说明~}[chapter]


\newtheoremstyle{plain}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {\itshape}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
\newtheorem{proposition}{命题~}[chapter]
\newtheorem{lemma}{引理~}[chapter]
\newtheorem{theorem}{定理~}[chapter]
\newtheorem{axiom}{公理~}[chapter]
\newtheorem{corollary}{ 推论~}[chapter]
\newtheorem{case}{情形~}[chapter]
\newtheorem{conjecture}{猜想~}[chapter]
\newtheorem{property}{性质~}[chapter]

\renewenvironment{proof}{\vskip 1pt\indent \itshape 证明:~\normalfont}{\hfill$\square$\vskip 0.01\baselineskip} %$\blacksquare$
%\renewcommand{\proofname}{\hskip 2em 证明:~} % 
%%%%%%%%%%%%%%%%%   end of 定理环境
\setlength\abovedisplayskip{4pt}
\setlength\belowdisplayskip{4pt}

\endinput
%% End of file `scutthesis.cls'.
