\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{worksheet}[9/27/2020 custom in-class worksheet class]
\LoadClass[twoside=false,letterpaper,11pt]{article}


%===============FONT=====================
\RequirePackage[frenchstyle,narrowiints,nofligatures,partialup,fullintlimits,fullsumlimits]{kpfonts}

%==============PACKAGES==================

%====== Graphics ===
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{framed}
\RequirePackage{color,xcolor}
\RequirePackage{float}


%====== TIKZ =======

\RequirePackage{tikz,circuitikz, tkz-euclide,tikz-3dplot}
\usetkzobj{all}
\usetikzlibrary{shapes.misc, positioning}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{snakes}


%===== MATH ==========

\RequirePackage{amsmath, mathtools}
\RequirePackage{amsthm,amssymb}
\RequirePackage{enumitem}


\RequirePackage{multicol,array}
\RequirePackage{tasks}

%======== GEOMETRY  ======

\RequirePackage[left=0.75in, right=0.75in, top=0.75in, bottom=0.75in]{geometry}

%========= FORMATTING ====

\RequirePackage{verbatim}
\RequirePackage{lipsum}


\RequirePackage{microtype}
\DisableLigatures{encoding = *, family = *}



\RequirePackage{todonotes}

\usepackage{anyfontsize}

%=========Fancy Footnote===============

%Footnote Symbol
\RequirePackage[symbol]{footmisc}

\renewcommand*{\thefootnote}{\fnsymbol{footnote}}

