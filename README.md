# AA_Comp
## EVOLUTIONARY CHANGES IN AMINOACID COMPOSITION OF ORTHOLOGOUS GENES DURING VERTEBRATES EVOLUTION

# Summary
This project performs an analysis in *R* about aminoacid composition of orthologous proteins in vertebrates. 
We considerated three classes: *Actinopterygii, Sauropsida* and *Mammalia*. The program allows to work also with different type of classifications according to research needs. 

The scripts are used for:

- Recovering data
- Filtering and organizing data
- Conducting statistical analysis 
- Plotting analysis results

# Usage
### [DOWNLOAD *R* SCRIPTS](https://github.com/Percud/AA_Comp/archive/master.zip)
### INSTALL *R* PACKAGES:
```
rjson
httr
Biostrings
dplyr
```
### GET ORTHOGROUPS INFORMATION AND FASTA SEQUENCES FROM [OrthoDB](https://www.orthodb.org/):
Run the script [1- Get_universal_singlecopy_orthogroups.R](https://github.com/Percud/AA_Comp/blob/master/1-%20Get_universal_singlecopy_orthogroups.R).
The program recovers all the orthogroups from the server OrthoDB using API. Parameters: vertebrate level, single copy gene, orthogroup present in 90% of the species. 
The program create a folder `data` in which there are three documents `.fa` (one for each class) that contain FASTA sequences of the orthogroups.

### OBTAIN AA COUNT OF ORTHOGROUPS AND ORGANIZE DATA INTO DATAFRAMES 
Run the script [2a- AA_Comp_Analysis.R](https://github.com/Percud/AA_Comp/blob/master/2a-%20AA_Comp_Analysis.R).
The necessary *funtions* are recovered ([2b- Functions.R](https://github.com/Percud/AA_Comp/blob/master/2b-%20Functions.R)). It's create a dataframe `AA_Comp_nofilter` in which are organized downloaded data. 
The dataframe later is cleaned up from odd data and it's create a new dataframe `AA_Comp` with only **filtered data**.

### UNDERSTANDING THE DATASET ***AA_Comp***
Dataset contains records of orthologous proteins of the database OrthoDB. Below is a brief **description** of the 30 variables in the dataset:
- `Classification`: group of organisms (Sauropsida-Mammalia-Actinopterygii)
- `seq_id`: unique sequence identifier
- `pub_gene_id`: unique gene identifier
- `pub_og_id`: unique ortholog group identifier
- `og_name`: ortholog group name
- `level`: NCBI taxon identifier of the clade 
- `description`: short description of the ortholog group
- `width`: sequence length
- `seq_seq`: sequence string, without fasta-header 
- name of each AA: count in the sequence


![IMG1](./Images/Screen%20DF%201.png)

![IMG2](./Images/Screen%20DF%202.png)


### STATISTICAL ANLYSIS: ***T-TEST*** AND ***Log2 FOLD CHANGE***
In the same script [2a- AA_Comp_Analysis.R](https://github.com/Percud/AA_Comp/blob/master/2a-%20AA_Comp_Analysis.R) there is the instruction to perform the **statistical analysis** of data. 
The program make a new dataframe `Res` with ***pvalue*** (t-test) and ***Log2 fold change*** results, obtained by **pairwise comparisons** between the three different classes.

### UNDERSTANDING THE DATASET ***Res***
**Description** of the 12 variables
- `pub_og_id` : unique ortholog group identifier
- `og_name`: ortholog group name
- `AA`: name of the aminoacid considered
- `.pvalue`: value of pairwise *t-test*
- `Sauropsida/Mammalia/Actinopterygii`: mean of the relative AA in the orthogroup
- `.fold_change`: value of pairwise *Log2 fold change*

![IMG3](./Images/Screen%20Res%201.png)

![IMG4](./Images/Screen%20Res%202.png)










