% forestrystudies.cls
% LaTeX class for Forestry Studies | Metsanduslikud Uurimused journal
% Author/s: Steffen Noe, Emilio Mercuri

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{forestrystudies}[2026/04/01 Forestry Studies refined class]
\LoadClass[12pt, twoside]{article}

% --------------------
% Packages
% --------------------
\RequirePackage{iftex}

\ifPDFTeX
% pdfLaTeX setup
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext,newtxmath}
\else
% XeLaTeX or LuaLaTeX setup
\RequirePackage{fontspec}
\RequirePackage{unicode-math}

% Times-like fonts (close to newtx)
\IfFontExistsTF{TeX Gyre Pagella}{
  \setmainfont{TeX Gyre Pagella}
}{
  \setmainfont{Latin Modern Roman}
}
%\setsansfont{Fira Sans}
%\setmonofont{TeX Gyre Cursor}
\IfFontExistsTF{TeX Gyre Pagella Math}{
  \setmathfont{TeX Gyre Pagella Math}
}{
  \setmathfont{Latin Modern Math}
}
\fi

\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{microtype}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{caption}
%\RequirePackage{authblk} % skipped cannot retreive easily author or affiliation info for custom title page.
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{etoolbox}
\RequirePackage{multicol} % in case it's useful
\RequirePackage{calc}
\RequirePackage{afterpage}
\RequirePackage{tikz}

% --------------------
% Page layout and basic settings
% --------------------
\geometry{a4paper,left=20mm,right=20mm,top=10mm,bottom=40mm,includehead,includefoot}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.4\baselineskip}
%\onehalfspacing
\singlespacing
\setlength{\columnsep}{20pt}

