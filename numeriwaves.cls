% v0.1 by Erich L Foster 05 July 2013
%%% IDENTIFICATION --------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[01/01/10]
\ProvidesClass{numeriwaves}[05/07/2013 v0.1 NUMERIWAVES poster]

\LoadClass[final,8pt]{beamer}

%-----------------------------------------------------------
% Allow the user to define the width of the collaborators section 
%-----------------------------------------------------------
\RequirePackage{kvoptions}
\DeclareStringOption[65cm]{cWidth}
\ProcessKeyvalOptions*

%used for pretocmd and apptocmd 
\RequirePackage{etoolbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amssymb,amsthm,dsfont}
\RequirePackage{graphicx,color,subfigure,epstopdf}
\RequirePackage{float,caption,eso-pic}
\RequirePackage{mathtools}
\mathtoolsset{showonlyrefs}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------
% Define the poster below
% This is stolen from the original beamer poster 
% Copyright 2007 by 
% Philippe Dreuw <dreuw@cs.rwth-aachen.de> and 
% Thomas Deselaers <deselaers@cs.rwth-aachen.de>
% Slight modifications made in August 2009 by Nathaniel Johnston (nathaniel@nathanieljohnston.com)
%-----------------------------------------------------------
\RequirePackage{xkeyval}[2006/11/18]

\newif\ifportrait
\newif\ifcustomsize
\newif\ifdebug

