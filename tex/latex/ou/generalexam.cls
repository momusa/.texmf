\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{generalexam}[1996/01/10 v3.0A
  adapted from  USC Thesis and Dissertation Style]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@thesis
\DeclareOption{dissertation}{\@thesisfalse}
\DeclareOption{thesis}{\@thesistrue}

%\newif\if@dissertation
%\DeclareOption{dissertation}{\@dissertationtrue}
%\DeclareOption{thesis}{\@dissertationfalse}

\newif\if@proposal
\DeclareOption{final}{\@proposalfalse}
\DeclareOption{proposal}{\@proposaltrue}

\newif\if@copyright
\DeclareOption{nocopyright}{\@copyrightfalse}
\DeclareOption{copyright}{\@copyrighttrue}

\DeclareOption{fussy}{\fussy}
\DeclareOption{sloppy}{\sloppy}

\newif\if@openbib
\DeclareOption{clref}{\@openbibfalse}
\DeclareOption{opref}{\@openbibtrue}
\DeclareOption{openbib}{\@openbibtrue}

\newif\if@techreport
\DeclareOption{techreport}{\@techreporttrue}

\newcommand{\addreportoption}[1]{%
  \@ifundefined{@reportoptions}%
    {\edef\@reportoptions{#1}}%
    {\edef\@reportoptions{\@reportoptions,#1}}}

\DeclareOption{letterpaper}{\addreportoption{letterpaper}}
\DeclareOption{10pt}{\addreportoption{10pt}}
\DeclareOption{11pt}{\addreportoption{11pt}}
\DeclareOption{12pt}{\addreportoption{12pt}}
\DeclareOption{oneside}{\addreportoption{oneside}}
\DeclareOption{twoside}{\addreportoption{twoside}}
\DeclareOption{onecolumn}{\addreportoption{onecolumn}}
\DeclareOption{leqno}{\addreportoption{leqno}}
\DeclareOption{fleqn}{\addreportoption{fleqn}}

\DeclareOption*{\ClassWarning{USCthesis}{The option `\CurrentOption' not used}}

\ExecuteOptions{dissertation,final,nocopyright,fussy,clref}
\ProcessOptions

\@ifundefined{@reportoptions}%
  {\ClassWarning{USCthesis}{Nothing in report options}}%
  {\PassOptionsToClass{\@reportoptions}{report}}

\LoadClass{report}

% Brian uses method in 4.1 of book "Guide to LaTeX" to change spacing.  Note
% the "\small\normalsize" is a "trick" needed to trigger the change, except for
% that, it does nothing.
% Note the 1.3 is not the standard double space, but Grad College might accept it.
% The standard double space is 1.66, I believe.
\newcommand{\OUdoublespace}{\renewcommand{\baselinestretch}{1.66} \small\normalsize} %LMK 1.66
\newcommand{\OUsinglespace}{\renewcommand{\baselinestretch}{1.0} \small\normalsize}
\OUdoublespace

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\pagetop}[1]{%
  \global \topmargin #1
  \global\advance \topmargin -1.0 true in}

\newcommand{\pageleft}[2][0pt]{%
  \if@twoside
    \global \oddsidemargin #2
    \global\advance \oddsidemargin -1.0 true in
    \global \evensidemargin #2
    \global\advance \evensidemargin -1.0 true in
    \global\advance \evensidemargin #1
    \flushbottom
    \if@proposal\else\if@techreport\else
       \typeout{Warning: Thesis/Dissertation should be
                           printed on one side only.}
    \fi\fi
  \else
    \global \oddsidemargin #2
    \global\advance \oddsidemargin -1.0 true in
    \global \evensidemargin \oddsidemargin
    \raggedbottom
  \fi}

\newdimen\footheight
\newcommand{\pageheight}[2][\baselineskip]{%
  \global \footheight #1%
  \global \textheight #2%
  \global\advance \textheight -\footheight}

\newcommand{\pagewidth}[1]{\global \textwidth #1}

\newcommand{\pagemargin}[1]{\global \footskip #1\baselineskip}

\brokenpenalty       10000
\clubpenalty         10000
\displaywidowpenalty 10000
\widowpenalty        10000
\lefthyphenmin           2
\righthyphenmin          3

\@addtoreset{equation}{chapter}
\headheight 0.0 true pt
\headsep    0.0 true pt
\topskip    0.0 true pt
\itemsep    0.0 true pt

\pagetop{1.0 true in}
\pageleft{1.0 true in}
\pageheight{9.0 true in}
\pagewidth{6.50 true in}
\pagemargin{1.0}

\let\LARGE=\Large
\let\huge=\Large
\let\Huge=\Large

\if@twoside
  \def\ps@plain{%
    \def\@oddhead{}%
    \def\@oddfoot{\hfil\rm\thepage}%
    \def\@evenhead{}
    \def\@evenfoot{\rm\thepage\hfil}}%
\else
  \def\ps@plain{%
    \def\@oddhead{}%
    \def\@oddfoot{\hfil\rm\thepage}%
    \def\@evenhead{}
    \let\@evenfoot\@oddfoot}%
\fi

\renewcommand{\title}[2][\@empty]{%
  \gdef\@volume{#1}%
  \gdef\@title{#2}}


\newcommand{\thesisinput}[1]{%
  \if@filesw
    \begingroup
      \let\thesisinput=\@gobble
      \@input{#1}%
    \endgroup
  \fi}

\newcommand{\addvolumecontents}[2][toc]{%
  \if@filesw
    \begingroup
      \let\label\@gobble
      \let\index\@gobble
      \let\glossary\@gobble
      \def\protect##1{\string\string\string##1\string\space \space}%
      \edef\@tempa{%
        \immediate\write\@auxout{%
          \string\@writefile{#1}{\protect \thesisinput{#2.#1}}}}%
      \@tempa
      \if@nobreak
        \ifvmode
          \nobreak
        \fi
      \fi
    \endgroup
  \fi
  \relax}

\newcommand{\@startpageA}{1}
\newcommand{\@startpageB}{1}

\newcommand{\startingpagenumber}[2]{%
  \gdef\@startpageA{#1}%
  \gdef\@startpageB{#2}}

\newif\if@showmajorfield
\@showmajorfieldtrue

\newcommand{\universityname}[1]{%
  \gdef\@university{\uppercase{#1}}}
\newcommand{\@university}{UNIVERSITY OF OKLAHOMA}

\newcommand{\schoolname}[1]{%
  \gdef\@schoolname{#1}%
  \@showmajorfieldfalse}
\newcommand{\@schoolname}{SCHOOL OF METEOROLOGY}

\newcommand{\Degree}[1]{%
  \if@thesis
    \gdef\@mastersdegree{#1}%
  \else
    \gdef\@doctorsdegree{#1}}
\newcommand{\@mastersdegree}{MASTER OF SCIENCE IN METEOROLOGY} %in metr added LMK 9 May 2007
\newcommand{\@doctorsdegree}{DOCTOR of PHILOSOPHY}

\newcommand{\majorfield}[1]{%
  \gdef\@majorfield{#1}%
  \@showmajorfieldtrue}
\newcommand{\@majorfield}{}

\newcommand{\committee}[1]{\gdef\@committee{#1}}
\newcommand{\@committee}{}

\newcommand{\depositdate}[1]{\gdef\@depositdate{#1}}
\newcommand{\@depositdate}{}

\newcommand{\memberone}[1]{\gdef\@memberone{#1}}
\newcommand{\@memberone}{}
\newcommand{\membertwo}[1]{\gdef\@membertwo{#1}}
\newcommand{\@membertwo}{}
\newcommand{\memberthree}[1]{\gdef\@memberthree{#1}}
\newcommand{\@memberthree}{}
\newcommand{\memberfour}[1]{\gdef\@memberfour{#1}}
\newcommand{\@memberfour}{}
\newcommand{\memberfive}[1]{\gdef\@memberfive{#1}}
\newcommand{\@memberfive}{}
\newcommand{\membersix}[1]{\gdef\@membersix{#1}}
\newcommand{\@membersix}{}

\newcommand{\submitdate}[1]{\gdef\@submitdate{#1}}
\newcommand{\@submitdate}{%
  \ifcase \the\month
    \or January%
    \or February%
    \or March%
    \or April%
    \or May%
    \or June%
    \or July%
    \or August%
    \or September%
    \or October%
    \or November%
    \or December%
  \fi
  \space
  \number \the\year}

\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}
\ifnum \month=12
  \@tempcnta=\year
  \advance\@tempcnta by 1
  \edef\@copyrightyear{\number \the\@tempcnta}
\else
  \def\@copyrightyear{\number \the\year}
\fi

\newenvironment{preface}%
  {\newpage
   \pagenumbering{roman}%
   \pagestyle{empty}%
   \OUdoublespace
     \if@proposal
       \setcounter{page}{1}%
       \addtocounter{page}{\@startpageA}%
     \else
       \maketitle
%       \makesignature
 %      \makecopyright
       \setcounter{page}{3}%
       \addtocounter{page}{\@startpageA}%
     \fi
   %
   %to use hypperref, you need to add an additional {} at the end of \addcontents below
   %
   \newpage
     \ifx\@volume\@empty\else
       \addtocontents{toc}{\protect\contentsline{part}{\@volume}{}{}}%
     \fi
   \pagestyle{plain}}
%
  {\newpage
   \pagenumbering{arabic}%
   \pagestyle{plain}%
   \setcounter{page}{\@startpageB}}

\newcommand{\makecopyright}{%
 \begin{titlepage}%
    \begin{center}
    \ \\
    \vskip 8.5 true in% %changed 7.0 to 8.5 LMK 10 May 2007
    \OUsinglespace %added LMK 10 May 2007
    \copyright Copyright \  by \  \@author \ \@depositdate \\
    All Rights Reserved.
    \end{center}
  \end{titlepage}
  }

\newcommand{\makesignature}{%
  \begin{titlepage}%
  \OUsinglespace
    \null
    \vskip 60.0 true pt%
    \begin{center}
      %%% {\bf \LARGE \@title \par} %obsolete April 19, 2007
      {\@title \par} %remains single space here (but double space on title page)
      \ifx\@volume\@empty\else
        \vskip 3em%
        \@volume
      \fi
      \vskip 3em%
      \if@thesis
        {A THESIS APPROVED FOR THE}%
      \else
        {A DISSERTATION APPROVED FOR THE}%
      \fi\\*%
      { \@majorfield \par}%
	  \if@thesis
        {\vskip 1.25in}
	  \else
        {\vskip .5in}
	  \fi

%      {{By}\\*[5.0 true cm]% %changed 1 to 5 LMK 2 May 2007
      {{By}\\*[2.0 true cm]% %changed  5 to 3 BHF 25 November 2007
          \par}
    \end{center}%
%%%Brian
\noindent
\hspace*{3in}\hrulefill
\vskip .0in
\hspace*{3in}\@memberone
\vskip .5in
%
\noindent
\hspace*{3in}\hrulefill
\vskip .0in
\hspace*{3in}\@membertwo
\vskip .5in
%
\noindent
\hspace*{3in}\hrulefill
\vskip .0in
\hspace*{3in}\@memberthree
\vskip .5in
%
\if@thesis
%then enough lines
\else %dissertation, add two more signature lines
\noindent
\hspace*{3in}\hrulefill
\vskip .0in
\hspace*{3in}\@memberfour
\vskip .5in
%
\noindent
\hspace*{3in}\hrulefill
\vskip .0in
\hspace*{3in}\@memberfive
\vskip .5in
%uncomment the following 4 lines if you have 6 members
%\noindent
%\hspace*{3in}\hrulefill
%\vskip .0in
%\hspace*{3in}\@membersix
%
\fi

    \par
    \vfil
    \end{titlepage}}

\renewcommand{\maketitle}{%
 \begin{titlepage}%
\OUsinglespace
    \setcounter{page}{0}%
    \null
    \vfill
    \begin{center}%
     \@university \\*[0.1 true in]%
     \@schoolname \\*[0.1 true in]%
%
      \vfill
%
      %%% {\bf \LARGE \@title \par} %obsolete April 19, 2007
 	\noindent
 	\OUdoublespace %title is double space on title page only
      {\@title \par} %strict conformance to Grad College, April 19, 2007
 	\OUsinglespace
      \ifx\@volume\@empty\else
        \vskip 0.16 true in
        \@volume
      \fi
      \vskip 0.16 true in
      \vskip 1.0 true in

      \if@thesis
        A THESIS %
      \else
        THE WRITTEN PORTION OF THE GENERAL EXAMINATION%
      \fi\\*[0.05 true in]%
     SUBMITTED TO THE GRADUATE FACULTY\\*[0.25 true in]%

      in partial fulfillment of the requirements for the\\*[0.1 true in]%
      \if@thesis
     Degree of\\*[0.1 true in]% %little d 9 May 2007 LMK % not needed APB
        \@mastersdegree
      \else
     Degree of\\*[0.1 true in]%
     \@doctorsdegree
      \fi\\*[0.1 true in]%

      \vfill
\OUsinglespace
      By\\
      \vskip 0.16 true in
      \@author\\
      Norman, Oklahoma\\
      {\reset@font\small \@depositdate \par}%
%\OUdoublespace
    \end{center}%
    \par
    \vfill
    \if@copyright
      \begin{center}%
        {\reset@font\normalsize\ Copyright~ \@copyrightyear\ ~\@author}%
      \end{center}%
    \fi
  \end{titlepage}
  }



\newdimen\prefacetopspace
\prefacetopspace=1.0 true in

\newcommand\prefacesection{\@dblarg{\@prefacesection}}

\def\@prefacesection[#1]#2{%
  \newpage
  \OUdoublespace %leave next line blank to avoid a bug!

  \pagestyle{plain}%
  \null
  \vskip\prefacetopspace
  \begin{flushleft}% %replaced center with flushleft LMK 10 May 2007
    \section*{#2}%
  \end{flushleft}%
  \addcontentsline{toc}{chapter}{#1}}

\newcommand\prefacesectionX{\@dblarg{\@prefacesectionX}}
\def\@prefacesectionX[#1]#2{%
  \newpage
  \OUdoublespace %leave next line blank to avoid a bug!

  \pagestyle{empty}%
  \null
  \vskip\prefacetopspace
  \begin{flushleft}% %replaced center with flushleft LMK 10 May 2007
    \section*{#2}%
  \end{flushleft}%
}
%  \addcontentsline{toc}{chapter}{#1}}

\renewcommand{\tableofcontents}{%
\OUsinglespace
  \@ifnextchar [%
    {\@starspeciallist{toc}}%
    {\@starspeciallist{toc}[Contents]} }

\renewcommand{\listoftables}{%
\OUsinglespace
  \@ifstar
    {\@ifnextchar [%
       {\@starspeciallist{lot}}%
       {\@starspeciallist{lot}[List Of Tables]}}%
    {\@ifnextchar [%
       {\@speciallist{lot}}%
       {\@speciallist{lot}[List Of Tables]}}}

\renewcommand{\listoffigures}{%
\OUsinglespace
  \@ifstar
    {\@ifnextchar [%
       {\@starspeciallist{lof}}%
       {\@starspeciallist{lof}[List Of Figures]}}%
    {\@ifnextchar [%
       {\@speciallist{lof}}%
       {\@speciallist{lof}[List Of Figures]}}}

\def\@starspeciallist#1[#2]{%
  \newpage
  \@restonecolfalse
  \if@twocolumn
    \@restonecoltrue
    \onecolumn
  \fi
  \chapter*{#2}%
  \@starttoc{#1}%
  \if@restonecol\twocolumn\fi}

\def\@speciallist#1[#2]{%
  \newpage
  \@restonecolfalse
  \if@twocolumn
    \@restonecoltrue
    \onecolumn
  \fi
  \chapter*{#2}%
  \addcontentsline{toc}{chapter}{#2}
  \@starttoc{#1}%
  \if@restonecol\twocolumn\fi}

\renewcommand{\@makechapterhead}[1]{%
  {\parindent 0pt
   \raggedright
   \hyphenpenalty 10000%
   \ifnum \c@secnumdepth > \m@ne
     \reset@font\Large\bfseries \thechapter \hspace{3.0ex} #1\par
   \fi
   \nobreak
   \vskip 20px}
  \hyphenpenalty 50}

  \renewcommand{\@makeschapterhead}[1]{%
  %\vspace*{50pt}%
  {\parindent 0pt
   \raggedright
   \hyphenpenalty 10000%
   \reset@font\Large\bfseries #1\par
   \nobreak}
  \hyphenpenalty 50}

\OUsinglespace



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\section}%
             {\@startsection{section}%
             {1}%
             {\z@}%
             {-3.5ex plus -1ex minus -.2ex}%
             {2.3ex plus .2ex}%
             {\reset@font\large\bfseries\hyphenpenalty 10000}}%

\renewcommand{\subsection}%
             {\@startsection{subsection}%
             {2}%
             {\z@}%
             {-3.5ex plus -1ex minus -.2ex}%
             {1.5ex plus .2ex}%
             {\reset@font\large\bfseries\hyphenpenalty 10000}}%

\renewcommand{\subsubsection}%
             {\@startsection{subsubsection}%
             {3}%
             {\z@}%
             {-3.5ex plus -1ex minus -.2ex}%
             {1.5ex plus .2ex}%
             {\reset@font\normalsize\bfseries\hyphenpenalty 10000}}%

\renewcommand{\paragraph}%
             {\@startsection{paragraph}%
             {4}%
             {\z@}%
             {3.25ex plus 1ex minus .2ex}%
             {-1em}%
             {\reset@font\normalsize\bfseries\hyphenpenalty 10000}}%

\renewcommand{\subparagraph}%
             {\@startsection{subparagraph}%
             {4}%
             {\parindent}%
             {3.25ex plus 1ex minus .2ex}%
             {-1em}%
             {\reset@font\normalsize\bfseries\hyphenpenalty 10000}}%

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Remove colon in \caption, AMS style is to have a period after the
%% figure number
\long\def\@makecaption#1#2{%
%% Create the proper style for the figure and table captions.
%%\renewcommand{\figurename}{\textsc{Fig.}}
%%\renewcommand{\tablename}{\textsc{Table}}
%%\renewcommand{\thefigure}{\arabic{figure}.}
%%\renewcommand{\thetable}{\arabic{table}.}
\vskip\abovecaptionskip
\sbox\@tempboxa{#1~~#2}%
\ifdim \wd\@tempboxa >\hsize
#1~~#2\par%
\else
\global \@minipagefalse
\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
\fi
\vskip\belowcaptionskip}

% All the figures and tables should be at the end on their own pages
%\RequirePackage[nomarkers, tablesfirst]{endfloat}%
%\AtBeginDelayedFloats{\clearpage}

%\RequirePackage{rotating}
%\let\efsaved@sidewaysfigure\sidewaysfigure
%\let\efsaved@sidewaystable\sidewaystable
%\AtBeginTables{\let\sidewaystable=\efsaved@sidewaystable\relax}
%\AtBeginFigures{\let\sidewaysfigure=\efsaved@sidewaysfigure\relax}
%\def\sidewaystable{\efloat@condopen{ttt}
%\efloat@iwrite{ttt}{\string\begin{sidewaystable}}%
%\if@domarkers
%\addtocounter{posttbl}{1}
%\tableplace
%\fi
%\def\@currenvir{efloat@float}%
%\begingroup
%\let\do\ef@makeinnocent \dospecials
%\ef@makeinnocent\^^L% and whatever other special cases
%\endlinecharÔ\^^M \catcodeÔ\^^M=12 \ef@xsidetable}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\bibliographystyle}[1]{%
  \@latexerr{\string\bibliographystyle\space is undefined.
             Use \string\references{#1}{bibfile list}}\@eha}
\renewcommand{\bibliography}[1]{%
  \@latexerr{\string\bibliography\space is undefined.
             Use \string\references{bibstyle}{#1}}\@eha}

\newcommand{\references}{%
\OUsinglespace
%  \renewcommand{\baselinestretch}{1.0} %Brian sets singlespace
% % Brian adds trick to activate above command, from Section 4.1 of "Guide to LaTeX",
% % change fontsize, and change it back to normal:
%  \small\normalsize
  \@ifstar
    {\@referencesA}%
    {\@referencesB}}

\newcommand{\@referencesA}{%
  \@ifnextchar [%
    {\@referencesAA}%
    {\@referencesAA[Reference List]}}%
\def\@referencesAA[#1]#2#3{
  \gdef\@referencesname{#1}
  \if@filesw
    \immediate\write\@auxout{\string\bibstyle{#2}}%
    \immediate\write\@auxout{\string\bibdata{#3}}%
  \fi
  \@input{\jobname.bbl}}

\newcommand{\@referencesB}{%
  \@ifnextchar [
    {\@referencesBB}
    {\@referencesBB[Reference List]}}

\def\@referencesBB[#1]#2#3{%
  \cleardoublepage
  \addcontentsline{toc}{chapter}{#1}
  \gdef\@referencesname{#1}
  \if@filesw
    \immediate\write\@auxout{\string\bibstyle{#2}}%
    \immediate\write\@auxout{\string\bibdata{#3}}%
  \fi
  \@input{\jobname.bbl}}

\newcommand{\@referencesname}{Reference List}
\renewcommand{\bibname}{Reference List\vskip 20px}

\renewenvironment{thebibliography}[1]
  {\chapter*{\@referencesname\@mkboth{\@referencesname}{\@referencesname}}
   \list{[\arabic{enumi}]}{
     \settowidth\labelwidth{[#1]}
     \leftmargin\labelwidth   \advance\leftmargin\labelsep
     \if@openbib
       \listparindent -1.5em
       \advance\leftmargin-\listparindent
       \itemindent\listparindent
       \parsep \z@
     \fi
     \usecounter{enumi}}%
   \if@openbib
     \def\newblock{\par}
     \let\\=\@centercr
     \@rightskip\@flushglue   \rightskip\@rightskip
     \leftskip\z@
   \else
     \def\newblock{\hskip .11em plus .33em minus -.07em}%
   \fi
   \sloppy
   \sfcode`\.=1000\relax}%
%
  {\let\endthebibliography=\endlist}

\renewcommand{\appendix}{%
  \par
  \setcounter{chapter}{0}
  \setcounter{section}{0}
  \def\@chapapp{Appendix}
  \def\thechapter{\Alph{chapter}}
  \def\@chapter[##1]##2{
    \refstepcounter{chapter}
    \typeout{\@chapapp\space\thechapter.}
    \addtocontents{toc}{
      \protect\contentsline{chapter}{Appendix \thechapter}{\relax}}
    \addcontentsline{toc}{section}{##1}
    \chaptermark{##1}
    \addtocontents{lof}{\protect\addvspace{10pt}}% Adds between-chapter space
    \addtocontents{lot}{\protect\addvspace{10pt}}% to lists of figs & tables.
    \if@twocolumn
      \@topnewpage[\@makechapterhead{##2}]
    \else \@makechapterhead{##2}
      \@afterheading
    \fi}}

\newenvironment{saying}%
  {\trivlist
   \raggedleft
   \item[]\em}%
%
  {\endtrivlist
   \vspace{20pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{plain}

\if@techreport
  \input{techreport.sty}
\fi
\endinput
%%
%% End of file `USCthesis.cls'.
