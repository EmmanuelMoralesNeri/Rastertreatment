##########################################################################
#RESAMPLING (UPSAMPLING Ó DOWNSAMPLING) DE ARCHIVOS RÁSTER EN R          #
#USANDO LA LIBRERÍA RASTER                                               #
########################################################################## 

#Configure directorio de trabaj:
setwd("C:/TEMPORAL/RSMINERVEWORKMAY2020/NetCDF files")
library(raster)
r <- raster("ppMask.tif")
s <- raster("ppMask.tif")

#Verificando resoluciones:
res(r)

#"s" contiene al mismo ráster, pero se le cambiará la resolución (downsampling)
res(s) <- 0.05

#EjecucióN del comando "resample":
#Baseline raster: "s"
#Raster que se le aplicará resampling: "r"
#Técnicas de interpolacióN disponibles: "bilinear", Nearest neighbor "ngb"

s <- resample(r, s, method='bilinear')

#Ahora graficamos el ráster original "r" y el que tiene resampling "s"
#Puede notarse la reducción de 0.1>0.05 (ahora 4 pixeles ocupan el espacio de un pixel)
plot(r)
plot(s)