% --------------------
% User-settable strings and logo
% --------------------
% Logo filename (document can call \setFSlogo{file.png})
\newcommand{\FS@logo}{}                  % default empty
\newcommand{\setFSlogo}[1]{\renewcommand{\FS@logo}{#1}}

% CC BY Logo filename (document can call \setFSccbylogo{file.png})
\newcommand{\FS@ccbylogo}{}                  % default empty
\newcommand{\setFSccbylogo}[1]{\renewcommand{\FS@ccbylogo}{#1}}

% ORCID icon for the author list (document can call \setFSorcidicon{file.png})
\newcommand{\FS@orcidicon}{logos/logo-orcid.pdf}
\newcommand{\setFSorcidicon}[1]{\renewcommand{\FS@orcidicon}{#1}}
\newcommand{\orcidicon}{\includegraphics[width=0.32cm]{\FS@orcidicon}}

% Journal info line (printed in first-page header area)
\newcommand{\FS@journalinfo}{Forestry Studies | Metsanduslikud Uurimused}
\newcommand{\setFSjournalinfo}[1]{\renewcommand{\FS@journalinfo}{#1}}

% DOI string (printed bottom-left on first page)
\newcommand{\FS@doi}{}
\newcommand{\setFSdoi}[1]{\renewcommand{\FS@doi}{#1}}

% subtitle (optional, printed above title if set)
\newcommand{\FS@subtitle}{}
\newcommand{\setFSsubtitle}[1]{\renewcommand{\FS@subtitle}{#1}}

% keywords
\newcommand{\FS@keywords}{}
\newcommand{\setFSkeywords}[1]{\renewcommand{\FS@keywords}{#1}}

% affiliations
\newcommand{\FS@affil}{}
\newcommand{\setFSaffil}[1]{\renewcommand{\FS@affil}{#1}}

% authors line
\newcommand{\FS@author}{}
\newcommand{\setFSauthor}[1]{\renewcommand{\FS@author}{#1}}

% citation  line
\newcommand{\FS@citation}{}
\newcommand{\setFScitation}[1]{\renewcommand{\FS@citation}{#1}}

% copyright  line
\newcommand{\FS@copyright}{}
\newcommand{\setFScopyright}[1]{\renewcommand{\FS@copyright}{#1}}

% bibresource set the bibliography file
\newcommand{\FS@bibresource}{references.bib} % default bibliography file
\newcommand{\setFSbibresource}[1]{\renewcommand{\FS@bibresource}{#1}}

% hyperlink color setup (document can call \setFSlinkcolor{blue} or similar)
\newcommand{\FS@linkcolor}{black} % default link color is black
\newcommand{\setFSlinkcolor}[1]{\renewcommand{\FS@linkcolor}{#1}}

% Running author (document may override via \renewcommand{\runningauthor}{...})
\newcommand{\runningauthor}{}

% --------------------
% Header / footer / page styles
% --------------------
% First-page style: logo left, journal text centered, thin rule below header and above DOI/footer
\fancypagestyle{FSfirst}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyhead[L]{%
    \begin{minipage}[t]{0.20\textwidth}%
      \vspace{1.5mm}%
      \ifx\FS@logo\@empty\else
      \includegraphics[height=9mm]{\FS@logo}%
      \fi
    \end{minipage}%
  }%
  \fancyhead[C]{%
    \begin{minipage}[t]{\textwidth}%
      \vspace{-3.5mm}%
      \parbox{\textwidth}{
        \flushright\scriptsize\FS@journalinfo \\
        %\vspace{2pt}%
        \rule{0.8\textwidth}{0.8pt}
      }%
    \end{minipage}%
  }%
  \fancyhead[R]{}%
  \fancyfoot[C]{%
    \begin{minipage}[t]{\textwidth}%
      \rule{\textwidth}{0.4pt}
      \vspace{1.5mm}%
      \scriptsize DOI: \FS@doi \\%
      \ifx\FS@ccbylogo\@empty\else
      \includegraphics[height=9mm]{\FS@ccbylogo}%
      \fi
      \hspace{1.5mm}
      \begin{minipage}[t]{0.7\textwidth}%
        \vspace{-8.5mm}%
        \scriptsize \FS@copyright
      \end{minipage}
      \begin{minipage}[t]{0.1\textwidth}%
        \parbox{\textwidth}{
          \vspace{8.5mm}%
          \flushright\rule{\textwidth}{0.8pt}
          \flushright\fontsize{8}{10}\selectfont\thepage
        }%
      \end{minipage}%
    \end{minipage}%
  }%
}%
%\fancyfoot[R]{\fontsize{8}{10}\selectfont\thepage}%

% Normal (subsequent) pages: running author left, page numbers right or left according odd/even, thin rules above footers
\fancypagestyle{FSnormal}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0.4pt}%
  \fancyhead[LE]{\fontsize{8}{10}\selectfont\rmfamily\runningauthor}%
  \fancyhead[RO]{\fontsize{8}{10}\selectfont\rmfamily\@title}%
  \fancyfoot[LE]{
    \begin{minipage}[t]{0.1\textwidth}%
      \parbox{\textwidth}{
        \vspace{30mm}%
        \flushleft\rule{\textwidth}{0.8pt}
        \flushleft\fontsize{8}{10}\selectfont\thepage
      }%
    \end{minipage}
  }%
  \fancyfoot[RO]{
    \begin{minipage}[t]{0.1\textwidth}%
      \parbox{\textwidth}{
        \vspace{30mm}%
        \flushright\rule{\textwidth}{0.8pt}
        \flushright\fontsize{8}{10}\selectfont\thepage
      }%
    \end{minipage}%
  }
}

% set default pagestyle to FSnormal
\pagestyle{FSnormal}

% --------------------
% Title and author fonts & layout
% --------------------
\newcommand{\FS@titlefont}{\fontsize{18}{22}\selectfont\bfseries\rmfamily}
\newcommand{\FS@authorfont}{\fontsize{14}{18}\selectfont\bfseries\rmfamily}
\newcommand{\FS@affilfont}{\fontsize{10}{13}\selectfont\rmfamily\normalfont}
\newcommand{\FS@keywordfont}{\fontsize{10}{13}\selectfont\rmfamily}
\newcommand{\FS@abstractfont}{\fontsize{10}{13}\selectfont\rmfamily}

% Provide a normal \maketitle as fallback (kept simple)
\renewcommand{\maketitle}{%
  \begingroup
  \centering
  {\FS@subtitle \par}\vspace{3ex}%
  {\FS@titlefont \@title \par}\vspace{1.5ex}%
  {\FS@authorfont \FS@author \par}\vspace{1ex}%
  {\FS@affilfont \@date \par}\vspace{2ex}%
  \endgroup
}

% Public macro for one-column title + abstract block used inside \twocolumn[ ... ]
% Usage: \twocolumn[\FSmaketitleandabstract{<abstract text>}]
\newcommand{\FSmaketitleandabstract}[1]{%
  \thispagestyle{FSfirst}% apply first page style (logo + journal info)
  \begingroup
  %\centering
  \hfill % to ensure the minipage is left-aligned
  \begin{minipage}[t]{0.88\textwidth}%
    \vspace{3ex}%
    {\FS@subtitle \par}\vspace{3ex}%
    {\FS@titlefont \@title \par}\vspace{3ex}%
    % authors (authblk will have already formatted \@author)
    {\FS@authorfont \FS@author \par}\vspace{3ex}%
    % optional short citation line below authors (comment out or edit in document if undesired)
    {\FS@affilfont {\FS@citation}\par}\vspace{3ex}%
    % Abstract block: bold label + text
    \begin{minipage}{\textwidth}
      {\FS@abstractfont \textbf{Abstract.}\ #1 \par}
    \end{minipage}\par\vspace{3ex}%
    \begin{minipage}{\textwidth}
      {\FS@keywordfont \textbf{Key words:}\ \FS@keywords \par}
    \end{minipage}\par\vspace{3ex}%
    \begin{minipage}{\textwidth}
      {\FS@affilfont \textbf{Authors' addresses:}\ \FS@affil \par}
    \end{minipage}\par\vspace{5ex}%
  \end{minipage}%
  \endgroup
  \afterpage{
    \newgeometry{left=20mm,right=20mm,top=10mm,bottom=10mm,includehead,includefoot}
    \twocolumn[]
  }
}

% --------------------
% Section formatting
% --------------------
\titleformat{\section}{\normalfont\large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\bfseries}{\thesubsection}{1em}{}
\titlespacing*{\section}{0pt}{12pt}{6pt}
\titlespacing*{\subsection}{0pt}{10pt}{4pt}

% Captions
\captionsetup{%
  font=small,
  %labelfont=bf,
  skip=6pt,
  format=hang,
  singlelinecheck=false
}

% --------------------
% Hyperref setup (colors can be adjusted as needed)
% --------------------
\newcommand{\FShypersetup}{%
  \hypersetup{
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=\FS@linkcolor,          % color of internal links (change box color with linkbordercolor)
    citecolor=\FS@linkcolor,        % color of links to bibliography
    filecolor=\FS@linkcolor,      % color of file links
    urlcolor=\FS@linkcolor
  }         % color of external links
}
\AtBeginDocument{\FShypersetup} % apply hyperref setup at begin of document

% --------------------
% Bibliography: biblatex / biber by default
% --------------------
\RequirePackage[backend=biber,style=apa,maxcitenames=2]{biblatex}
\addbibresource{\FS@bibresource} % default bibliography file
%\addbibresource{references.bib}

\DeclareFieldFormat[article,incollection,unpublished]{title}{#1}%No quotes for article titles
\DeclareFieldFormat[thesis]{title}{\mkbibemph{#1}} % Theses like book titles
% Non-italic journal titles and book titles
\DeclareFieldFormat*{title}{ -- #1}
\DeclareFieldFormat*{journaltitle}{ -- #1}
\DeclareFieldFormat*{booktitle}{ -- #1}
% Force volume to be upright (non-italic)
\DeclareFieldFormat[article,periodical]{volume}{#1}
\DeclareFieldFormat[book,inbook]{volume}{#1}

%\DeclareFieldFormat[article]{journaltitle}{--\mkbibemph{#1}}

% Smaller bibliography font
\renewcommand{\bibfont}{\normalfont\footnotesize}

% End of class
\endinput
