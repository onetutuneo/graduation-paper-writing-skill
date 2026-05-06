\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs,upgreek,array, mathrsfs, times,indentfirst,multirow}
\RequirePackage{fancyhdr}

%依赖的Latex版本
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
%声明本文档为模板类
\ProvidesClass{BJTU-thesis}

%根据用户选项LoadClass
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\if@isTwoSide\@isTwoSidefalse
\DeclareOption{twoside}{\@isTwoSidetrue}
\ProcessOptions\relax
\if@isTwoSide
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
\LoadClass[zihao=-4,a4paper,oneside,openright,UTF8,space=auto]{ctexbook}
\fi

\setCJKfamilyfont{STzhongsong}{STzhongsong.ttf}[Path=]
\newcommand{\STzhongsong}{\CJKfamily{STzhongsong}}

%定义使用者需要填写的标签
\def\BJTU@label@schoolNumber{学校代码:~}
\def\BJTU@label@classification{密级:~}
\def\BJTU@label@author{作者姓名:~}
\def\BJTU@label@school{学院:~}
\def\BJTU@label@studentNumber{学~~~~~~号:~}
\def\BJTU@label@advisor{导师姓名:~}
%\def\BJTU@label@advisorTitle{职~~~~~~称:~}
\def\BJTU@label@secadvisor{副导师姓名:}
%\def\BJTU@label@secadvisorTitle{职~~~~~~称:~}
%\def\BJTU@label@engineeringMasterField{专业学位类别（领域）:~}
\def\BJTU@label@degreeLevel{学位级别:~}
\def\BJTU@label@degreeType{学位类别:~}
\def\BJTU@label@major{专业:~}

%定义上述标签的默认值
\def\BJTU@value@schoolNumber{10004}
\def\BJTU@value@classification{公开}
\def\BJTU@value@author{请输入作者姓名}
\def\BJTU@value@studentNumber{请输入学号}
\def\BJTU@value@advisor{请输入指导教师}
%\def\BJTU@value@advisorTitle{ }
\def\BJTU@value@secadvisor{ }
%\def\BJTU@value@secadvisorTitle{ }
%\def\BJTU@value@engineeringMasterField{ }
\def\BJTU@value@degreeType{请输入学位类别}
\def\BJTU@value@major{请输入专业}
\def\BJTU@value@school{请输入学院}
\def\BJTU@value@title{中文题目}
\def\BJTU@value@englishtitle{英文题目}

