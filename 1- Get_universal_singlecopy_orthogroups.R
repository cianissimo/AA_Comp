#Retrieve Orthogroup information and FASTA sequences from OrthoDB using API
#(see https://www.orthodb.org/orthodb_userguide.html#api )

library(rjson)
library(httr)

#Get from OrthoDB orthogroups at the vertebrate level (taxid=7742)
#that are present in >90% of species and are single copy in >90% of species 
OGs<-fromJSON(file='https://www.orthodb.org//search?level=7742&universal=0.9&singlecopy=0.9&limit=5000')

Tax=list(id=c(8457,40674,7898),name=c("Sauropsida","Mammalia","Actinopterygii"))

if (dir.exists ("data")) stop()
  dir.create("data")

for(OG in OGs$data){
  for(i in 1:NROW(Tax$id)){
    URL<-paste("http://V101.orthodb.org/fasta?id=",OG,"&species=",Tax$id[i],sep="")
    cat(URL,"\n")
    apiResult<-GET(URL)
    file_name<-paste0("data/",Tax$name[i],".fa")
    write(content(apiResult,"text"), file=file_name, append=TRUE)
  }
}
cat("written fasta files\n")


