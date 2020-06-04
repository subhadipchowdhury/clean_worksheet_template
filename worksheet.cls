\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{worksheet}[1/29/2020 custom in-class worksheet class]
\LoadClass[twoside=false,letterpaper,11pt]{article}




%==============FONT==================
\RequirePackage[frenchstyle,narrowiints,nofligatures,partialup,fullintlimits,fullsumlimits]{kpfonts}

%=======Essential Packages===========

\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{framed}
\RequirePackage{color,xcolor}

\RequirePackage{tikz,circuitikz}
\usetikzlibrary{shapes.misc, positioning}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{snakes}


\RequirePackage{amsmath, mathtools}
\RequirePackage[left=0.75in, right=0.75in, top=0.75in, bottom=0.75in]{geometry}
\RequirePackage{enumitem}
\RequirePackage{verbatim}
\RequirePackage{float}
\RequirePackage{multicol,array}


\RequirePackage{todonotes}
\RequirePackage{tasks}


%==========Typography================

\RequirePackage{microtype}
\DisableLigatures{encoding = *, family = *}

%==========Section and Subsection Styling==========

\RequirePackage[explicit]{titlesec}
% \titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before>}[<after>]

\fboxrule.2pt\fboxsep3pt
\renewcommand\thesection{\Alph{section}}

\titleformat{\section}{\normalfont\large}{}{0pt}{\colorbox{orange!50}{\S\thesection. \textbf{#1}}}

%======= Subsections create Questions =====

\newcounter{question}
\titleformat{\subsection}{}{}{-1em}{%
    \stepcounter{question}%
    \orange$\blacksquare$~\textbf{\othertailQ uestion~\thequestion.~#1}}

%======= Paragraphs have center heading (Works like subsection) =====
    
\titleformat{\paragraph}{\orange\centering\normalfont\large\bfseries\scshape}{\theparagraph}{1em}{#1}


\usepackage{parskip}

%===========Colors==============

\newcommand{\blue}{\color{blue!80!black}}
\newcommand{\orange}{\color{orange!60!black}}

%==========Custom Math Commands==========

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
\renewcommand{\em}{\orange\bfseries}


%==========Hyperlink Coloring==================

\RequirePackage{hyperref,cleveref}

\hypersetup{
	colorlinks=true,       % false: boxed links; true: colored links
	linkcolor={red!60!black},          % color of internal links (change box color with linkbordercolor)
	citecolor={green!50!black},        % color of links to bibliography
	filecolor=magenta,      % color of file links
	urlcolor=cyan           % color of external links
}



%=======Custom Math Sections=================

\RequirePackage{amsthm,amssymb}
\RequirePackage[framemethod=TikZ]{mdframed}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Solution
\newenvironment{solution}
  {\renewcommand\qedsymbol{$\blacksquare$}\begin{proof}[Solution]\blue}
  {\end{proof}}
  
  
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
\renewcommand{\thedefn}{\arabic{section}.\arabic{defn}}
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lemma
\newcounter{lem}[section] \setcounter{lem}{0}
\renewcommand{\thelem}{\Alph{section}.\arabic{lem}}
\newenvironment{lem}[2][]{%
\refstepcounter{lem}%
\ifstrempty{#1}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=green!90!black]
{\strut Lemma~\thelem};}}
}%
{\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,fill=green!90!black]
{\strut Lemma~\thelem:~#1};}}%
}%
\mdfsetup{innertopmargin=10pt,linecolor=green!90!black,%
linewidth=2pt,topline=true,backgroundcolor= black!5,%
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



%=====================================
%=====================================
%=====================================

%==========Make Title=================
\renewcommand{\maketitle}{
    \begin{center}
		{\orange\huge\scshape \@assignmentcourse}
		\vspace{1em}
		
		{\Large\scshape \@assignmenttitle}
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


