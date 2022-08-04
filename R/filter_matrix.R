#' Filtrar una matriz para hacer el heatmap con un valor de cuttof establecido
#'
#' @param x A expression matrix with spcies x genes
#' @param cutoff A numeric value to subset
#'
#' @return A ComplexHeatmap object filtered
#' @export
#'
#' @examples
#' expresion_genes <- matrix(rnorm(100), nrow = 10)
#' rownames(expresion_genes) <- paste0("gene_",letters[1:10])
#' colnames(expresion_genes) <- paste0("especie_",letters[1:10])
#' filter_matrix(expresion_genes, cutoff = 0.5)
#'


filter_matrix<- function(x, cutoff=0){
  filter_x<- x
  filter_x[filter_x <= cutoff] = NA
  # plot heatmap
  ComplexHeatmap::Heatmap(filter_x,
                          cluster_columns = FALSE,
                          cluster_rows = FALSE,
                          heatmap_legend_param = list(title = "log2"))
}

