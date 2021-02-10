





MS <- readxl::read_excel('Data/Copy_of_Dataset_TMT.xlsx')
save(MS, file = "Data/MS.RData")



#' @title G.Slice
#' @description G.Slice creates slices from an original data frame, while keeps a specified number of
#' columns, based on how many columns it has and writes them as '.csv' documents.
#' @export
#' @param df A data frame
#' @param fix.c.range1 Numeric parameter, integer, to specify the start column to keep
#' @param fix.c.range2 Numeric parameter, integer, to specify the final column to keep
#' @param init.pos Numeric parameter, integer, which determines from which column the slicing starts
#' @param jump Numeric parameter, integer, to specify the length of each slice
#' @param base Character parameter to name the slices, by default "Slice"
#' @return Slices of the original data frame keeping some specific columns
#' @example G.Slice(df = MS, fix.c.range1 = 1, fix.c.range2 = 5, init.pos = 6, jump = 10)

G.Slice <- function(df, fix.c.range1, fix.c.range2, init.pos, jump, base= 'Slice'){
  stop.pos <- ncol(df)
  start.points <- seq(init.pos, stop.pos, jump)
  One.Slice<-function(x=NULL){
    y <- if (x+9 <= stop.pos) x+9 else stop.pos
    modify <- c(fix.c.range1:fix.c.range2, x:y)
    df2 <- df[, modify]
    file_name <- paste(base, '_', x,'-', y, '_.csv', sep ='')
    utils::write.table(df2, file_name, row.names = F, sep='\t', col.names = T)
  }
  Map(One.Slice, start.points)
}

G.Slice(df = MS, fix.c.range1 = 1, fix.c.range2 = 5, init.pos = 6, jump = 10)



#' @title Mer.Slice
#' @description Mer.Slice function merges two or more data frames into one
#' @export
#' @param name Character parameter which is the pattern to look for the files to merge
#' @return A single data frame which contains all the files specified
#' @example Final_DF <- Mer.Slice(name = 'Slice_')

Mer.Slice <- function(name){
  all.files_list <- list.files(pattern = name, full.names = T)
  Read.list.names <- function(x){
    utils::read.table(x, header= T, sep = '\t')
  }
  all.df_list <- Map(Read.list.names, all.files_list)
  Reduce(merge, all.df_list)
}

Final_DF <- Mer.Slice(name = 'Slice_')



#' @title PCA.Function
#' @description PCA.Function applies PCA onto a data frame and generates a plot from the Principal
#' Components of interest. PCA.Function is designed for data frames where one need
#' to remove a range of columns.
#' @export
#' @param df A data frame
#' @param col1 Numeric parameter, integer, first value of the range of columns to remove
#' @param col2 Numeric parameter, integer, second value of the range of columns to remove
#' @param tag Character parameter which is a variable from the data frame that serves as tag on the plot
#' @param id Character parameter which is a variable from the data frame that serves as color on the plot
#' @param pcx Numeric parameter, integer, to specify which principal component one wants to display on x axis
#' @param pcy Numeric parameter, integer, to specify which principal component one wants to display on y axis
#' @return A graphical representation of the loading for the two principal components specified
#' @example PCA.Function(df = Final_DF, col1 = 1, col2 = 5, tag = 'Sample', id =  'Maturation')

PCA.Function <- function(df, col1, col2, tag, id, pcx=1, pcy=2){
  df1 <- df[,-c(col1:col2)]
  pcax <- stats::prcomp(df1, scale. = T, center = T)
  df2 <- df
  row.names(df2) <- df[,tag]
  ggplot2::autoplot(pcax, colour = id , data = df2, label = T, label.repel = T, x = pcx,
                    y = pcy, max.overlaps = 40, frame = T)
}

PCA.Function(df = Final_DF, col1 = 1, col2 = 5, tag = 'Sample', id =  'Maturation')