\DeclareOptionX{size}[a0b]{
  \typeout{beamerposter: checking size input, please wait.}
  \XKV@cc*+[\val\nr]{#1}{a0b,a0,a1,a2,a3,a4,custom}{%
    \typeout{beamerposter: the input \val\ \nr\ was correct, we proceed.}
    \ifcase\nr\relax
    %a0b
    \setlength{\paperwidth}{119cm}
    \setlength{\paperheight}{88cm}
    \setlength{\textwidth}{116cm}
    \setlength{\textheight}{88cm}
    \or
    %a0
    \setlength{\paperwidth}{118.82cm}
    \setlength{\paperheight}{83.96cm}
    \setlength{\textwidth}{117.82cm}
    \setlength{\textheight}{82.96cm}
    \or
    %a1
    \setlength{\paperwidth}{83.96cm}
    \setlength{\paperheight}{59.4cm}
    \setlength{\textwidth}{82.96cm}
    \setlength{\textheight}{58.4cm}
    \or
    %a2
    \setlength{\paperwidth}{59.4cm}
    \setlength{\paperheight}{41.98cm}
    \setlength{\textwidth}{58.4cm}
    \setlength{\textheight}{40.98cm}
    \or
    %a3
    \setlength{\paperwidth}{41.98cm}
    \setlength{\paperheight}{29.7cm}
    \setlength{\textwidth}{40.98cm}
    \setlength{\textheight}{28.7cm}
    \or
    %a4
    \setlength{\paperwidth}{29.7cm}
    \setlength{\paperheight}{21.0cm}
    \setlength{\textwidth}{28.7cm}
    \setlength{\textheight}{20.0cm}
    \or
    \customsizetrue
    \fi    
  }{%
    \PackageWarning{beamerposter}{the input \val\ was incorrect and was ignored.}
  }%
  \typeout{beamerposter: finished size input check.}
}
\DeclareOptionX{orientation}[portrait]{
  \typeout{beamerposter: checking orientation input, please wait.}
  \XKV@cc*+[\val\nr]{#1}{portrait,landscape}{%
    \typeout{beamerposter: the input \val\ \nr\ was correct, we proceed.}
    \ifcase\nr\relax
    \portraittrue
    \or
    \portraitfalse
    \fi    
  }{%
    \PackageWarning{beamerposter}{the input \val\ was incorrect and was ignored.}
  }%
  \typeout{beamerposter: finished orientation check.}
}
\DeclareOptionX{scale}[1.0]{\edef\myfontscale{#1}\typeout{beamerposter: myfontscale=\myfontscale}}
\DeclareOptionX{width}{\edef\customwidth{#1}\typeout{beamerposter: custom poster width=\customwidth}}
\DeclareOptionX{height}{\edef\customheight{#1}\typeout{beamerposter: custom poster height=\customheight}}
\DeclareOptionX{debug}{\typeout{beamerposter: enabled debug mode}\debugtrue}
\DeclareOptionX*{\PackageWarning{beamerposter}{Unknown option ignored: \CurrentOption}}
%\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ExecuteOptionsX{size=a0,scale=1.0}
\ProcessOptionsX\relax

\ifdebug
  \RequirePackage[debug]{fp}
\else
  \RequirePackage{fp}
\fi

%% swap sizes for portrait orientation
\ifportrait
  \newdimen\tmp
  \setlength{\tmp}{\paperwidth}
  \setlength{\paperwidth}{\paperheight}
  \setlength{\paperheight}{\tmp}
  \setlength{\tmp}{\textwidth}
  \setlength{\textwidth}{\textheight}
  \setlength{\textheight}{\tmp}
\else\relax
\fi

%% overwrite dimensions if custom size
\ifcustomsize
  \setlength{\paperwidth}{\customwidth cm}
  \setlength{\paperheight}{\customheight cm}
  \FPupn{\resulttextwidth}{1 customwidth  -}
  \FPupn{\resulttextheight}{1 customheight -}
  \setlength{\textwidth}{\resulttextwidth cm}
  \setlength{\textheight}{\resulttextheight cm}
\fi

%% Setting proper dimensions for a DIN A0 printer
\setlength{\headheight}{0 cm}
\setlength{\headsep}{0 cm}
\setlength{\topmargin}{-12.7 mm}     % -1in +1.47cm
\setlength{\oddsidemargin}{-25.4 mm} % -1in +0.4cm

%% For the page layout
\ifdebug
\typeout{beamerposter: paperwidth=\the\paperwidth, paperheight=\the\paperheight}
\typeout{beamerposter: textwidth=\the\textwidth, textwidth=\the\textheight}
\fi
\geometry{
  paperwidth=\the\paperwidth,
  paperheight=\the\paperheight,
  hmargin=1cm,%
  vmargin=0cm,%
  head=0.5cm, % 
  headsep=0pt,%
  foot=0.5cm  % 
}

%% scalable vector fonts
\edef\fontSizeX{14.4}\edef\fontSizeY{18}   
\FPupn{\resultscriptsizeX}{myfontscale fontSizeX * 2 round}
\FPupn{\resultscriptsizeY}{myfontscale fontSizeY * 2 round}
\renewcommand*{\tiny}{\fontsize{\resultscriptsizeX}{\resultscriptsizeY}\selectfont}

\edef\fontSizeX{17.28}\edef\fontSizeY{22}
\FPupn{\resultfootnotesizeX}{myfontscale fontSizeX * 2 round}
\FPupn{\resultfootnotesizeY}{myfontscale fontSizeY * 2 round}
\renewcommand*{\scriptsize}{\fontsize{\resultfootnotesizeX}{\resultfootnotesizeY}\selectfont}

\edef\fontSizeX{20.74}\edef\fontSizeY{25}
\FPupn{\resultsmallX}{myfontscale fontSizeX * 2 round}
\FPupn{\resultsmallY}{myfontscale fontSizeY * 2 round}
\renewcommand*{\footnotesize}{\fontsize{\resultsmallX}{\resultsmallY}\selectfont}

\edef\fontSizeX{24.88}\edef\fontSizeY{30}
\FPupn{\resultnormalsizeX}{myfontscale fontSizeX * 2 round}
\FPupn{\resultnormalsizeY}{myfontscale fontSizeY * 2 round}
\renewcommand*{\small}{\fontsize{\resultnormalsizeX}{\resultnormalsizeY}\selectfont}

\edef\fontSizeX{29.86}\edef\fontSizeY{37}
\FPupn{\resultlargeX}{myfontscale fontSizeX * 2 round}
\FPupn{\resultlargeY}{myfontscale fontSizeY * 2 round}
\renewcommand*{\normalsize}{\fontsize{\resultlargeX}{\resultlargeY}\selectfont}

\edef\fontSizeX{35.83}\edef\fontSizeY{45}
\FPupn{\resultLargeX}{myfontscale fontSizeX * 2 round}
\FPupn{\resultLargeY}{myfontscale fontSizeY * 2 round}
\renewcommand*{\large}{\fontsize{\resultLargeX}{\resultLargeY}\selectfont}

\edef\fontSizeX{43}\edef\fontSizeY{54}
\FPupn{\resultLARGEX}{myfontscale fontSizeX * 2 round}
\FPupn{\resultLARGEY}{myfontscale fontSizeY * 2 round}
\renewcommand*{\Large}{\fontsize{\resultLARGEX}{\resultLARGEY}\selectfont}

\edef\fontSizeX{51.6}\edef\fontSizeY{64}
\FPupn{\resulthugeX}{myfontscale fontSizeX * 2 round}
\FPupn{\resulthugeY}{myfontscale fontSizeY * 2 round}
\renewcommand*{\LARGE}{\fontsize{\resulthugeX}{\resulthugeY}\selectfont}

\edef\fontSizeX{61.92}\edef\fontSizeY{77}
\FPupn{\resultHugeX}{myfontscale fontSizeX * 2 round}
\FPupn{\resultHugeY}{myfontscale fontSizeY * 2 round}
\renewcommand*{\huge}{\fontsize{\resultHugeX}{\resultHugeY}\selectfont}

\edef\fontSizeX{74.3}\edef\fontSizeY{93}
\FPupn{\resultveryHugeX}{myfontscale fontSizeX * 2 round}
\FPupn{\resultveryHugeY}{myfontscale fontSizeY * 2 round}
\renewcommand*{\Huge}{\fontsize{\resultveryHugeX}{\resultveryHugeY}\selectfont}

\edef\fontSizeX{80.3}\edef\fontSizeY{101}
\FPupn{\resultVeryHugeX}{myfontscale fontSizeX * 2 round}
\FPupn{\resultVeryHugeY}{myfontscale fontSizeY * 2 round}
\newcommand*{\veryHuge}{\fontsize{\resultVeryHugeX}{\resultVeryHugeY}\selectfont}

\edef\fontSizeX{107}\edef\fontSizeY{134}
\FPupn{\resultVERYHugeX}{myfontscale fontSizeX * 2 round}
\FPupn{\resultVERYHugeY}{myfontscale fontSizeY * 2 round}
\newcommand*{\VeryHuge}{\fontsize{\resultVERYHugeX}{\resultVERYHugeY}\selectfont}

% set the normalfont (default)
\renewcommand*{\normalfont}{\normalsize}
%-----------------------------------------------------------

\usetheme{confposter}

\setbeamerfont{block body}{family=\sffamily}

\renewcommand{\raggedright}{\leftskip=0pt \rightskip=0pt plus 0cm}

\newtheorem{thm}{Theorem}

\newcommand{\blanc}{{\\ \vspace{0.3cm}}}
\newcommand{\onecol}{0.225\paperwidth}
\newcommand{\twocol}{0.47\paperwidth}
\newcommand{\threecol}{0.715\paperwidth}
\newcommand{\fourcol}{0.96\paperwidth}

\hyphenation{re-con-struc-tion re-qui-re-ments}

%-----------------------------------------------------------
% Define colours (see beamerthemeconfposter.sty to change these colour definitions)
%-----------------------------------------------------------
\definecolor{bleubcam}{rgb}{0.00  0.00  0.9}    % Bleu du SL
\definecolor{Green}{rgb}{0,.55,0}
\definecolor{Red}{rgb}{.75,0,0}
\definecolor{dgreen}{cmyk}{0.8,0,0.9,0.5}
\definecolor{dblue}{cmyk}{1,0.1,0,0.6}

\setbeamercolor{block title}{fg=bleubcam!95,bg=black!5}
\setbeamercolor{block body}{fg=black,bg=white}
\setbeamercolor{block alerted title}{fg=white,bg=bleubcam!35}
\setbeamercolor{block alerted body}{fg=black,bg=dblue!3}

\def\@principalInvestigator{}
\def\@currentMembers{}
\def\@collaborators{}
\def\@supportStaff{}
\def\@pastMembers{}

\def\principalInvestigator#1{\gdef\@principalInvestigator{#1}}
\def\currentMembers#1{\gdef\@currentMembers{#1}}
\def\collaborators#1{\gdef\@collaborators{#1}}
\def\supportStaff#1{\gdef\@supportStaff{#1}}
\def\pastMembers#1{\gdef\@pastMembers{#1}}

%-----------------------------------------------------------
% Title of poster and Project title
%-----------------------------------------------------------
\title{
  \textcolor{bleubcam}{NUMERIWAVES Project ERC FP7 - 246775} 
  \textcolor{black}{New analytical and numerical methods in wave propagation}
}

%-----------------------------------------------------------
% Name and authors of poster/paper/research
%-----------------------------------------------------------
\author{\the\year}
\institute{
  \includegraphics[height=5cm]{figures/logo} \hspace{1in} 
  \includegraphics[height=5cm]{figures/erc-logo} \hspace{1in} 
  \begin{minipage}{\numeriwaves@cWidth}
    {\large\textcolor{black}{\textbf{Principal Investigator: \@principalInvestigator}}}\\
    \textbf{Current members: }{\bf \@currentMembers}\\
    \vskip 1mm
    \textbf{Collaborators: }{\bf \@collaborators}\\
    \textbf{Support and Staff: }{\bf \@supportStaff}\\
    \vskip 2mm
    {\normalsize\textcolor{black}{\textbf{Past members: \@pastMembers}}}
  \end{minipage} \hspace{2in} 
  \includegraphics[height=5cm]{figures/euro}  \hspace{1in} 
  \includegraphics[height=5cm]{figures/FP7} 
}

% Warning there be dragons here, don't move the next line it must be here,
% so that \int is the correct size
\AtEndPreamble{\usepackage{exscale}} 

\AtBeginDocument{
  \setbeamertemplate{background canvas}{\includegraphics[width=\paperwidth,height=\paperheight]{figures/overlay11}}
}
