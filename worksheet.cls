\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{worksheet}[12/10/2020 custom in-class worksheet class]
\LoadClass[letterpaper,11pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In-class Worksheet class file
% Ver 3.0 (12/10/2020)
%
% Author: Subhadip Chowdhury
%
% License:
% CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%===============FONT=====================
\RequirePackage[frenchstyle,narrowiints,nofligatures,partialup,fullintlimits,fullsumlimits,largesmallcaps]{kpfonts}

%==============PACKAGES==================


%=========HYPERREF===============
\RequirePackage{hyperref,cleveref}

\hypersetup{
	colorlinks=true,       % false: boxed links; true: colored links
	linkcolor={blue},          % color of internal links (change box color with linkbordercolor)
	citecolor={green!50!black},        % color of links to bibliography
	filecolor=magenta,      % color of file links
	urlcolor=cyan,           % color of external links
}



%====== Graphics ===
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{framed}
\RequirePackage{color,xcolor}
\RequirePackage{float}

\RequirePackage{cancel}

%====== TIKZ =======

\RequirePackage{tikz, tkz-euclide,tikz-3dplot}
\usetikzlibrary{shapes.misc, positioning}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{decorations}


%======== GEOMETRY  ======

\RequirePackage[left=0.75in, right=0.75in, top=0.75in, bottom=0.75in]{geometry}

%========= FORMATTING ====

\RequirePackage{verbatim}
\RequirePackage{lipsum}


\RequirePackage{microtype}
\DisableLigatures{encoding = *, family = *}



\RequirePackage{todonotes}

\usepackage{anyfontsize}


\RequirePackage{xhfill}


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



%============= COLORS ===============

\newcommand{\blue}{\color{blue!80!black}}
\newcommand{\orange}{\color{orange!60!black}}


\definecolor{lightgreen}{HTML}{edffed}
\definecolor{lightgreenmono}{HTML}{a8e6a8}
\definecolor{lightgreencomp}{HTML}{ffeded}

\definecolor{lightblue}{HTML}{edffff}
\definecolor{lightbluemono}{HTML}{a8e6e6}
\definecolor{lightbluecomp}{HTML}{fff2ed}
% \definecolor{lightbluecomp}{HTML}{e6b9a8}

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
	\hspace{-1em}$\blacksquare$~Question~\thequestion.\hfill \fbox{#1}}

\renewcommand{\theparagraph}{\thequestion}

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


%===== MATH ==========

\RequirePackage{amsmath, mathtools}
\RequirePackage{amsthm,amssymb}
\RequirePackage{multicol,array}
\RequirePackage{bigints}


\RequirePackage{enumitem}
\setlist[enumerate]{leftmargin=*, align=left}
% \setlist[enumerate,1]{label = \arabic*.,ref   = \arabic*}
\setlist[enumerate,1]{label = (\alph*), ref = \thequestion.\alph*}
\setlist[enumerate,2]{label = (\roman*), ref= \theenumii.\roman*}
\setlist[itemize]{leftmargin=*, align=left}
\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\triangleright$}

\RequirePackage{tasks}
\settasks{label=(\roman*), item-indent  = 2em , label-width  = 2em , label-offset = 0pt}

%=====================================



%============== Boxes ===============

%%%%%%%%%%%%%%%%%% Numbered and non-numbered Environments %%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{environ} 
\RequirePackage[framemethod=TikZ]{mdframed}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%
%Solution %%%%%%%%% Make Solution Invisible Based on Flag
%%%%%%%%%%%%%%%%

% Usage:
% \begin{solution}
%	solution contents
% \end{solution}


\newif\ifsolution

\NewEnviron{solution}{\ifsolution\begin{proof}[Solution]\blue\BODY\end{proof}\fi}{} 
\renewcommand\qedsymbol{$\blacksquare$}  


%%%%%%%%%%%%%%%%
%Proof %%%%%%%%%
%%%%%%%%%%%%%%%%

% Usage:
% \begin{prf}[label of theorem]
%	proof contents
% \end{prf}


\NewEnviron{prf}[2][]
{%
	\mdfsetup{%
		frametitle={%
			\tikz[baseline=(current bounding box.east),outer sep=0pt]
			\node[anchor=east,rectangle,fill=lightbluemono] {\strut Proof of~\cref{#2}.} ;},%
		innertopmargin=5pt,linecolor=lightbluemono,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax%
	}%
	\begin{mdframed}\BODY\qed\end{mdframed}%
}


%%%%%%%%%%% All environments get the same counter, except Questions. %%%%%%%%%%%%%

\newcounter{counter} \setcounter{counter}{0}


%%%%%%%%%%%%%%%%
%Theorem %%%%%%
%%%%%%%%%%%%%%%%

% Usage:
% \begin{thm}[optional title]{label}
%	theorem contents
% \end{thm}


\newcommand{\thetheo}{\Alph{section}.\arabic{counter}}

\NewEnviron{theo}[2][]
{
	\refstepcounter{counter}%
	\ifstrempty{#1}%
	{%if no title
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightbluecomp]
				{\strut Theorem~\thetheo};}
		}
	}
	{%else
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightbluecomp]
				{\strut Theorem~\thetheo:~#1};}%
		}%
	}
	\mdfsetup{%common in both cases
		innertopmargin=5pt,linecolor=lightbluemono,%
		linewidth=2pt,topline=true,backgroundcolor= lightblue,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}\label[theorem]{#2}{\it \BODY}\end{mdframed}%
}

\crefname{theorem}{theorem}{theorems}



%%%%%%%%%%%%%%%%
%Axiom %%%%%%
%%%%%%%%%%%%%%%%

% Usage:
% \begin{thm}[optional title]{label}
%	theorem contents
% \end{thm}


\newcommand{\theaxiom}{\arabic{section}.\arabic{counter}}

\NewEnviron{axiom}[2][]
{
	\refstepcounter{counter}%
	\ifstrempty{#1}%
	{%if no title
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rounded rectangle,fill=lightbluecomp]
				{\strut Axiom~\theaxiom};}
		}
	}
	{%else
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rounded rectangle,fill=lightbluecomp]
				{\strut Axiom~\theaxiom:~#1};}%
		}%
	}
	\mdfsetup{%common in both cases
		innertopmargin=5pt,linecolor=lightbluemono,%
		linewidth=2pt,topline=true,backgroundcolor= lightblue,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}\label[axiom]{#2}{\it \BODY}\end{mdframed}%
}

