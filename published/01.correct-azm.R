#!/usr/bin/env Rscript

df <- read.delim("table_s1.tsv",
  header = TRUE,
  stringsAsFactors = F)
df[df$Year < 2005,]$AZI.MIC = 2*df[df$Year < 2005,]$AZI.MIC
write.table(
  df,
  "table_s1.corrected_azm.tsv",
  sep = "\t",
  quote = F,
  row.names = F
)
