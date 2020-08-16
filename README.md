# lncRNA

#### cd_hit.qsub: CD HIT run on mRNA and lncRNA transcriptomes to get an idea of sequence similarity

#### complete_pipeline.qsub: Pipeline with steps from downloading the sequence files to creating the count files

#### corr_test.R: Rscript for Pearson Correlation test 

#### corr_test.qsub: Job script to run corr_test.R

#### count_analysis.Rmd: R markdown file containing multiple analyses done using the count files obtained from the complete analysis pipeline 

### count_analysis_report.pdf: Obtained by knitting count_analysis.Rmd - includes code and outputs such as tables and figures 

#### mrna_annotation.qsub: Annotation of the mRNA transcriptome using UniProt database