\crefname{axiom}{axiom}{axioms}



%%%%%%%%%%%%%%%%
%Definition %%%
%%%%%%%%%%%%%%%%

% Usage:
% \begin{defn}[optional title]{label}
%	Definition contents
% \end{defn}


\newcommand{\thedefn}{\arabic{section}.\arabic{counter}}

\NewEnviron{defn}[2][]
{
	\refstepcounter{counter}%
	\ifstrempty{#1}%
	{%if no title
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightgreencomp]
				{\strut Definition~\thetheo};}
		}
	}
	{%else
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightgreencomp]
				{\strut Definition~\thetheo:~#1};}%
		}%
	}
	\mdfsetup{%common in both cases
		innertopmargin=5pt,linecolor=lightgreenmono,%
		linewidth=2pt,topline=true,%
		backgroundcolor= lightgreen,%
		innerrightmargin=1em,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}\label[definition]{#2}\BODY\end{mdframed}%
}

\crefname{definition}{definition}{definitions}

%%%%%%%%%%%%%%%%
%Example
%%%%%%%%%%%%%%%%

% Usage:
% \begin{exmpl}[optional title]{label}
%	Example contents
% \end{exmpl}


\newcommand{\theexmpl}{\Alph{section}.\arabic{counter}}

\NewEnviron{exmpl}[2][]
{%
	\refstepcounter{counter}%
	\ifstrempty{#1}%
	{%
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightgreenmono]
				{\strut Example~\theexmpl};}
		}
	}%
	{%else
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightgreenmono]
				{\strut Example~\theexmpl:~#1};}
		}%
	}%
	\mdfsetup{%
		innertopmargin=5pt,innerleftmargin=1em,%
		linewidth=2pt,topline=true,%
		% backgroundcolor= black!7,%
		linecolor=lightgreenmono,%
		innerrightmargin=1em,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}\label[example]{#2}\BODY\end{mdframed}%
}

\crefname{example}{example}{examples}


%%%%%%%%%%%%%%%%
%Warning
%%%%%%%%%%%%%%%%

% Usage:
% \begin{warning}[optional title, defaults to Warning:]
%	warning contents
% \end{warning}


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

