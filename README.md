# Forestry Studies (Metsanduslikud Uurimused) LaTeX Class

A LaTeX class designed for the journal *Forestry Studies | Metsanduslikud Uurimused*, following the official style guidelines of the journal.

## Features

- **Dual engine support**: Works with pdfLaTeX, XeLaTeX, and LuaLaTeX
- **Custom page layout**: A4 paper with precise margins
- **Professional formatting**: Journal-style headers and footers
- **Logo support**: Customizable journal and Creative Commons logos
- **Metadata management**: DOI, copyright, keywords, and affiliations
- **Bibliography**: Integrated biblatex support with APA style
- **Two-column title page**: Optimized for journal submission
- **Typography**: Times-like fonts (TeX Gyre Pagella) for a professional look

## Requirements

- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- BibLaTeX and Biber for bibliography processing

## Compilation

### Using LuaLaTex (recommended)

```bash
xelatex filename.tex
biber filename
xelatex filename.tex
xelatex filename.tex
```

### Using XeLaTeX 

```bash
xelatex filename.tex
biber filename
xelatex filename.tex
xelatex filename.tex
```

### Using pdfLaTeX

```bash
pdflatex filename.tex
biber filename
pdflatex filename.tex
pdflatex filename.tex
```

## Basic Usage

### Document Class

```latex
\documentclass{forestrystudies}
```

### Setting Metadata

```latex
\setFSjournalinfo{Forestry Studies | Metsanduslikud Uurimused}
\title{Your Paper Title}
\setFSsubtitle{Optional Subtitle}
\setFSauthor{Author Name}
\setFSaffil{Institution Name, Country}
\setFSdoi{10.12345/forestry.2024.001}
\setFScopyright{© 2024 Author Name. This work is licensed under CC BY 4.0.}
\setFSkeywords{keyword1; keyword2; keyword3}
\setFScitation{Citation information}
```

### Setting hyperlink colors

The class defines black as standard color for hyperlinks and switches from frames to color scheme. 

```latex
% \setFSlinkcolor{blue} % comment out for default color
\FShypersetup
```
To enable as example blue hyperlinks uncomment the \setFShyperlink{colname} command and ad a color after your choice.

```latex
\setFSlinkcolor{blue} % comment out for default color
\FShypersetup
```


### Setting Logos

```latex
% Journal logo (typically on first page header)
\setFSlogo{path/to/logo.png}

% Creative Commons BY logo (typically on first page footer)
\setFSccbylogo{path/to/ccby.png}
```

### Bibliography

```latex
% Set bibliography file
% Not yet available! Currently just use the standard file:
%    references.bib
% \setFSbibresource{references.bib}

% Use the default bibliography
\printbibliography

% Or create a custom bibliography section
\begin{bibliography}{references}
\end{bibliography}
```

### Two-Column article Title Page

The articles in FSMU format have a two-column layout with a single column title page format:

```latex
\documentclass{forestrystudies}

% Set metadata
\title{Your Article Title}
\setFSauthor{Author Name}
\setFSaffil{Institution}
\setFSkeywords{keywords}
\setFSlogo{logo.png}

\begin{document}

% Use the two-column title page macro
\twocolumn[ % make one column title page
  \FSmaketitleandabstract{
    This is the abstract of your paper. It should provide a clear summary of the research question, methods, results, and conclusions.
  }
]

% Here begin the twocolumn body

% Main content
\section{Introduction}
% Your article content here...

\end{document}
```

## Page Layout

The class uses the following layout:
- **Paper size**: A4
- **Margins**: 20mm (left/right), 10mm (top), 40mm (bottom)
- **Line spacing**: Single spacing
- **Indentation**: No paragraph indentation

## Typography

- **Main font**: TeX Gyre Pagella (Times-like)
- **Math font**: TeX Gyre Pagella Math
- **Section headings**: Bold, with automatic numbering
- **Captions**: Small, hanging format

## Customization

### Font Settings

The class automatically detects the TeX engine and loads appropriate fonts:
- **pdfLaTeX**: Uses `newtxtext` and `newtxmath`
- **XeLaTeX/LuaLaTeX**: Uses `fontspec` and `unicode-math` with TeX Gyre Pagella

### Section Formatting

```latex
% Customize section spacing (default: 12pt before, 6pt after)
\setlength{\parskip}{0.4\baselineskip}
```

### Page Style

The class provides two page styles:
- `FSfirst`: First page with logo, journal info, and DOI
- `FSnormal`: Subsequent pages with running author and page numbers

## Example Project Structure

```
.
├── forestrystudies.cls       # The class file
├── references.bib            # Bibliography file
├── logo.png                  # Journal logo (optional)
├── ccby.png                  # CC BY logo (optional)
├── example.tex               # Main document
└── README.md                 # This file
```

## Example Document

```latex
\documentclass{forestrystudies}

\usepackage[base]{babel}
\usepackage{afterpage}
\usepackage{gensymb}

% Set document metadata
\title{Forest Carbon Sequestration in Managed Forests}
\setFSsubtitle{A Long-term Analysis}
\setFSauthor{John Doe\and Jane Smith}
\setFSaffil{Department of Forest Science, University of Life Sciences}
\setFSkeywords{carbon sequestration; forest management; climate change; sustainable forestry}
\setFSdoi{10.12345/forestry.2024.015}
\setFScopyright{\copyright 2024 Doe and Smith. This work is licensed under CC BY 4.0.}
\setFScitation{Doe J, Smith J. 2024. Forest Carbon Sequestration in Managed Forests: A Long-term Analysis. Forestry Studies. 10(1): 123-145.}
\setFSlogo{logo.png}
\setFSccbylogo{ccby.png}

\begin{document}

\twocolumn[
  \FSmaketitleandabstract{
    Forests play a crucial role in carbon sequestration and climate change mitigation. This study examines the long-term carbon storage capacity of managed forests across different management regimes. Using a 30-year dataset from 12 forest stands, we analyzed biomass accumulation, carbon stocks, and the impact of different silvicultural practices. Our results show that continuous cover forestry maintains higher carbon stocks compared to clear-cut systems, particularly in the understory vegetation. These findings have important implications for climate-smart forest management strategies.
  }
]

\section{Introduction}

Forests are one of the largest terrestrial carbon sinks, playing a vital role in the global carbon cycle and climate change mitigation \parencite{ipcc2021}. Understanding carbon sequestration dynamics in managed forests is essential for developing effective climate strategies \parencite{foster2023}.

\section{Methods}

\subsection{Study Area}

The study was conducted in...

\subsection{Data Collection}

\section{Results}

\section{Discussion}

\section{Conclusion}

\bibliography{references}

\end{document}
```

## Notes

- The class automatically includes necessary packages for geometry, setspace, fancyhdr, and bibliography management
- The DOI and copyright fields are automatically displayed on the first page
- Logos should be in PNG format (vector graphics recommended for best quality)
- Ensure all referenced files (logos, bibliography) are in the same directory as the main .tex file

## License

This LaTeX class is provided as-is for use with the Forestry Studies journal.

## Contact

For questions or issues regarding the class, please contact the journal editorial team.