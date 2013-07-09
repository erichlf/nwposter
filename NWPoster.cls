% This is a beamer poster class developed for the NUMERIWAVES project 
% it modifies the original poster class by
% Philippe Dreuw <dreuw@cs.rwth-aachen.de> and 
% Thomas Deselaers <deselaers@cs.rwth-aachen.de>
% v0.2 by Erich L Foster 09 July 2013
%%% IDENTIFICATION --------------------------------------------------------
\def\NWPoster@version{0.2}
\def\NWPoster@date{2013/05/09}
\def\NWPoster@msg{NWPoster: latex-beamer poster class}
\typeout{Package: \NWPoster@date. v.\NWPoster@version. \NWPoster@msg}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NWPoster}[\NWPoster@date. v.\NWPoster@version. \NWPoster@msg]

\LoadClass[final,8pt]{beamer}

%-----------------------------------------------------------
% Allow the user to define the width of the collaborators section 
%-----------------------------------------------------------
\RequirePackage{kvoptions}

\SetupKeyvalOptions{
  family=NWP,
  prefix=NWP@
}

%used for pretocmd and apptocmd 
\RequirePackage{etoolbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amssymb,amsthm,dsfont}
\RequirePackage{graphicx,color,subfigure,epstopdf}
\RequirePackage{float,caption,eso-pic}
\RequirePackage{mathtools}
\mathtoolsset{showonlyrefs}
\RequirePackage{tikz}		% for drawing the nice rounded boxes
\usetikzlibrary{arrows,backgrounds}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{textcomp}
\RequirePackage{fp} %this is for scalable fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
  \begin{minipage}{65cm}
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

%-----------------------------------------------------------
% Define the poster below
% This is stolen from the original beamer poster 
% Copyright 2007 by 
% Philippe Dreuw <dreuw@cs.rwth-aachen.de> and 
% Thomas Deselaers <deselaers@cs.rwth-aachen.de>
% Slight modifications made in August 2009 by Nathaniel Johnston (nathaniel@nathanieljohnston.com)
%-----------------------------------------------------------

%define paper options
%default is a0b
\def\@paperwidth{119cm}
\def\@paperheight{88cm}
\def\@textwidth{116cm}
\def\@textheight{88cm}
\DeclareOption{a0b}{
    \def\@paperwidth{119cm}
    \def\@paperheight{88cm}
    \def\@textwidth{116cm}
    \def\@textheight{88cm}
}
\DeclareOption{a0}{
  \def\@paperwidth{118.82cm}
  \def\@paperheight{83.96cm}
  \def\@textwidth{117.82cm}
  \def\@textheight{82.96cm}
}
\DeclareOption{a1}{
  \def\@paperwidth{83.96cm}
  \def\@paperheight{59.4cm}
  \def\@textwidth{82.96cm}
  \def\@textheight{58.4cm}
}
\DeclareOption{a2}{
  \def\@paperwidth{59.4cm}
  \def\@paperheight{41.98cm}
  \def\@textwidth{58.4cm}
  \def\@textheight{40.98cm}
}
\DeclareOption{a3}{
  \def\@paperwidth{41.98cm}
  \def\@paperheight{29.7cm}
  \def\@textwidth{40.98cm}
  \def\@textheight{28.7cm}
}
\DeclareOption{a4}{
  \def\@paperwidth{29.7cm}
  \def\@paperheight{21.0cm}
  \def\@textwidth{28.7cm}
  \def\@textheight{20.0cm}
}

\ExecuteOptions{size=a0b,scale=1.0}
\ProcessOptions*

\edef\scale{1.15}

\setlength{\paperwidth}{\@paperwidth}
\setlength{\paperheight}{\@paperheight}
\setlength{\textwidth}{\@textwidth}
\setlength{\textheight}{\@textheight}