%=====================================
%%%%%%% fancy End of Section Line
\RequirePackage[object=vectorian]{pgfornament}
\newcommand{\sectionline}[2]{%
  \nointerlineskip \vspace{.5\baselineskip}\hspace{\fill}
  {\resizebox{0.5\linewidth}{1.2ex}
    {\pgfornament[color = #1]{#2}
    }}%
    \hspace{\fill}
    \par\nointerlineskip \vspace{.5\baselineskip}
  }

%=========== Shortcut Commands ==============

\newcommand{\la}{\langle}
\newcommand{\ra}{\rangle}
\renewcommand{\phi}{\varphi}
\newcommand{\vf}[1]{\frac{1}{#1}}
\newcommand{\X}{\times}
\newcommand{\leg}[2]{\left(\frac{#1}{#2}\right)}
\newcommand{\Zroot}[1]{\mathbb{Z}[\sqrt{#1}]}
\newcommand{\Qroot}[1]{\mathbb{Q}(\sqrt{#1})}
\newcommand{\rh}{\rightharpoonup}
\newcommand{\xrh}{\stackrel{*}{\rightharpoonup}}
\newcommand{\blank}{\hspace{10pt}}
\newcommand{\tripnorm}{\|\hspace{-1pt}|}
\newcommand{\nin}{\not\in}
\renewcommand{\*}{\star}
\newcommand{\cis}{\textup{c}i\textup{s }}
\newcommand{\R}{\mathbb{R}}
\renewcommand{\d}{\partial}
\newcommand{\grad}{\nabla}
\newcommand{\tr}{\mathbf{tr}}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccot}{arccot}
\DeclareMathOperator{\arccsc}{arccsc}

%============= COLORS ===============

\newcommand{\blue}{\color{blue!80!black}}
\newcommand{\orange}{\color{orange!60!black}}

\renewcommand{\em}{\orange\bfseries}

%==================


%==========TITLE FORMATTING ==========


\RequirePackage[explicit]{titlesec}
% \titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before>}[<after>]

%=== SECTION ===

\fboxrule0.5pt\fboxsep3pt
\renewcommand\thesection{\Alph{section}}

\titleformat{\section}{\normalfont\Large}{}{0pt}{\colorbox{orange!50}{\S\thesection. \textbf{#1}}}

%====QUESTIONS === PARAGRAPH ====

\newcounter{question}
\titleformat{\paragraph}{\em\large}{}{}{%
    \stepcounter{question}%
    \hspace{-1em}$\blacksquare$~\othertailQ uestion~\thequestion.\hfill \fbox{#1}}

% === End Of Question ===

\newcommand{\miniscule}{\fontsize{4}{5}\selectfont}

\newcommand{\eoq}{{\orange\hfill{\rule{0.25\textwidth}{1pt}{\miniscule~End of Question \thequestion~}\rule{0.25\textwidth}{1pt}}\hfill}}
    
%=== SUBSECTION ===
    
\titleformat{\subsection}{\orange\centering\normalfont\Large\bfseries\scshape}{}{0em}{#1}

%=== SUBSUBSECTION ===


\titleformat{\subsubsection}[wrap]{\filright}{}{0em}{{\em #1.}}

\titlespacing{\subsubsection}
{12pc}{1.5ex plus .1ex minus .2ex}{1pc}

%=====================================




%=========HYPERREF===============
\RequirePackage{hyperref,cleveref}

\hypersetup{
	colorlinks=true,       % false: boxed links; true: colored links
	linkcolor={blue},          % color of internal links (change box color with linkbordercolor)
	citecolor={green!50!black},        % color of links to bibliography
	filecolor=magenta,      % color of file links
	urlcolor=cyan           % color of external links
}

%============== Boxes ===============

\RequirePackage[framemethod=TikZ]{mdframed}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Solution

%%%%%%%%% Make Solution Invisible Based on Flag


\RequirePackage{environ} 

\newif\ifsolution

\NewEnviron{solution}{\ifsolution\begin{proof}[Solution]\blue\BODY\end{proof}\fi}{} 
\renewcommand\qedsymbol{$\blacksquare$}  
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Theorem
\newcounter{theo}[section] \setcounter{theo}{0}
\renewcommand{\thetheo}{\Alph{section}.\arabic{theo}}
\newenvironment{theo}[2][]{%
\refstepcounter{theo}%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=blue!20]
{\strut Theorem~\thetheo};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=blue!20]
{\strut Theorem~\thetheo:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=blue!20,%
linewidth=2pt,topline=true,backgroundcolor= black!5,%
frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}}{\end{mdframed}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Definition
\newcounter{defn}[section] \setcounter{defn}{0}
\renewcommand{\thedefn}{\Alph{section}.\arabic{defn}}
\newenvironment{defn}[2][]{%
\refstepcounter{defn}%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=green!90!black]
{\strut Definition~\thedefn};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=green!90!black]
{\strut Definition~\thedefn:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=green!90!black,%
linewidth=2pt,topline=true,%
frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}}{\end{mdframed}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Proof
\newcounter{prf}[section]\setcounter{prf}{0}
\renewcommand{\theprf}{\Alph{section}.\arabic{prf}}
\newenvironment{prf}[2][]{%
\refstepcounter{prf}%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=red!20]
{\strut Proof~\theprf};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=red!20]
{\strut Proof~\theprf:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=red!20,%
linewidth=2pt,topline=true,%
frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}}{\qed\end{mdframed}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Example
\newcounter{exmpl}[section] \setcounter{exmpl}{0}
\renewcommand{\theexmpl}{\Alph{section}.\arabic{exmpl}}
\newenvironment{exmpl}[2][]{%
\refstepcounter{exmpl}%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=black!10]
{\strut Example~\theexmpl};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=black!10]
{\strut Example~\theexmpl:~#1};}}%
}%
\mdfsetup{%
    innertopmargin=10pt,innerleftmargin=1em,%
    linewidth=1pt,topline=true,%
    backgroundcolor= blue!7,%
    innerrightmargin=1em,%
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax
}
\begin{mdframed}[]\relax%
\label{#2}}{\end{mdframed}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Warning
\RequirePackage{fontawesome}

\tikzset{
  warningsymbol/.style={
      rectangle,draw=red,
      fill=white,scale=1,
      overlay}}
\mdfdefinestyle{warning}{%
 hidealllines=true,leftline=true,
 skipabove=12,skipbelow=12pt,
 innertopmargin=0.4em,%
 innerbottommargin=0.4em,%
 innerrightmargin=0.7em,%
 rightmargin=0.7em,%
 innerleftmargin=1.7em,%
 leftmargin=0.7em,%
 middlelinewidth=.2em,%
 linecolor=red,%
 fontcolor=red!70!black,%
 firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
                           node[warningsymbol] {\faWarning};},%
 secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
                           node[warningsymbol] {\faWarning};},%
 middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
                           node[warningsymbol] {\faWarning};},%
 singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
                           node[warningsymbol] {\faWarning};},%
}

\newenvironment{warning}{
    \begin{mdframed}[style=warning]
}{\end{mdframed}}

%%%%%%%%%%%%%%%%
%% Digression
%%%%%%%%%%%%%%%%

\usetikzlibrary{calc,arrows}
\tikzset{
   excursus arrow/.style={%
      line width=2pt,
      draw=gray!40,
      rounded corners=2ex,
   },
   excursus head/.style={
      fill=white,
      font=\bfseries\sffamily,
      text=gray!80,
      anchor=base west,
   },
}
\mdfdefinestyle{digressionarrows}{%
 singleextra={%
      \path let \p1=(P), \p2=(O) in (\x2,\y1) coordinate (Q);
      \path let \p1=(Q), \p2=(O) in (\x1,{(\y1-\y2)/2}) coordinate (M);
      \path [excursus arrow, round cap-to]
         ($(O)+(5em,0ex)$) -| (M) |- %
         ($(Q)+(12em,0ex)$) .. controls +(0:16em) and +(185:6em) .. %
         ++(23em,2ex);
      \node [excursus head] at ($(Q)+(2.5em,-0.75pt)$) {Digression};},
 firstextra={%
      \path let \p1=(P), \p2=(O) in (\x2,\y1) coordinate (Q);
      \path [excursus arrow,-to]
         (O) |- %
         ($(Q)+(12em,0ex)$) .. controls +(0:16em) and +(185:6em) .. %
         ++(23em,2ex);
      \node [excursus head] at ($(Q)+(2.5em,-2pt)$) {Digression};},
 secondextra={%
      \path let \p1=(P), \p2=(O) in (\x2,\y1) coordinate (Q);
      \path [excursus arrow,round cap-]
         ($(O)+(5em,0ex)$) -| (Q);},
 middleextra={%
      \path let \p1=(P), \p2=(O) in (\x2,\y1) coordinate (Q);
      \path [excursus arrow]
         (O) -- (Q);},
   middlelinewidth=2.5em,middlelinecolor=white,
   hidealllines=true,topline=true,
   innertopmargin=0.5ex,
   innerbottommargin=2.5ex,
   innerrightmargin=2pt,
   innerleftmargin=2ex,
   skipabove=0.87\baselineskip,
   skipbelow=0.62\baselineskip,
}


\newenvironment{digression}{
    \begin{mdframed}[style=digressionarrows]
}{\end{mdframed}}


%=====================================
%=====================================
%=====================================
%=====================================


% Title Page


%===============================
\renewcommand{\maketitle}{
    \begin{center}
		{\orange\huge\scshape \@assignmentcourse}
		\vspace{1em}
		
		{\scshape\Large \@assignmenttitle}
	\end{center}
	\vspace{-0.5em}
	\noindent\hrulefill
	
	\vspace{-0.5em}
	
	\noindent{\bfseries\large\@assignmentsemester\hspace{10em}\@instructorname\hfill \@assignmentduedate}
	
	\vspace{-1em}
	\noindent\hrulefill
		
	\noindent {\orange \Large \textsc{\textbf{Title:}}} \@lecturetitle 
	
	\noindent {\orange \Large \textsc{\textbf{Summary:}}} \@lecturesummary
	
	\vspace{-1em}
	\noindent\hrulefill
}

\newcommand{\department}[1]{\gdef\@department{#1}}

\newcommand{\assignmenttitle}[1]{
  \gdef\@assignmenttitle{#1}}
  

\newcommand{\assignmentcourse}[1]{
  \gdef\@assignmentcourse{#1}}
  

\newcommand{\assignmentsemester}[1]{
  \gdef\@assignmentsemester{#1}}


\newcommand{\assignmentduedate}[1]{
  \gdef\@assignmentduedate{#1}}
  

\newcommand{\instructorname}[1]{
  \gdef\@instructorname{#1}}


\newcommand{\lecturetitle}[1]{
  \gdef\@lecturetitle{#1}}


\newcommand{\lecturesummary}[1]{
  \gdef\@lecturesummary{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%=== Somehow moving this above breaks things ====??? ====
\RequirePackage{parskip}
  
