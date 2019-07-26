# *Neisseria gonorrhoeae* RASE database

## Dataset

We used 1102 clinical gonococcal isolates collected from 2000 to 2013 by the Centers for Disease Control and Prevention’s Gonococcal Isolate Surveillance Project \[[Grad *et al.*, 2016](https://www.ncbi.nlm.nih.gov/pubmed/27638945)\]. The datasets comprises draft genome assemblies from Illumina HiSeq reads, resistance data, and lineages inferred from sequence cluster computed using [BAPS](http://www.helsinki.fi/bsg/software/BAPS/).

## Methods

The *N. gonorrhoeae* RASE database was constructed with the CDC GISP breakpoints ([mg/L]): azithromycin (AZM): 2.0, cefixime (CFM): 0.25, ciprofloxacin (CIP): 1.0, and ceftriaxone (CRO): 0.125. Before applying the breakpoints, azithromycin MICs for strains collected before 2005 were doubled in order to correct for the [known inconsistencies](https://www.ncbi.nlm.nih.gov/pubmed/30963175) of the phenotyping protocol due to a change in formulation of the commercial media.

The draft assemblies and the phylogenetic tree were downloaded from [Zenodo](https://zenodo.org/record/2618836). Three prevalent types of plasmids were downloaded from GenBank, localized in the GISP database using BLAST, and removed from the dataset: the cryptic plasmid ([pJD1](https://www.ncbi.nlm.nih.gov/nuccore/NC_001377.1)), the beta-lactamase plasmid ([pJD4](https://www.ncbi.nlm.nih.gov/nuccore/NC_002098.1)), and the conjugative plasmid ([pEP5289](https://www.ncbi.nlm.nih.gov/nuccore/GU479466.1)). The gonococcal ProPhyle index was constructed with the (*k*-mer size *k=18*.

## Issues

Please use [Github issues](https://github.com/c2-d2/rase-db-ngonorrhoeae-gisp/issues).


## Releases and changelog

See [Github releases](https://github.com/c2-d2/rase-db-ngonorrhoeae-gisp/releases).


## License

[MIT](LICENSE).


## Contact

[Karel Brinda](https://scholar.harvard.edu/brinda) \<kbrinda@hsph.harvard.edu\>