%% Setting proper dimensions for a DIN A0 printer
\setlength{\headheight}{0 cm}
\setlength{\headsep}{0 cm}
\setlength{\topmargin}{-12.7 mm}     % -1in +1.47cm
\setlength{\oddsidemargin}{-25.4 mm} % -1in +0.4cm

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
\FPmul\scriptsizeX{\scale}{\fontSizeX}
\FPmul\scriptsizeY{\scale}{\fontSizeX}
\FPround\scriptsizeX{\scriptsizeX}{2}
\FPround\scriptsizeY{\scriptsizeY}{2}
\renewcommand*{\tiny}{\fontsize{\scriptsizeX}{\scriptsizeY}\selectfont}

\edef\fontSizeX{17.28}\edef\fontSizeY{22}
\FPmul\footnotesizeX{\scale}{\fontSizeX}
\FPmul\footnotesizeY{\scale}{\fontSizeX}
\FPround\footnotesizeX{\footnotesizeX}{2}
\FPround\footnotesizeY{\footnotesizeY}{2}
\renewcommand*{\scriptsize}{\fontsize{\footnotesizeX}{\footnotesizeY}\selectfont}

\edef\fontSizeX{20.74}\edef\fontSizeY{25}
\FPmul\smallX{\scale}{\fontSizeX}
\FPmul\smallY{\scale}{\fontSizeX}
\FPround\smallX{\smallX}{2}
\FPround\smallY{\smallY}{2}
\renewcommand*{\footnotesize}{\fontsize{\smallX}{\smallY}\selectfont}

\edef\fontSizeX{24.88}\edef\fontSizeY{30}
\FPmul\normalX{\scale}{\fontSizeX}
\FPmul\normalY{\scale}{\fontSizeX}
\FPround\normalX{\normalX}{2}
\FPround\normalY{\normalY}{2}
\renewcommand*{\small}{\fontsize{\normalX}{\normalY}\selectfont}

\edef\fontSizeX{29.86}\edef\fontSizeY{37}
\FPmul\largeX{\scale}{\fontSizeX}
\FPmul\largeY{\scale}{\fontSizeX}
\FPround\largeX{\largeX}{2}
\FPround\largeY{\largeY}{2}
\renewcommand*{\normalsize}{\fontsize{\largeX}{\largeY}\selectfont}

\edef\fontSizeX{35.83}\edef\fontSizeY{45}
\FPmul\LargeX{\scale}{\fontSizeX}
\FPmul\LargeY{\scale}{\fontSizeX}
\FPround\LargeX{\LargeX}{2}
\FPround\LargeY{\LargeY}{2}
\renewcommand*{\large}{\fontsize{\LargeX}{\LargeY}\selectfont}

\edef\fontSizeX{43}\edef\fontSizeY{54}
\FPmul\LARGEX{\scale}{\fontSizeX}
\FPmul\LARGEY{\scale}{\fontSizeX}
\FPround\LARGEX{\LARGEX}{2}
\FPround\LARGEY{\LARGEY}{2}
\renewcommand*{\Large}{\fontsize{\LARGEX}{\LARGEY}\selectfont}

\edef\fontSizeX{51.6}\edef\fontSizeY{64}
\FPmul\hugeX{\scale}{\fontSizeX}
\FPmul\hugeY{\scale}{\fontSizeX}
\FPround\hugeX{\hugeX}{2}
\FPround\hugeY{\hugeY}{2}
\renewcommand*{\LARGE}{\fontsize{\hugeX}{\hugeY}\selectfont}

\edef\fontSizeX{61.92}\edef\fontSizeY{77}
\FPmul\HugeX{\scale}{\fontSizeX}
\FPmul\HugeY{\scale}{\fontSizeX}
\FPround\HugeX{\HugeX}{2}
\FPround\HugeY{\HugeY}{2}
\renewcommand*{\huge}{\fontsize{\HugeX}{\HugeY}\selectfont}

\edef\fontSizeX{74.3}\edef\fontSizeY{93}
\FPmul\veryHugeX{\scale}{\fontSizeX}
\FPmul\veryHugeY{\scale}{\fontSizeX}
\FPround\veryHugeX{\veryHugeX}{2}
\FPround\veryHugeY{\veryHugeY}{2}
\renewcommand*{\Huge}{\fontsize{\veryHugeX}{\veryHugeY}\selectfont}