\NewEnviron{warning}[1][Warning:]{
	\begin{mdframed}[style=warning]
		\noindent{\textbf{#1}} \BODY \end{mdframed}}

%%%%%%%%%%%%%%%%
%% Digression
%%%%%%%%%%%%%%%%

% Usage:
% \begin{diression}
%	digression contents
% \end{diression}


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


\NewEnviron{digression}{\begin{mdframed}[style=digressionarrows] \BODY \end{mdframed}}



%%%%%%%%%%%%%%%%
% COMMAND LINE ENVIRONMENT
%%%%%%%%%%%%%%%%

% Usage:
% \begin{code}
%		$ ls
%		
%		Applications	Desktop	...
% \end{code}

\RequirePackage{verbatim}



% Define a custom environment for command-line snapshots
% \newenvironment{commandline}{
% 	\medskip
% 	\begin{mdframed}[style=commandline]
% }{
% 	\end{mdframed}
% 	\medskip
% }

\newenvironment{code}[1][Command Line:]{
	\mdfsetup{
		leftmargin=10pt,
		rightmargin=10pt,
		innerleftmargin=15pt,
		middlelinecolor=black!50,
		middlelinewidth=2pt,
		frametitlerule=false,
		backgroundcolor=black!5,
		frametitle={#1},
		frametitlefont={\normalfont\sffamily\color{white}\hspace{-1em}},
		frametitlebackgroundcolor=black!50,
		nobreak,
	}
	
	\begin{mdframed}}{\end{mdframed}}

%%%%%%%%%%%%%%%%%%%%%%
% Note 
%%%%%%%%%%%%%%%%%%%%%


\mdfdefinestyle{note}{%
	hidealllines=true,leftline=true,
	skipabove=12,skipbelow=12pt,
	innertopmargin=0.4em,%
	innerbottommargin=0.4em,%
	innerrightmargin=0.5em,%
	innerleftmargin=0.5em,%
	middlelinewidth=.2em,%
	linecolor=red,%
	backgroundcolor=black!5,
}


\NewEnviron{note}[1][Note:]{
	\begin{mdframed}[style=note]
		\noindent{\textbf{#1}} \BODY \end{mdframed}}


%=====================================
%=====================================
%=====================================
%=====================================


% Title Page


%===============================
\renewcommand{\maketitle}{
	\begin{center}
		{\orange\Huge\scshape \@assignmentcourse}
		\vspace{1em}
		
		{\scshape\huge \@assignmenttitle}
	\end{center}
	\vspace{-0.5em}
	\noindent\hrulefill
	
	\vspace{-0.5em}
	
	\noindent{\bfseries\large\@assignmentsemester\hspace{10.5em}\@instructorname\hfill \@assignmentduedate}
	
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

\AtBeginDocument{
    \hypersetup{
    	pdftitle={\@assignmenttitle},
    	pdflang={en-US},
    	pdfauthor={\@instructorname},
    	pdfsubject={\@lecturetitle}
    }
}



%%%%%% Header and Footer %%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{fancyhdr}
\pagestyle{fancy}

\renewcommand{\sectionmark}[1]{\markright{\thesection.~ #1 }}

\fancyhf{}
\rhead{\@assignmentsemester}
\lhead{\@assignmentduedate}
\chead{\rightmark}
\lfoot{}
\rfoot{}
\cfoot{\bf \thepage}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%=== Somehow moving this above breaks things ====??? ====
\RequirePackage{parskip}



%=========== Shortcut Commands ==============

\renewcommand{\phi}{\varphi}
\renewcommand{\epsilon}{\varepsilon}

\newcommand{\la}{\langle}
\newcommand{\ra}{\rangle}
\newcommand{\vf}[1]{\frac{1}{#1}}
\newcommand{\X}{\times}
\newcommand{\leg}[2]{\left(\frac{#1}{#2}\right)}

\newcommand{\rh}{\rightharpoonup}
\newcommand{\xrh}{\stackrel{*}{\rightharpoonup}}
\newcommand{\blank}{\hspace{10pt}}
\newcommand{\tripnorm}{\|\hspace{-1pt}|}
\newcommand{\suchthat}{\;\ifnum\currentgrouptype=16 \middle\fi|\;}


\newcommand{\cis}{\textup{c}i\textup{s }}
\renewcommand{\d}{\partial}
\newcommand{\grad}{\nabla}
\newcommand{\tr}{\mathbf{tr}}


\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}

\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccot}{arccot}
\DeclareMathOperator{\arccsc}{arccsc}
\DeclareMathOperator{\charpoly}{charpoly}


\newcommand{\myskip}{\vspace{3em}}
\newcommand{\mysskip}{\vspace{2em}}
\newcommand{\myssskip}{\vspace{1em}}

\newcommand{\Zroot}[1]{\mathbb{Z}[\sqrt{#1}]}
\newcommand{\Qroot}[1]{\mathbb{Q}(\sqrt{#1})}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\U}{\mathcal{U}}

\newcommand{\ddx}{\dfrac{\D}{\D x}}
\newcommand{\dint}{\displaystyle\int}
\newcommand{\dx}{\D x}
\newcommand{\dt}{\D t}
\newcommand{\du}{\D u}
\newcommand{\dz}{\D z}
\newcommand{\eval}{\biggr|}

\newcommand{\blankfill}{\xrfill[-1em]{0.5pt}}