subset_heatmap2 <- function(x, cutoff=NULL, tipo=NULL) {
  # subset matrix
  library(dplyr)
  x<- as.data.frame(x)
  #x_subset <- x[which(abs(x) > cutoff),] %>% tidyr::drop_na()
  if(is.null(tipo)){
    x_subset <-x[apply(abs(x) >= cutoff, 1, any), ]
  } else{
      x_subset<- x %>%  dplyr::mutate(
        across(.fns = ~ if_else(abs(.) > cutoff, ., 0)))
      }

  # plot heatmap
  ComplexHeatmap::Heatmap(x_subset,
                          cluster_columns = FALSE,
                          heatmap_legend_param = list(title = "log2"))
}