\edef\fontSizeX{80.3}\edef\fontSizeY{101}
\FPmul\VeryHugeX{\scale}{\fontSizeX}
\FPmul\VeryHugeY{\scale}{\fontSizeX}
\FPround\VeryHugeX{\VeryHugeX}{2}
\FPround\VeryHugeY{\VeryHugeY}{2}
\newcommand*{\veryHuge}{\fontsize{\VeryHugeX}{\VeryHugeY}\selectfont}

\edef\fontSizeX{107}\edef\fontSizeY{134}
\FPmul\VERYHugeX{\scale}{\fontSizeX}
\FPmul\VERYHugeY{\scale}{\fontSizeX}
\FPround\VERYHugeX{\VERYHugeX}{2}
\FPround\VERYHugeY{\VERYHugeY}{2}
\newcommand*{\VeryHuge}{\fontsize{\VERYHugeX}{\VERYHugeY}\selectfont}

% set the normalfont (default)
\renewcommand*{\normalfont}{\normalsize}
%-----------------------------------------------------------

\newcommand{\makeruleinbox}{{\usebeamercolor[bg]{block alerted title}\centering\hspace*{-0.7cm}\rule{\inboxrule}{0.5cm}}}
\usepackage{ragged2e}

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

\definecolor{lgreen} {RGB}{180,210,100}
\definecolor{dblue}  {RGB}{20,66,129}
\definecolor{ddblue} {RGB}{11,36,69}
\definecolor{lred}   {RGB}{220,0,0}
\definecolor{nred}   {RGB}{224,0,0}
\definecolor{norange}{RGB}{230,120,20}
\definecolor{nyellow}{RGB}{255,221,0}
\definecolor{ngreen} {RGB}{98,158,31}
\definecolor{dgreen} {RGB}{78,138,21}
\definecolor{nblue}  {RGB}{28,130,185}
\definecolor{jblue}  {RGB}{20,50,100}
\definecolor{bleubcam}{rgb}{0.00  0.00  0.9}    % Bleu du SL
\definecolor{Green}{rgb}{0,.55,0}
\definecolor{Red}{rgb}{.75,0,0}
\definecolor{dgreen}{cmyk}{0.8,0,0.9,0.5}
\definecolor{dblue}{cmyk}{1,0.1,0,0.6}

% set the basic colors
\setbeamercolor{palette primary}   {fg=black,bg=white}
\setbeamercolor{palette secondary} {fg=black,bg=white}
\setbeamercolor{palette tertiary}  {bg=jblue,fg=white}
\setbeamercolor{palette quaternary}{fg=black,bg=white}
\setbeamercolor{structure}{fg=jblue}
\setbeamercolor{titlelike}         {bg=jblue,fg=white}
\setbeamercolor{frametitle}        {bg=jblue!10,fg=jblue}
\setbeamercolor{cboxb}{fg=black,bg=jblue}
\setbeamercolor{cboxr}{fg=black,bg=red}

% set colors for itemize/enumerate
\setbeamercolor{item}{fg=bleubcam}
\setbeamercolor{item projected}{fg=white,bg=bleubcam}

% set colors for blocks
\setbeamercolor{block title}{fg=bleubcam!95,bg=black!5}
\setbeamercolor{block body}{fg=black,bg=white}

% set colors for alerted blocks (blocks with frame)
\setbeamercolor{block alerted title}{fg=white,bg=jblue}
\setbeamercolor{block alerted body}{fg=black,bg=jblue!10}
\setbeamercolor{block alerted title}{fg=white,bg=bleubcam!35}
\setbeamercolor{block alerted body}{fg=black,bg=dblue!3}

% set the fonts
\setbeamerfont{section in head/foot}{series=\bfseries}
\setbeamerfont{block title}{series=\bfseries}
\setbeamerfont{block alerted title}{series=\bfseries}
\setbeamerfont{frametitle}{series=\bfseries}
\setbeamerfont{frametitle}{size=\Large}
\setbeamerfont{block body}{series=\rmfamily}

% set some beamer theme options
\setbeamertemplate{title page}[default][colsep=-4bp,rounded=true]
\setbeamertemplate{sections/subsections in toc}[square]
\setbeamertemplate{items}[circle]
\setbeamertemplate{blocks}[width=0.0]
\beamertemplatenavigationsymbolsempty