#' @title PC.Graph
#' @description PC.Graph applies PCA onto a data frame from which obtains how many principal components (PC)
#' are needed to cover 97% of variability on the data. PCA.Function is designed for
#' data frames where one needs to remove a range of columns. Moreover, generates the combination between
#' those PCs and generates a plot for each combination which are gathered in a .pdf file.
#' @export
#' @param df A data frame
#' @param col1 Numeric parameter, integer, first value of the range of columns to remove
#' @param col2 Numeric parameter, integer, second value of the range of columns to remove
#' @param tag Character parameter which is a variable from the data frame that serves as tag on the plot
#' @param id Character parameter which is a variable from the data frame that serves as color on the plot
#' @return A PDF file which contains graphs for each combination of principal components that are needed
#' @example PC.Graph(Final_DF, col1 = 1, col2 = 5, tag = "Sample", id = "Maturation")

PC.Graph <- function(df, col1, col2, tag, id){
  df1 <- df[,-c(col1:col2)]
  pca <- stats::prcomp(df1, scale. = T)
  pc.summ <- summary(pca)
  a <- sum(pc.summ$importance[3,] < 0.975)
  b <- c(1:a)
  pc.pairs <- as.data.frame(t(utils::combn(b, 2)))
  One.plot <- function(pcx, pcy){
    df2 <- df
    row.names(df2) <- df[, tag]
    name = paste("PCA_", pcx, "_vs_", pcy)
    ggplot2::autoplot(pca, data = df2, colour = id, label = T, label.repel = T, main = name,
            x = pcx, y = pcy, max.overlaps = Inf, label.size = 2.75, frame = T)
  }
  all.plots <- Map(One.plot, pc.pairs$V1, pc.pairs$V2)
  split.plots <- split(all.plots, ceiling(seq_along(all.plots)/20))
  Grid.plots <- function(x){
    out <- cowplot::plot_grid(plotlist = x, ncol = 4, nrow = 5)
    plot(out)
  }
  grDevices::pdf(file = "All_PC.pdf", width = 30, height = 50)
  Map(Grid.plots, split.plots)
  grDevices::dev.off()
}

PC.Graph(Final_DF, col1 = 1, col2 = 5, tag = "Sample", id = "Maturation")



#' @title Clust.Function
#' @description Clust.Function carries a PCA analysis and generates a cluster dendrogram using
#' by default the method 'ward.D2'. Clust.Function needs the number of principal components
#' to be specified.
#' @export
#' @param df A data frame
#' @param col1 Numeric parameter, integer, first value of the range of columns to remove
#' @param col2 Numeric parameter, integer, second value of the range of columns to remove
#' @param pc1 Numeric parameter, integer, first principal component of interest
#' @param pc2 Numeric parameter, integer, second principal component of interest
#' @param tag Variable form the data frame which serves as label the data
#' @return A dendrogram graph
#' @example Clust.Function(df = Final_DF, col1 = 1, col2 = 5, tag = "Sample", pc1 = 1, pc2 = 23)

Clust.Function <- function(df, col1, col2, tag, pc1, pc2){
  df1 <- df[,-c(col1:col2)]
  pcax <- stats::prcomp(df1, scale. = T, center = T)
  df2 <- df
  row.names(df2) <- df[,tag]
  distPCA <- stats::dist(pcax$x[,pc1:pc2])
  clust <- stats::hclust(distPCA, method = "ward.D2")
  plot(clust,labels = row.names(df2), xlab = paste('Scores of PCA', pc1, 'to', pc2),
       sub = 'Method "ward.D2" applied')
}

Clust.Function(df = Final_DF, col1 = 1, col2 = 5, tag = "Sample", pc1 = 1, pc2 = 23)


#' @title Make.RF
#' @description Make.RF function generates MultiDimensional Scaling plot from a regression formula.
#' @export
#' @param df A data frame
#' @param mtry.p Numeric parameter, integer, which refers to how many variables are taken into account each iteration of the analysis
#' @param var.response Character parameter, is the variable response to settle the formula; a variable from the data frame
#' @return Graph for a random forest model
#' @example Make.RF(df = Final_DF[-1], mtry.p = 5, var.response = "Dose")

Make.RF <- function(df, mtry.p, var.response){
  formula <- stats::formula(paste(var.response, '~.'))
  rfor1 <- randomForest::randomForest(data = df, formula, proximity = T,
                                      mtry = mtry.p, ntree = 1000)
  randomForest::MDSplot(rfor1, df[[var.response]])
}

Make.RF(df = Final_DF[-1], mtry.p = 5, var.response = "Dose")