%定义用户填写上述标签对应值的命令,需要用户在主文档自行调用
\newcommand\schooNumber[1]{\def\BJTU@value@schoolNumber{#1}}
\newcommand\classification[1]{\def\BJTU@value@classification{#1}}
\renewcommand\author[1]{\def\BJTU@value@author{#1}}
\newcommand\studentNumber[1]{\def\BJTU@value@studentNumber{#1}}
\newcommand\advisor[1]{\def\BJTU@value@advisor{#1}}
\newcommand\advisorTitle[1]{\def\BJTU@value@advisorTitle{#1}}
\newcommand\secadvisor[1]{\def\BJTU@value@secadvisor{#1}}
\newcommand\secadvisorTitle[1]{\def\BJTU@value@secadvisorTitle{#1}}
\newcommand\engineeringMasterField[1]{\def\BJTU@value@engineeringMasterField{#1}}
\newcommand\degreeType[1]{\def\BJTU@value@degreeType{#1}}
\newcommand\major[1]{\def\BJTU@value@major{#1}}
\newcommand\school[1]{\def\BJTU@value@school{#1}}
\newcommand\researchArea[1]{\def\BJTU@value@researchArea{#1}}
\newcommand\englishtitle[1]{\def\BJTU@value@englishtitle{#1}}
\renewcommand\title[1]{\def\BJTU@value@title{#1}}
\newcommand\datetime[1]{\def\BJTU@label@datetime{#1}}


\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{L}[1]{>{\raggedleft\arraybackslash}p{#1}}

\let\ps@plain\ps@Newheading

\newcommand{\centerchapter}[1]{%
  \clearpage
  \thispagestyle{abstractheading}%
  \pagestyle{abstractheading}%
  \markboth{#1}{}
  \vspace*{\smallskipamount}
  \noindent
  \makebox[\linewidth]{\heiti \zihao{-2} #1}\par
  \vspace{24pt} % afterskip
}

\fancypagestyle{no-footer1}{
	\fancyhf{}
	\fancyhead[L]{
	{\hspace*{0.8em}\zihao{4}\STzhongsong{北京交通大学毕业论文（设计）}}
	}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\headrule}{
    \hrule width\headwidth height 1pt \vskip 1pt
    \hrule width\headwidth height 2.5pt
    }
    \fancyhead[R]{\zihao{4}\STzhongsong{版权使用授权书}\hspace*{0.8em}}
	\fancyfoot[C]{}
}
%版权授权书
\newcommand{\makeAuthorization}
{\newpage
\thispagestyle{no-footer1}
\markboth{学士论文版权使用授权书}{学士论文版权使用授权书}
\vspace*{\smallskipamount}
\begin{center}
{{\heiti\zihao{-2}{学士论文版权使用授权书}}}
\end{center}
\vspace{24pt}
\setlength{\baselineskip}{20pt}

本学士论文作者完全了解北京交通大学有关保留、使用学士论文的规定。特授权北京交通大学可以将学士论文的全部或部分内容编入有关数据库进行检索，提供阅览服务，并采用影印、缩印或扫描等复制手段保存、汇编以供查阅和借阅。
\\
\begin{center}
（保密的学位论文在解密后适用本授权说明）
\end{center}

\par\vspace{5\baselineskip}

学位论文作者签名：~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~指导教师签名：
\\

签字日期：~~~~~~~~~~~年~~~~~~~~月~~~~~~~~日~~~~~~~~~~~~~~~~~签字日期：~~~~~~~~~~~~年~~~~~~~~月~~~~~~~~日 
}


%诚信声明
\fancypagestyle{no-footer2}{
	\fancyhf{}
	\fancyhead[L]{
	{\hspace*{0.8em}\zihao{4}\STzhongsong{北京交通大学毕业论文（设计）}}
	}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\headrule}{
    \hrule width\headwidth height 1pt \vskip 1pt
    \hrule width\headwidth height 2.5pt
    }
    \fancyhead[R]{\zihao{4}\STzhongsong{论文诚信声明}\hspace*{0.8em}}
	\fancyfoot[C]{}
}
\newcommand{\Statement}{
\newpage
\thispagestyle{no-footer2}
\markboth{学士论文诚信声明}{学士论文诚信声明}
\vspace*{\smallskipamount}
\begin{center}
{{\heiti\zihao{-2}{学士论文诚信声明}}}
\end{center}
\vspace{24pt}
\setlength{\baselineskip}{20pt}

本人声明所呈交的毕业论文（设计），题目\uline{\BJTU@value@title}是本人在指导教师的指导下，独立进行研究工作所取得的成果。尽我所知，除了文中特别加以标注和致谢中所罗列的内容以外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得北京交通大学或其他教育机构的学位或证书而使用过的材料。
    
申请学位论文与资料若有不实之处，本人承担一切相关责任。
\\

本人签名：\underline{\hbox to 50mm{}}~~~~~~~~日期：\underline{\hbox to 50mm{}}
\newpage
}

% 定公式、图、表编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}


\fancypagestyle{abstractheading}{
	\fancyhf{}
	\fancyhead[L]{
	{\hspace*{0.8em}\zihao{4}\STzhongsong{北京交通大学毕业论文（设计）}}
	}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\headrule}{
    \hrule width\headwidth height 1pt \vskip 1pt
    \hrule width\headwidth height 2.5pt
    }
	\fancyhead[R]{\zihao{4}\STzhongsong{\leftmark}\hspace*{0.8em}}%
    \setlength{\headsep}{0.9cm} %{0.9cm}
    \setlength{\footskip}{0.8cm}%{0.8cm}
    
	\fancyfoot[C]{\thepage}
}
\newenvironment{abstract}{
    \centerchapter{中文摘要}
	\markboth{中文摘要}{中文摘要}
	\addcontentsline{toc}{chapter}{中文摘要}
   
}{}



\renewenvironment{thanks}{
 \centerchapter{致\hspace{2em}谢}
   \markboth{致谢}{致谢}
	\addcontentsline{toc}{chapter}{致\hspace{2em}谢}
}{}


\newenvironment{englishabstract}{
\centerchapter{ABSTRACT}
	\markboth{英文摘要}{英文摘要}
	\addcontentsline{toc}{chapter}{ABSTRACT}
   
}{}


\renewenvironment{appendix}{
	 \centerchapter{附\hspace{2em}录}
   \markboth{附录}{}
	\addcontentsline{toc}{chapter}{附\hspace{2em}录}
}{}

%定义中英文关键词命令
\newcommand{\keywords}[1]{\textbf{关键词：}#1}
\newcommand{\englishkeywords}[1]{\textbf{KEYWORDS:~}#1}


%%定义正文的页眉页脚格式
\fancypagestyle{Newheading}{
	\fancyhf{}
	\fancyhead[L]{
	{\hspace*{0.8em}\zihao{4}\STzhongsong{北京交通大学毕业论文（设计）}}
	}
    
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\headrule}{
    \hrule width\headwidth height 1pt \vskip 1pt
    \hrule width\headwidth height 2.5pt
    }
    \fancyhead[R]{\zihao{4}\STzhongsong{正文}\hspace*{0.8em}}%
    
    \setlength{\headsep}{0.7cm} 
    \setlength{\footskip}{0.8cm}
	\fancyfoot[C]{\thepage}
}


%%设置页边距和装订线
\usepackage[
top=3.1cm,
bottom=2.9cm,
left=2.5cm,
right=2.5cm,
bindingoffset=0cm,
headheight=1.5cm,footskip=1.75cm
]{geometry}



%% 一级标题
\ctexset{
chapter={
		name={},
        aftername=\hspace{0.5em},
		number = {\arabic{chapter}},
		format = { \heiti  \zihao{3}},
        pagestyle = Newheading,
		beforeskip = 24pt,
		afterskip = 24pt,
		fixskip = true,
	},
%% 二级标题
section={
		format={\raggedright \heiti  \zihao{-3}},
		aftername=\hspace{0.5em},
        beforeskip={30pt},
        afterskip={24pt},
		fixskip = true,
	},
% 三级标题格式
subsection={
		format = { \heiti \raggedright \zihao{4}},
		aftername=\hspace{0.5em},
        beforeskip={30pt},
        afterskip={24pt},
		fixskip = true,
	},
% 四级标题格式（不用）
subsubsection={
		format={\heiti \raggedright \zihao{4}},
		aftername=\hspace{0.5em},
        beforeskip={24pt},
        afterskip={24pt},
		fixskip=true,
	},
}



%目录
\ifxetex  % xelatex
\RequirePackage[xetex]{hyperref}
\hypersetup{
	bookmarksnumbered,
	colorlinks=true,
	linkcolor=black,
	citecolor=black,
	plainpages=false,
	pdfstartview=FitH
}
\else
\ifpdf
\RequirePackage[pdftex,unicode]{hyperref}
\hypersetup{
	bookmarksnumbered,
	colorlinks=true,
	linkcolor=black,
	citecolor=black,
	plainpages=false,
	pdfstartview=FitH
}
\else
\RequirePackage[dvipdfmx,unicode]{hyperref}
\hypersetup{
	bookmarksnumbered,
	colorlinks=true,
	linkcolor=black,
	citecolor=black,
	plainpages=false,
	pdfstartview=FitH
}
\fi
\fi

\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\heiti \zihao{-4}}
{\thecontentslabel\hspace{0.5\ccwd}}{}
{\hspace{.5em}\vspace{2.7bp}\titlerule*{.}\contentspage}

\titlecontents{section}[1\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{0.5\ccwd}}{}
{\hspace{.5em}\vspace{2.7bp}\titlerule*{.}\contentspage}

\titlecontents{subsection}[2\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{0.5\ccwd}}{}
{\hspace{.5em}\vspace{2.7bp}\titlerule*{.}\contentspage}

\titlecontents{figure}[0pt]{\songti\zihao{-4}}
{\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\vspace{2.7bp}\titlerule*{.}\contentspage}

\titlecontents{table}[0pt]{\songti\zihao{-4}}
{\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\vspace{2.7bp}\titlerule*{.}\contentspage}

\renewcommand\tableofcontents{%
	 \centerchapter{目\hspace{2em}录}
     \markboth{目录}{}
	\pdfbookmark[0]{目录}{bittoc}
	\@starttoc{toc}%
}






% 参考文献中 url 的设置
\usepackage{hyperref}
\urlstyle{same} %设置超链接的字体为times


%%定义制作论文封面命令
\newcommand{\makecover}{
	\newpage\thispagestyle{empty}
    
	\begin{figure}
    \vspace{1.25cm}%\vspace{31.2pt}
		\centering
		\includegraphics*[]{logo.png}
    \vspace{0.5cm}%\vspace{21pt}
	\end{figure}
    
	\begin{center}
		{\songti\zihao{2}\bfseries{本科毕业论文（设计）}\\}	
        \vspace{48pt}% \vspace{70pt}

        {\heiti\zihao{-2}\bfseries\BJTU@value@title\\}
		\vspace{18pt}
        {\zihao{-2}\bfseries\BJTU@value@englishtitle\\}
       \vspace{48pt}%  \vspace{70pt}
		\begin{tabular}{l C{6.5cm}}
        {\songti\zihao{3}学~~~~~~~~院：}&{\songti\zihao{3}\BJTU@value@school}\\
        \cline{2-2}   
			\\
            {\songti\zihao{3}专~~~~~~~~业：}&
                     {\songti\zihao{3}\BJTU@value@major}\\\cline{2-2}
			\\
			{\songti\zihao{3}学生姓名：}&{\songti\zihao{3}\BJTU@value@author}\\\cline{2-2}
			\\
            {\songti\zihao{3}学~~~~~~~~号：}&{\songti\zihao{3}\BJTU@value@studentNumber}\\\cline{2-2}
			\\
			{\songti\zihao{3}指导教师：}&{\songti\zihao{3}\BJTU@value@advisor}\\\cline{2-2}
                \\
		\end{tabular}
		\\
		\vspace{25pt}
		{\songti\bfseries\zihao{-3}北京交通大学}\\\vspace{14pt}
        {\zihao{4}\BJTU@label@datetime}
	\end{center}
}


%% graphics packages
\RequirePackage{graphicx}
%% 并列子图
\RequirePackage{subfigure}

\RequirePackage{wrapfig}
%%===========================设置图表标题选项==========================
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\zihao{5}}
\captionsetup{
	font = {fontsize},
	labelsep = zhspace,
}
\captionsetup[table]{
	position = top,
	aboveskip = 6bp,
	belowskip = 6bp,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
	position = bottom,
	aboveskip = 6bp,
	belowskip = 6bp,
}

%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
% ccaption -- bicaption
%\RequirePackage{ccaption}
%\captiondelim{\ }
%\captionnamefont{\songti\zihao{5}}
%\captiontitlefont{\songti\zihao{5}}


%% sort and compress citations
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
\newcommand{\zcite}[1]{\scalebox{1.5}[1.5]{\raisebox{-0.8ex}{\cite{#1}}}}
% \RequirePackage[numbers,super]{gbt7714}
% \newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}} 
% \newcommand{\upupcite}[1]


% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


% 定公式、图、表编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

\captionsetup[figure][bi-second]{name=Figure} %设置图的英文编号前缀
\captionsetup[table][bi-second]{name=Table} %设置表的英文编号前

% 颜色宏包
\RequirePackage{xcolor}


% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% listings 源代码显示宏包
\RequirePackage{listings}
\lstset{tabsize=4, %
	frame=single, %把代码用带有阴影的框圈起来
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
	aboveskip=1em, %代码块边框
	%% added by http://bbs.ctex.org/viewthread.php?tid=53451
	fontadjust,
	captionpos=t,
	framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
	xleftmargin=2em,xrightmargin=0em, % 设定listing左右的空白
	texcl=true,
	% 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
	extendedchars=false,columns=flexible,mathescape=true
	numbersep=-1em
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头

%% enumerate 列表环境间距调节
\usepackage{enumitem}

%_  参考文献风格 added by wei.jianwen@gmail.com
\bibliographystyle{GBT7714-2005NLang}


%_ 参考文献环境
\renewenvironment{thebibliography}[1]
{\zihao{5}
	\centerchapter{\bibname}
	\addcontentsline{toc}{chapter}{参考文献}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		 \setlength{\baselineskip}{16pt}
		\setlength{\parsep}{-0.5mm}
		\setlength{\labelsep}{0.5em}
		%\setlength{\itemsep}{0.5pc}
		\setlength{\listparindent}{0in}
		\setlength{\itemindent}{0in}
		\setlength{\rightmargin}{0in}
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist}


   