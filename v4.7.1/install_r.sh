#! /bin/bash

#
# Usage:
# After build the image and then execute this on guest (binding host's $HOME)
#

R -e 'install.packages("BiocManager")' && \
R -e 'BiocManager::install(version = "3.15")' && \
R -e 'BiocManager::install("AnnotationDbi")' && \
R -e 'BiocManager::install("org.Hs.eg.db")' && \
R -e 'BiocManager::install("org.Mm.eg.db")' && \
R -e 'BiocManager::install("ballgown")' && \
R -e 'BiocManager::install("clusterProfiler")' && \
R -e 'BiocManager::install("DESeq2")' && \
R -e 'BiocManager::install("EBSeq")' && \
R -e 'BiocManager::install("edgeR")' && \
R -e 'BiocManager::install("GO.db")' && \
R -e 'BiocManager::install("polyester")' && \
R -e 'BiocManager::install("tximport")' && \
R -e 'BiocManager::install("rtracklayer")' && \
# sleuth not work with the latest rhdf5, so install an older version of rhdf5 instead
wget https://bioc.ism.ac.jp/packages/3.13/bioc/src/contrib/Rhdf5lib_1.14.2.tar.gz && \
R CMD INSTALL Rhdf5lib_1.14.2.tar.gz && \
wget https://bioc.ism.ac.jp/packages/3.13/bioc/src/contrib/rhdf5filters_1.4.0.tar.gz && \
R CMD INSTALL rhdf5filters_1.4.0.tar.gz && \
wget https://bioc.ism.ac.jp/packages/3.13/bioc/src/contrib/rhdf5_2.36.0.tar.gz
R CMD INSTALL rhdf5_2.36.0.tar.gz && \
R -e 'install.packages("here")' && \
R -e 'install.packages("docopt")' && \
R -e 'install.packages("ggpubr")' && \
R -e 'install.packages("ggplotify")' && \
R -e 'install.packages("ggrepel")' && \
R -e 'install.packages("ggedit")' && \
R -e 'install.packages("ggcorrplot")' && \
R -e 'install.packages("UpSetR")' && \
R -e 'install.packages("plotly")' && \
R -e 'install.packages("hydroGOF")' && \
# NOTE: Latest version of XML package does not work in R 3.6.2
wget https://cran.r-project.org/src/contrib/Archive/XML/XML_3.99-0.3.tar.gz && \
R CMD INSTALL XML_3.99-0.3.tar.gz && \
R -e 'install.packages("plotROC")' && \
rm XML_3.99-0.3.tar.gz && \
apt update --allow-insecure-repositories && \
apt -y install ghostscript && \
R -e 'BiocManager::install("genomation")' && \
R -e 'BiocManager::install("GenomicRanges")' && \
R -e 'BiocManager::install("methylKit")' && \
