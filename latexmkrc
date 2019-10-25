@default_files = ('report.tex');

$pdf_mode = 5;
$preview_mode = 1;

$pdflatex = "pdflatex -file-line-error -shell-escape -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";

$xelatex = "xelatex -file-line-error -shell-escape -halt-on-error -interaction=nonstopmode -no-pdf -synctex=1 %O %S";

$xdvipdfmx = "xdvipdfmx -E -o %D %O %S";

$out_dir = "./out";