% set bibliography style
\setbeamertemplate{bibliography item}[text]
\setbeamercolor{bibliography item}{fg=black,bg=white}
\setbeamercolor{bibliography entry author}{fg=black,bg=white}
\setbeamercolor{bibliography item}{fg=black,bg=white}

% define some length variables that are used by the template
\newlength{\inboxwd}
\newlength{\iinboxwd}
\newlength{\inboxrule}
\makeatletter
\makeatother

%==============================================================================
% build the poster title
%==============================================================================
\setbeamertemplate{headline}{
 \leavevmode
  \begin{columns}
   \begin{column}{\linewidth}
    \vskip0.5cm
    \centering
    \usebeamercolor{title in headline}{\color{jblue}\huge{\textbf{\inserttitle}} \\[0.5ex]}
    \usebeamercolor{author in headline}{\color{fg}\Large{\insertauthor}\\[1ex]}
    \usebeamercolor{institute in headline}{\color{fg}\large{\insertinstitute}\\[1ex]}
    \vskip0.2cm
   \end{column}
   \vspace{0.5cm}
  \end{columns}
 \vspace{0.2in}
 \begin{beamercolorbox}[wd=47in,colsep=0.15cm]{cboxb}\end{beamercolorbox}
 \vspace{0.1in}
}

% Block definition
\setbeamertemplate{block begin}
{
  \par\vskip\medskipamount
  \begin{beamercolorbox}[colsep*=0ex,dp={1ex},center]{block title}
    \vskip-0.25cm
    \usebeamerfont{block title}\large\insertblocktitle
    \begin{flushleft}
    \vskip-1cm
    \begin{tikzpicture}[remember picture,overlay]
      \shade [inner color=bleubcam,outer color=white]
      (0,0) rectangle (\textwidth,0.3cm);
    \end{tikzpicture}
    \end{flushleft}
  \end{beamercolorbox}
  {\parskip0pt\par}
  \ifbeamercolorempty[bg]{block title}
  {}
  {\ifbeamercolorempty[bg]{block body}{}{\nointerlineskip\vskip-0.5pt}}
  \usebeamerfont{block body}
  \vskip-0.5cm
  \begin{beamercolorbox}[colsep*=0ex,vmode]{block body}
  \justifying
}

\setbeamertemplate{block end}
{
  \end{beamercolorbox}
  \vskip\smallskipamount
}

% Alert block definition (with frame)
\setbeamertemplate{block alerted begin}
{
  \par\vskip\medskipamount
  \begin{beamercolorbox}[sep=0ex,rounded=true,center,dp={2ex}]{block alerted title}
    \vskip0.01cm
    \usebeamerfont{block title}\large\insertblocktitle
  \end{beamercolorbox}
  {\parskip0pt\par}
  \usebeamerfont{block body}
  \vskip-0.8cm
  \begin{beamercolorbox}[sep=0.5cm, rounded=true,center]{block alerted title}
  \setlength{\inboxwd}{\linewidth}
  \addtolength{\inboxwd}{-1cm}
  \begin{beamercolorbox}[rounded=true,wd={\inboxwd},center]{block alerted body}
  \setlength{\iinboxwd}{\inboxwd}
  \setlength{\inboxrule}{\inboxwd}
  \addtolength{\iinboxwd}{-0.5cm}
  \addtolength{\inboxrule}{0.5cm}
  \begin{center}
  \begin{minipage}{\iinboxwd}
  \justifying
}

\setbeamertemplate{block alerted end}
{
  \end{minipage}
  \end{center}
  \end{beamercolorbox}
  \end{beamercolorbox}
  \vskip\smallskipamount
}

% Warning there be dragons here, don't move the next line it must be here,
% so that \int is the correct size
\AtEndPreamble{\usepackage{exscale}} 

\AtBeginDocument{
  \setbeamertemplate{background canvas}{\includegraphics[width=\paperwidth,height=\paperheight]{figures/overlay11}}

%  \begin{frame}[t]
%  \vskip-4ex
}

%\AtEndDocument{
%  \end{frame}
%}
