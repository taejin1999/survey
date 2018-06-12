\ProvidesClass{snuthesis-kor}[2010/12/01 v1 thesis class for SNU CSE]


% load default class and set default paper size and font size
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[11pt,b5paper]{book}

% set default paper margin
\usepackage[margin=3cm]{geometry}

% packages for spacing
\usepackage{setspace}

% set default font and hangul packages
\usepackage{times}
\usepackage{kotex}
%\usepackage[english]{kotex}
%\usepackage[hangul]{kotex}
\usepackage{ifpdf}
\ifpdf
	\input{glyphtounicode} \pdfgentounicode=1
\fi


% set chapter, section presentation
% 제 1 장, 1.1, 1.1.1, 1.1.1.1 형식으로 연결되도록 함.
\usepackage[ensec]{dhucs-sectsty}
\renewcommand\thesection{\thechapter.\arabic{section}}
\sectionfont{\fontsize{16}{16}\selectfont}
\subsectionfont{\fontsize{14}{14}\selectfont}
\subsubsectionfont{\fontsize{14}{14}\selectfont}


% redefine chapter inorder to remove vertical space between items in list of tables and figures. 
\def\@chapter[#1]#2{
\ifnum \c@secnumdepth >\m@ne
	\refstepcounter{chapter}%
	\typeout{\@chapapp\space\thechapter.}%
	\addcontentsline{toc}{chapter}{\protect\numberline{\Roman{chapter}}#2}%
\else
	\addcontentsline{toc}{chapter}{#2}%
\fi
\chaptermark{#1}%
\addtocontents{lof}{\protect\addvspace{0\p@}}%
\addtocontents{lot}{\protect\addvspace{0\p@}}%
\if@twocolumn
	\@topnewpage[\@makechapterhead{#2}]%
\else
	\@makechapterhead{#2}%
	\@afterheading
\fi}

% table and figure numbering for toc, lof, lot
\usepackage{chngcntr}
\counterwithout{figure}{section}
\counterwithout{table}{section}
\@removefromreset{figure}{chapter}
%\renewcommand{\thefigure}{\arabic{figure}}
\@removefromreset{table}{chapter}
%\renewcommand{\thetable}{\arabic{table}}
\usepackage[titles,subfigure]{tocloft}
\setlength{\cftchapnumwidth}{25pt} 
\renewcommand{\cftchapaftersnum}{.} 
\setlength{\cftbeforechapskip}{10pt} 
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength{\cftfignumwidth}{50pt} 
\renewcommand{\cftfigpresnum}{Figure } 
\renewcommand{\cftfigaftersnum}{.} 
\setlength{\cfttabnumwidth}{40pt} 
\renewcommand{\cfttabpresnum}{Table } 
\renewcommand{\cfttabaftersnum}{.} 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% variable settings 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% author information
\def\university#1{\gdef\@university{#1}}
\def\enguniversity#1{\gdef\@enguniversity{#1}}
\def\collegeordept#1{\gdef\@collegeordept{#1}}
\def\engcollegeordept#1{\gdef\@engcollegeordept{#1}}
\def\studentnumber#1{\gdef\@studentnumber{#1}}
\def\engauthor#1{\gdef\@engauthor{#1}}
\def\hpnumber#1{\gdef\@hpnumber{#1}}

% thesis summary
\def\engtitle#1{\gdef\@engtitle{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\def\engkeywords#1{\gdef\@engkeywords{#1}}

% Degree title related texts
\def\msorphd#1{\gdef\@msorphd{#1}}
\def\degreetitle#1{\gdef\@degreetitle{#1}}

% date
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\acceptdate#1{\gdef\@acceptdate{#1}}
\def\degreedate#1{\gdef\@degreedate{#1}}
\def\agreedate#1{\gdef\@agreedate{#1}}

% Advisor
\def\advisor#1{\gdef\@advisor{#1}}

% commitee
\def\chief#1{\gdef\@chief{#1}}
\def\vicechief#1{\gdef\@vicechief{#1}}
\def\commiteea#1{\gdef\@commiteea{#1}}
\def\commiteeb#1{\gdef\@commiteeb{#1}}
\def\commiteec#1{\gdef\@commiteec{#1}}

% set empty commitee
\chief{}
\vicechief{}
\commiteea{}
\commiteeb{}
\commiteec{}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 외표지
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
	\setlength{\parskip}{0pt}
	\begin{center}
		{\fontsize{14}{14}\selectfont {\@degreetitle학위논문} \par}
		\vspace*{10mm}
		{\fontsize{22}{22}\selectfont {\bfseries {\@title}} \par}
		\vspace*{10mm}
		{\fontsize{16}{16}\selectfont {\bfseries {\@engtitle}} \par}
		\null\vfill
		{\fontsize{14}{14}\selectfont {{\@degreedate} \par}}
		\vspace*{40mm}
		{\fontsize{16}{16}\selectfont {{\@university} \par}}
		{\fontsize{14}{14}\selectfont {{\@collegeordept} \par}}
		{\fontsize{16}{16}\selectfont {{\@author} \par}}
	\end{center}
	\clearpagebefore
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 내표지(인준지)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makesubmission}{
	\setlength{\parskip}{0pt}
	\begin{center}
		{\fontsize{19}{19}\selectfont {\bfseries {\@title}} \par}
		\vspace*{10pt}
		{\fontsize{15}{15}\selectfont {\bfseries {\@engtitle}} \par}
		\vspace*{12pt}
		{\fontsize{13}{13}\selectfont {{\@advisor} \par}}
		\null\vfill\vspace{-15pt}
		{\fontsize{13}{13}\selectfont {이 논문을 {\@degreetitle} 학위논문으로 제출함 \par}}
		{\fontsize{12}{12}\selectfont {{\@submitdate} \par}}
		\vspace*{9pt}
		{\fontsize{13}{13}\selectfont {{\@university} \par}}
		{\fontsize{12}{12}\selectfont {{\@collegeordept} \par}}
		{\fontsize{14}{14}\selectfont {{\@author} \par}}
		\null\vfill\vspace{-16pt}
		{\fontsize{13}{13}\selectfont {{\@author}의 {\@msorphd} 학위논문을 인준함 \par}}
		{\fontsize{12}{12}\selectfont {{\@acceptdate} \par}}
		\vspace*{23pt}
		$\vbox{
			\fontsize{12}{12}\selectfont 
          	\halign{
				##&\underline{\hspace{1cm}##\hspace{1cm}\small(인)}\vspace{10pt}\cr
          		위\hfill 원\hfill 장				& {\@chief}\cr
          		부\hfill 위\hfill 원\hfill 장		& {\@vicechief}\cr
          		위\hfill 원						& {\@commiteea}\cr
          		\ifx \@commiteeb \@empty
          		\else
          		위\hfill 원						& {\@commiteeb}\cr
          		\fi
          		\ifx \@commiteec \@empty
          		\else
          		위\hfill 원						& {\@commiteec}\cr
          		\fi
        }}$
	\end{center}
	\clearpagebefore
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% aggrement layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\cl}[1]{\textcircled{\scriptsize #1}}
\newcommand{\makeagreement}{
	\setlength{\parskip}{0pt}
	\begin{center}{\fontsize{16}{16}\selectfont {\bfseries {학위논문 원문 서비스에 대한 동의서}} \par}\end{center}
	{
		본인의 학위논문에 대하여 서울대학교가 아래와 같이 학위논문 저작물을 제공하는 것에 동의합니다.
		\begin{singlespacing}
		\renewcommand{\theenumii}{\arabic{enumii}}
		\renewcommand{\labelenumii}{\cl\theenumii}
		\begin{enumerate}
		  \item 동의사항
		  \begin{enumerate}
		    \item 본인의 논문을 보존이나 인터넷 등을 통한 온라인 서비스 목적으로 복제할 경우 저작물의 내용을 변경하지 않는 범위 내에서의 복제를 허용합니다. 
		    \item 본인의 논문을 디지털화하여 인터넷 등 정보통신망을 통한 논문의 일부 또는 전부의 복제․배포 및 전송 시 무료로 제공하는 것에 동의합니다. 
		  \end{enumerate}
		  \item 개인(저작자)의 의무\par
		    본 논문의 저작권을 타인에게 양도하거나 또는 출판을 허락하는 등 동의 내용을 변경하고자 할 때는 소속대학(원)에 공개의 유보 또는 해지를 즉시 통보하겠습니다.
		  \item 서울대학교의 의무
		  \begin{enumerate}
		    \item 서울대학교는 본 논문을 외부에 제공할 경우 저작권 보호장치(DRM)를 사용하여야 합니다. 
		    \item 서울대학교는 본 논문에 대한 공개의 유보나 해지 신청 시 즉시 처리해야 합니다. 
		  \end{enumerate}
		\end{enumerate}
		\end{singlespacing}
	}
	\null\vfill
	\begin{flushleft}{{\bfseries 논문 제목 : \@title} \par}\end{flushleft}
	\begin{onehalfspacing}
	\begin{flushright}
	$\vbox{
		\halign{
			## & : ## \hfill \cr
        	학\hfill위\hfill구\hfill분	& {\bfseries {\@msorphd}}\cr
        	학\hfill과					& {\@collegeordept}\cr
            학\hfill번					& {\@studentnumber}\cr
            연\hfill락\hfill처			& {\@hpnumber}\cr
            저\hfill작\hfill자			& {\@author \hspace*{5mm}\small{(인)}\hspace*{20mm}}\cr
	}}$
	\end{flushright}
	\end{onehalfspacing}
	\begin{center}{ 제 출 일 : \@agreedate \par}\end{center}
	{\bfseries 서울대학교총장 귀하}
	\clearpagebefore
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% abstract layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{abstract} {
	%\begin{center}{\fontsize{16}{16}\selectfont \bfseries  Abstract}\end{center}
	\chapter*{Abstract}
}
{
	\par
	\vspace*{10mm}
	{\noindent {\bfseries Keywords: } {\@keywords} \par}
	{\noindent {\bfseries Student Number: } {\@studentnumber}}
	\clearpagebefore
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% english abstract layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{engabstract} {
	\begin{center}{\fontsize{20}{20}\selectfont \bfseries  초 록}\end{center}
	%\chapter*{초 록}
	%\addcontentsline{toc}{chapter}{초 록}
	%\begin{center}{\fontsize{22}{22}\selectfont \bfseries  \@engtitle}\end{center}
	%\vspace*{10pt}
	%\begin{flushright}
	%{\fontsize{14}{14}\selectfont
	%
	%	{\@engauthor \par}
	%	{\@engcollegeordept \par}
	%	{\@enguniversity \par}		
	%}
	%\end{flushright}
	\vspace*{5mm}
}
{
	\par
	\vspace*{10mm}
	{\noindent {\bfseries 키워드: } {\@engkeywords} \par}
	{\noindent {\bfseries 학번: } {\@studentnumber}}
	\clearpagebefore
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% english abstract layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\thankstoname#1{\gdef\@thankstoname{#1}}
\thankstoname{감사의 글}
\newenvironment{thanksto}{
	\clearpagebefore
	\pagestyle{empty}
	{
		\setlength{\parindent}{0pt} 
		\center\normalfont\bfseries
		\fontsize{20}{20}\selectfont
		\@thankstoname
		\par\nobreak\vspace{40pt}
	}
}
{
	\par
	\clearpagebefore
}


% chage chapter header style
%\usepackage{titlesec}
\makeatletter
\renewcommand{\@makechapterhead}[1]{%
%\vspace*{30pt}
{\setlength{\parindent}{0pt} \raggedright \normalfont
\bfseries\fontsize{18}{18}\selectfont
\ifnum \value{secnumdepth}>1
%\if@mainmatter제\ \thechapter\ 장\par \fi%
	\if@mainmatter Chapter \thechapter\ \par \fi%
\fi
\vspace*{15pt}%
\bfseries\fontsize{20}{20}\selectfont
#1\par\nobreak\vspace{40pt}}}
\makeatother


\makeatletter
\renewcommand{\@makeschapterhead}[1]{%
%\vspace*{0pt}
{\setlength{\parindent}{0pt} \center \normalfont
\bfseries\fontsize{20}{20}\selectfont
#1\par\nobreak\vspace{40pt}}}
\makeatother



\newcommand{\clearpagebefore}{
	\if@oneside
		\clearpage
	\else
		\cleardoublepage
	\fi
}


% customize column numbers for index section
\usepackage{makeidx}
\usepackage{multicol}
\makeatletter
\renewenvironment{theindex}
	{\if@twocolumn
		\@restonecolfalse
	\else
		\@restonecoltrue
	\fi
	\setlength{\columnseprule}{0pt}
	\setlength{\columnsep}{35pt}
	\begin{multicols}{2}[\chapter*{\indexname}]      %Adjust the 2 for more columns
	\markboth{\MakeUppercase\indexname}%
             {\MakeUppercase\indexname}%
	\thispagestyle{plain}
	\setlength{\parindent}{0pt}
	\setlength{\parskip}{0pt plus 0.3pt}
	\relax
	\let\item\@idxitem}%
	{\end{multicols}\if@restonecol\onecolumn\else\clearpage\fi}
\makeatother
