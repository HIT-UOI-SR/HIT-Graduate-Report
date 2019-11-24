\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hitgsrep}[report template for graduate student in Harbin Institute of Technology]

\RequirePackage{ifthen}
\RequirePackage{etoolbox}
\RequirePackage{ifxetex}
\ifxetex
\else
    \ClassError{hitgsrep}
        {Please use: \MessageBreak
         xelatex}{}
\fi

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=hit,
    prefix=hit@,
    setkeys=\kvsetkeys
}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessKeyvalOptions*

\LoadClass[zihao=-4]{ctexart}
\RequirePackage[a4paper,hmargin=3.17cm,vmargin=2.54cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{CJKfntef}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{caption}
\RequirePackage{amsmath}
\RequirePackage{lastpage}
\RequirePackage[normalem]{ulem}

\def\hitgsrepset{\kvsetkeys{hit}}

% 页眉页脚设置
\pagestyle{fancy}
\newcommand{\hit@pagefootmark}{第 \thepage{} 页（共 \pageref{LastPage} 页）\phantom{mmm}}
\fancyhf{}
\fancyfoot[R]{\hit@pagefootmark}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.5bp}

% 封面选项
\DeclareStringOption[\the\year]{year}
\DeclareStringOption[\hit@auto@semester]{semester}
\DeclareStringOption{course}
\DeclareStringOption{affiliation}
\DeclareStringOption{discipline}
\DeclareStringOption{author}
\DeclareStringOption{studentid}
\DeclareStringOption{studentcat}

% 自动生成当前学期
\newcommand{\hit@auto@semester}{\ifcase \month \or 秋\or 春\or 春\or 春\or 春\or 春\or 夏\or 夏\or 秋\or 秋\or 秋\or 秋\fi}

% 封面
\newcommand{\hit@putinfo}[2][3.81cm]{\begin{CJKfilltwosides}[b]{#1}#2\end{CJKfilltwosides}}%
\renewcommand{\maketitle}{%
    \begin{titlepage}
        \begin{center}
            \zihao{-2}\heiti \uline{\ \hit@year\ }年\uline{\ \ \hit@semester\ \ }季学期研究生课程考核

            \zihao{-3}\heiti （读书报告、研究报告）
        \end{center}

        \zihao{4}
        \renewcommand{\arraystretch}{1.5}
        \noindent\begin{tabular}{@{}c@{}l}
            \hit@putinfo{考核科目}&: \hit@course\\
            \hit@putinfo{学生所在院（系）} &: \hit@affiliation\\
            \hit@putinfo{学生所在学科}&: \hit@discipline\\
            \hit@putinfo{学生姓名}&: \hit@author\\
            \hit@putinfo{学号}&: \hit@studentid\\
            \hit@putinfo{学生类别}&: \hit@studentcat\\
            \hit@putinfo{考核结果}& \begin{tabular}{@{}p{5.19cm}@{}cc@{}}
                &\hit@putinfo[2.86cm]{阅卷人}&
            \end{tabular}
        \end{tabular}
    \end{titlepage}
}

