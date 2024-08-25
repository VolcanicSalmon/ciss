for(i in 1:length(distr)){
sp=sub('_[^_]+$','',distr[[i]])
j=read.csv(distr[[i]],header=T)
pts=j[,c('species','dcmlLng','dcmlLtt')]%>%filter(complete.cases(dcmlLng))%>%filter(complete.cases(dcmlLtt))
if(nrow(pts)>=5){
pts2=st_as_sf(pts,coords=c('dcmlLng','dcmlLtt'))%>%st_set_crs(sf::st_crs(world))}
allr4=st_union(st_buffer(pts2,dist=0.1))%>%st_set_crs(sf::st_crs(world))
allr5=st_intersection(allr4,world)
st_write(allr5,paste0(sp,'_hull.shp'),append=F)
}
