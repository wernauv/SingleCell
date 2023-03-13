library(Seurat)
#open project
data<-readRDS("/source/ddtx_merged_demultiplexed_clustered_compartment_azi_elmentaiteadultileum.rds")

#filter 60%. mito genes
data<-subset(data,subset = percent.mt < 60)

#filter T8 patient 3 sample (wrongly sampled - only recipient cells)
data@meta.data$pt_project_lane<-paste(data@meta.data$lane,data@meta.data$donor_final, sep="_")
data<-subset(data, subset=pt_project_lane!="220504_lane04_UMCGDDtx00005r")

#save project
saveRDS(data, "/source/ddtx_merged_demultiplexed_clustered_compartment_azi_elmentaiteadultileum_below60pctmito.rds")

