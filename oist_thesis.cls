
% A LaTeX2e class for thesis submissions to
% Okinawa Institute of Science and Technology (OIST):
%
% Tadashi Kozuno (tadashi.kozuno@gmail.com)
%
% last revision: March 2019

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oist_thesis}[2019/3/17 OIST thesis submission class]

\newif\if@final\@finaltrue
\DeclareOption{temporary}{\@finalfalse}
\DeclareOption{final}{\@finaltrue}

\ProcessOptions\relax

%-------------------------------------------------------------------------------
%	HANDLING THE STYLE OF THE THESIS
%-------------------------------------------------------------------------------

% \renewcommand{\familydefault}{phv}

\LoadClass[12pt, oneside]{book} % 12 pt font, one-sided book style

\RequirePackage[a4paper, includehead, headheight=0.6cm, inner=2.5cm ,outer=2.5cm, top=2.5 cm, bottom=2.5cm]{geometry}

\RequirePackage[bf, font=onehalfspacing]{caption} % caption: FIG in bold, 1.5 line spacing in figure and table captions

\newcommand{\thesisspacing}{
    % \singlespacing
    \setstretch{1.5}
}

\newcommand{\numberedchapter}{ % Preparation for numbered chapters
	\cleardoublepage % To make sure the previous headers are passed
	\lhead{\bfseries \leftmark} % Header
}

\newcommand{\unnumberedchapter}[1]{ % Preparation for unnumbered chapters
	\cleardoublepage % To make sure the previous headers are passed
	\phantomsection % To help hyperref link to the right page
	\addcontentsline{toc}{chapter}{#1} % Also adds the chapter name to the Contents
	\lhead{\bfseries #1} % Header
}

\newcommand{\startpreamble}{
	\pagestyle{fancy} % Change the header style
	\fancyhf{}% Clear header and footer
	\renewcommand{\chaptermark}[1]{\markboth{##1}{}} % Getting the chapter name right
	\rhead{\thepage} % Page number at the right of the header
	\frontmatter % Use roman page numbering style (i, ii, iii, iv...) for the preamble pages
	\setcounter{page}{2} % Include the title page in page counting
	\thesisspacing % Double or single spacing
}

\newcommand{\includepublications}{
	\input{./MainText/publications}
}

%-------------------------------------------------------------------------------
%	BUILDING THE TITLE PAGE
%-------------------------------------------------------------------------------

\newcommand\BackgroundPic{% Adding background picture
	\put(-250,-160){%
		\parbox[b][\paperheight]{\paperwidth}{%
			\vfill
			\centering
			\includegraphics[width=\paperwidth]{./Images/symbol.jpg}%
			\vfill
}}}

\RequirePackage{xkeyval} % Handling keyword options.

\newif\if@cosupervisorexist\@cosupervisorexistfalse
\define@key[OIST]{title}{title}{\def\thesistitle{#1}}
\define@key[OIST]{title}{name}{\def\name{#1}}
\define@key[OIST]{title}{supervisor}{\def\supervisor{#1}}
\define@key[OIST]{title}{cosupervisor}{\def\cosupervisor{#1}\@cosupervisorexisttrue}
\define@key[OIST]{title}{submissiondate}{\def\submissiondate{#1}}

\providecommand{\puttitle}{}
\renewcommand{\puttitle}[1]{
	\@puttitle{}{#1}
}

\providecommand{\@puttitle}{}
\renewcommand{\@puttitle}[2]{%
	\setkeys[OIST]{title}{#2}

	\begin{titlepage}
        \begin{spacing}{1.5}
        \begin{center}
        	\Large\bf{\thesistitle}
        	\normalsize\rm
        	
        	\vspace*{\fill}
        	
            A Dissertation Presented for the
            
            Doctor of Philosophy
            
        	Degree
        	
        	The University of Tennessee, Knoxville
        	
        	\vspace*{\fill}
        	
        	\name
        	
        	\submissiondate
        	
        \end{center}
        \end{spacing}


	\end{titlepage}
}