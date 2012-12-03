%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% OUTHESIS.CLS (v1.12)
% Copyright (c) 2010 by Robin Charles Gilbert. All rights reserved.
%
% This program is free software: you can redistribute it and/or modify it under
% the terms of the GNU General Public License as published by the Free Software
% Foundation, either version 3 of the License, or (at your option) any later
% version.
%
% This program is distributed in the hope that it will be useful, but WITHOUT
% ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
% FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
% details.
%
% You should have received a copy of the GNU General Public License along with
% this program. If not, see <http://www.gnu.org/licenses/>.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LaTeX2e class file for formatting documents according to the Dissertation
% Instruction Packet's guidelines for theses at the University of Oklahoma.
%
% USAGE: \documentclass{outhesis}
%        \documentclass[options]{outhesis}
%
% The default settings produce a final copy, ready for submission (12pt font,
% single-sided, double-spaced).
%
% CLASS OPTIONS:
%
%  * "master": option for master theses
%  * "tables": prints a list of tables (required if there are tables)
%  * "figures": prints a list of figures (required if there are figures)
%  * "algorithms": loads the algorithm2e package and prints a list of algorithms
%  * "index": prints an index (optional)
%  * "compact": produces a compact copy.
%  * "times": changes font to Times, Helvetica and Courier.
%  * "voffset=<value>": moves the text vertically by <value>.
%  * "hoffset=<value>": moves the text horizontally by <value>.
%
% REQUIRED COMMANDS:
%
%  * \title{}: specify the dissertation title (preamble)
%  * \author{}: specify the author's name (preamble)
%  * \degreename{}: specify the degree name (preamble)
%  * \gradyear{}: specify the graduation year (preamble)
%  * \school{}: specify the school name (preamble)
%  * \chair{}: specify the name of the committee chair (preamble)
%  * \abstractfile{}: specify the abstract file (preamble)
%  * \makefrontmatter: prints the front matter (title page, signature page,
%    copyright page, dedication page (if any), acknowledgments (if any), table
%    of contents, list of tables (optional), list of figures (optional) and
%    abstract)
%  * \makebackmatter: prints post-bibliographical matter (appendix (if any)
%    and index (optional))
%
% OPTIONAL COMMANDS:
%
%  * \cochair{}: specify the co-chair (if any) (preamble)
%  * \readerA{}: specify the first reader (preamble)
%  * \readerB{}: specify the second reader (preamble)
%  * \readerC{}: specify the third reader (preamble)
%  * \readerD{}: specify the fourth reader (preamble)
%  * \dedication{}: specify the dedication tag (preamble)
%  * \thanksfile{}: specify the acknowledgments file (preamble)
%  * \appendixfile{}: specify the appendix file (preamble)
%  * \compact{#1}{#2}: execute argument #1 when the compact option is selected,
%    or execute argument #2 otherwise.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Example of use:
%
% \documentclass{outhesis}
% % Class options are: master, tables, figures, algorithms, index, times
% % and compact
%
% % Use these packages for an English dissertation without the Times font
% \usepackage[latin1]{inputenc}
% \usepackage[T1]{fontenc}
% \usepackage[english]{babel}
% \usepackage{lmodern}
% % Insert additional packages and commands below
%
% % Required commands
% \title{Title Name}
% \author{Author Name}
% \degreename{Degree Name}
% \gradyear{2000}
% \school{School Name}
% \chair{Dr.~Thomas Light}
% \abstractfile{filename} % Insert Abstract file name in between brackets
% % The commands \abstractfile, \thanksfile and \appendixfile take filenames as
% % arguments. The source of the abstract (and the acknowledgements and the
% % appendix) must be placed inside a separate file which name is the argument
% % of the command \abstractfile (and thanksfile and \appendixfile).
%
% % Optional commands
% % \cochair{Dr.~William Dyer} % Co-chair (if any)
% % \readerA{Dr.~Albert W.~Wily} % Additional readers (up to four)
% % \readerB{Dr.~Emmett L.~Brown}
% % \readerC{Dr.~Herbert West}
% % \readerD{Dr.~John H.~Watson}
% % \dedication{text} % Insert dedication text in between brackets
% % \thanksfile{filename} % Acknowledgments file name goes in between brackets
% % \appendixfile{filename} % Insert Appendix file name in between brackets
%
% \begin{document}
% \makefrontmatter
%
% % Insert the dissertation text below or the relevant \input command
% % \input{file} % Insert chapter file name in between brackets (if any)
%
% % The following environment makes the bibliography format compatible with the
% % natbib and chapterbib packages
% \begin{oubibliography}
%   \bibliographystyle{plain}
%   \bibliography{file}
% \end{oubibliography}
%
% \makebackmatter
% \end{document}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Changes:
%
% Version 1.0 (2008/09/11):
%  * Initial version
%
% Version 1.1 (2009/06/22):
%  * Fixed a conflict between the index option and the draft option.
%  * Changed the draft mode layout.
%  * Created a master option.
%  * Created a \cochair command.
%  * Expanded the example of use.
%
% Version 1.2 (2010/02/23):
%  * Fixed bibliography and index format issues.
%  * Created an oubibliography environment.
%
% Version 1.3 (2010/03/02):
%  * Created an "algorithms" option.
%
% Version 1.4 (2010/03/08):
%  * Fixed formatting for the \part command.
%
% Version 1.5 (2010/03/21):
%  * Fixed the table of contents entry of the bibliography.
%
% Version 1.6 (2010/04/07):
%  * Created options "voffset" and "hoffset".
%
% Version 1.7 (2010/04/08):
%  * Fixed margin issues.
%
% Version 1.8 (2010/04/22):
%  * Replaced the draft option by the compact option.
%  * Fixed the numbering of algorithms.
%
% Version 1.9 (2010/04/23):
%  * Fixed chapter format.
%
% Version 1.10 (2010/04/26):
%  * Created \compact command.
%
% Version 1.11 (2010/05/05):
%  * Fixed format issues in the compact mode.
%
% Version 1.12 (2010/05/10):
%  * Fixed spacing on the signature page.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% IDENTIFICATION
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{outhesis}[2010/05/10 University of Oklahoma thesis class v1.12]

%%% INITIAL CODE
\RequirePackage{xkeyval}
\RequirePackage{ifthen}
\newboolean{ismaster}\setboolean{ismaster}{false}
\newboolean{hastables}\setboolean{hastables}{false}
\newboolean{hasfigures}\setboolean{hasfigures}{false}
\newboolean{hasalgorithms}\setboolean{hasalgorithms}{false}
\newboolean{hasindex}\setboolean{hasindex}{false}
\newboolean{iscompact}\setboolean{iscompact}{false}
\newboolean{hastimes}\setboolean{hastimes}{false}

%%% OPTION DECLARATION
\DeclareOption{master}{\setboolean{ismaster}{true}}
\DeclareOption{tables}{\setboolean{hastables}{true}}
\DeclareOption{figures}{\setboolean{hasfigures}{true}}
\DeclareOption{algorithms}{\setboolean{hasalgorithms}{true}}
\DeclareOption{index}{\setboolean{hasindex}{true}}
\DeclareOption{compact}{\setboolean{iscompact}{true}}
\DeclareOption{times}{\setboolean{hastimes}{true}}
\newlength{\VOffset}
\newlength{\HOffset}
\DeclareOptionX{voffset}[0in]{\setlength{\VOffset}{#1}}
\DeclareOptionX{hoffset}[0in]{\setlength{\HOffset}{#1}}
\DeclareOption*{}

%%% OPTION EXECUTION
\ProcessOptionsX\relax
\ProcessOptions\relax

%%% CLASS LOADING
\ifthenelse{\boolean{iscompact}}
{\LoadClass[10pt,letterpaper,oneside,twocolumn]{book}}
{\LoadClass[12pt,letterpaper,oneside]{book}}

%%% REQUIRED PACKAGES
\RequirePackage{textcomp}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\ifthenelse{\boolean{iscompact}}{%
  \RequirePackage[dvips,letterpaper,nohead,nomarginpar,ignoreall,%
  margin=0.5in,centering=false,offset={\HOffset,\VOffset},%
  footskip=0.25in]{geometry}%
}{%
  \RequirePackage[dvips,letterpaper,nohead,nomarginpar,ignoreall,%
  hmargin=1in,vmargin=1.05in,centering=false,offset={\HOffset,\VOffset},%
  bindingoffset=0.5in,footskip=0.5in]{geometry}%
}%
\ifthenelse{\boolean{hasindex}}{\RequirePackage{makeidx}\makeindex}{}
\ifthenelse{\boolean{hasalgorithms}}{%
\RequirePackage[ruled,lined,linesnumbered,algochapter]{algorithm2e}}{}

\def\compact#1#2{\ifthenelse{\boolean{iscompact}}{#1}{#2}}

%%% FONTS
\ifthenelse{\boolean{hastimes}}{%
  \RequirePackage[T1]{fontenc}%
  \RequirePackage{mathptmx}%
  \RequirePackage[scaled=.92]{helvet}%
  \RequirePackage{courier}%
  \linespread{1.04}%
}{}

%%% FRONT MATTER PARAMETERS
\def\@ifdefined#1#2{\@ifundefined{#1}{}{#2}}
\def\degreename#1{\gdef\@degreename{#1}}
\def\gradyear#1{\gdef\@gradyear{#1}}
\def\school#1{\gdef\@school{#1}}
\def\chair#1{\gdef\@chair{#1}}
\def\cochair#1{\gdef\@cochair{#1}}
\def\readerA#1{\gdef\@readerA{#1}}
\def\readerB#1{\gdef\@readerB{#1}}
\def\readerC#1{\gdef\@readerC{#1}}
\def\readerD#1{\gdef\@readerD{#1}}
\def\dedication#1{\gdef\@dedication{#1}}
\def\thanksfile#1{\gdef\@thanksfile{#1}}
\def\abstractfile#1{\gdef\@abstractfile{#1}}
\def\appendixfile#1{\gdef\@appendixfile{#1}}

% Default parameters
\gdef\@title{Thesis Title}
\gdef\@author{Author Name}
\gdef\@degreename{Degree Name}
\gdef\@gradyear{\number\the\year}
\gdef\@school{School Name}
\gdef\@chair{Chair Name}

%%% TITLE FORMAT
\newcommand*{\justheading}{\raggedright}
\titleformat{\part}[display]
  {\normalfont\Large\justheading\bfseries}
  {\Large Part \thepart}{1pc}{\Large}
\titleformat{\chapter}[display]
  {\normalfont\huge\justheading\bfseries}
  {\huge\chaptertitlename\ \thechapter}{1pc}{\Large}
\titleformat{\section}
  {\normalfont\large\justheading\bfseries}
  {\thesection}{1em}{}
\titleformat{\subsection}
  {\normalfont\large\justheading\bfseries}
  {\thesubsection}{1em}{}
\titleformat{\subsubsection}
  {\normalfont\normalsize\justheading\bfseries}
  {\thesubsubsection}{1em}{}
\titleformat{\paragraph}[runin]
  {\normalfont\normalsize\justheading\bfseries}
  {\theparagraph}{1em}{}
\titleformat{\subparagraph}[runin]
  {\normalfont\normalsize\justheading\bfseries}
  {\thesubparagraph}{1em}{}

\titlespacing*{\chapter}      {0pt}{0pt}{40pt}
\titlespacing*{\section}      {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection}   {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\paragraph}    {0pt}{3.25ex plus 1ex minus .2ex}{1em}
\titlespacing*{\subparagraph}{\parindent}{3.25ex plus 1ex minus .2ex}{1em}

%%% FRONT MATTER
\def\makefrontmatter{%
  \onecolumn
  \pagestyle{empty}%
  \pagenumbering{roman}%
  \maketitlepage%
  \makesignaturepage%
  \makecopyrightpage%
  \@ifdefined{@dedication}{\makededication{\@dedication}}%
  \pagestyle{plain}%
  \setcounter{page}{4}%
  \@ifdefined{@thanksfile}{\makeacknowledgements}%
  \tableofcontents%
  \ifthenelse{\boolean{hastables}}{%
    \listoftables%
    \addcontentsline{toc}{chapter}{List of Tables}%
  }{}%
  \ifthenelse{\boolean{hasfigures}}{%
    \listoffigures%
    \addcontentsline{toc}{chapter}{List of Figures}%
  }{}%
  \ifthenelse{\boolean{hasalgorithms}}{%
    \listofalgorithms%
    \addcontentsline{toc}{chapter}{List of Algorithms}%
  }{}%
  \@ifdefined{@abstractfile}{\makeabstract}%
  \pagenumbering{arabic}%
  \setcounter{page}{1}%
  \ifthenelse{\boolean{iscompact}}{%
    \twocolumn\singlespacing%
  }{\doublespacing}%
}%

% Title page
\def\maketitlepage{%
  {%
    \centering%
    {%
      \doublespacing%
      \MakeUppercase{University of Oklahoma}\\%
      \MakeUppercase{Graduate College}%
      \vfill%
      \MakeUppercase{\@title}%
      \vfill%
      \ifthenelse{\boolean{ismaster}}{%
        \MakeUppercase{A thesis}\\%
      }{%
        \MakeUppercase{A dissertation}\\%
      }%
      \MakeUppercase{submitted to the graduate faculty}\\%
      in partial fulfillment of the requirements for the\\%
      Degree of\\%
      \MakeUppercase{\@degreename}%
      \vfill%
      By\\%
      \MakeUppercase{\@author}\\%
    }%
    Norman, Oklahoma\\%
    \@gradyear%

  }%
  \newpage%
}

% Signature page
\def\signature#1{%
  \parbox[t]{2.5in}{%
    \shortstack[r]{\vrule width 2.5in height 0.4pt\\[3pt]#1}%
  }%
}
\def\makesignaturepage{%
  \null%
  \vspace{0.7in}%
  {%
    \centering%
    \MakeUppercase{\@title}\\[2\baselineskip]%
    \ifthenelse{\boolean{ismaster}}{%
      \MakeUppercase{A thesis approved for the}\\%
    }{%
      \MakeUppercase{A dissertation approved for the}\\%
    }%
    \MakeUppercase{\@school}\\[11\baselineskip]%
    \MakeUppercase{By}%

  }%
  \vfill%
  {%
    \raggedleft%
    \@ifundefined{@cochair}{%
      \signature{\@chair, Chair}%
    }{%
      \signature{\@chair, Co-Chair}\\[3\baselineskip]%
      \signature{\@cochair, Co-Chair}%
    }%
    \@ifdefined{@readerA}{\\[3\baselineskip]\signature{\@readerA}}%
    \@ifdefined{@readerB}{\\[3\baselineskip]\signature{\@readerB}}%
    \@ifdefined{@readerC}{\\[3\baselineskip]\signature{\@readerC}}%
    \@ifdefined{@readerD}{\\[3\baselineskip]\signature{\@readerD}}%

  }%
  \newpage%
}

% Copyright page
\def\makecopyrightpage{%
  \null%
  \vfill%
  {%
    \centering%
    \textcopyright~Copyright by \MakeUppercase{\@author} \@gradyear\\%
    All Rights Reserved.%

  }%
  \newpage%
}

% Dedication page
\def\makededication#1{%
  \null%
  \vspace{0.25\textheight}%
  {%
    \raggedleft%
    {#1}%

  }%
  \newpage%
}

% Acknowledgements page
\def\makeacknowledgements{%
  {%
    \ifthenelse{\boolean{iscompact}}{\singlespacing}{\doublespacing}%
    \chapter*{Acknowledgements}%
    \addcontentsline{toc}{chapter}{Acknowledgements}%
    \@input{\@thanksfile}%
    \newpage%
  }%
}

% Abstract page
\def\makeabstract{%
  {%
    \ifthenelse{\boolean{iscompact}}{\singlespacing}{\doublespacing}%
    \chapter*{Abstract}%
    \addcontentsline{toc}{chapter}{Abstract}%
    \@input{\@abstractfile}%
    \newpage%
  }%
}

%%% BIBLIOGRAPHY
\renewcommand\bibname{References}  % Name on the Reference Page
\newenvironment{oubibliography}{%
  \newpage\begin{singlespace}\addcontentsline{toc}{chapter}{References}
  % Sets the name on the table of contents
}{\end{singlespace}}

% Appendix
\def\makeappendix{\begin{appendix}\@input{\@appendixfile}\end{appendix}}

% Index
\def\makeprintindex{%
  \newpage%
  \addcontentsline{toc}{chapter}{Index}%
  {\singlespacing\printindex}%
}

%%% BACK MATTER
\def\makebackmatter{%
  \@ifdefined{@appendixfile}{\makeappendix}%
  \ifthenelse{\boolean{hasindex}}{\makeprintindex}{}%
}%
