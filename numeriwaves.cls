% v0.1 by Erich L Foster 05 July 2013
%%% IDENTIFICATION --------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[01/01/10]
\ProvidesClass{numeriwaves}[05/07/2013 v0.1 NUMERIWAVES poster]

\LoadClass[final,8pt]{beamer}
\RequirePackage[a0b]{beamerposter}

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
\usetheme{confposter}

\setbeamerfont{block body}{family=\sffamily}
%\everymath{\mathsf{\xdef\mysf{\mathgroup\the\mathgroup\relax}}\displaystyle\mysf}

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
