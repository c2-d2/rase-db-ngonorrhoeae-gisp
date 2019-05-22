#!/usr/bin/env Rscript

df.sup <- read.delim("table_s1.tsv",
                     header = TRUE,
                     stringsAsFactors = F)
df.mlst <- read.delim("mlst.tsv",
                      header = TRUE, stringsAsFactors = F)

df <- merge(df.sup, df.mlst, by.x = 1, by.y = 1)
df[df == "-"] <- NA
write.table(df, "isolates.tsv", sep = "\t", quote = F, row.names = F)

