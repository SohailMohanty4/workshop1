rm(list=ls(all=TRUE)) # Clean slate
#install.packages("tidyverse", dependencies = TRUE)
#install.packages("sf", dependencies = TRUE)

library(tidyverse)
library(sf)

setwd("~/Documents/Freshman/DATA100/R")

lbr_int  <- read_sf("gtm_adm_ocha_conred_2019_SHP/gtm_admbnda_adm0_ocha_conred_20190207.shp")

st_geometry(lbr_int)
lbr_adm1  <- read_sf("gtm_adm_ocha_conred_2019_SHP/gtm_admbnda_adm1_ocha_conred_20190207.shp")
lbr_adm2  <- read_sf("gtm_adm_ocha_conred_2019_SHP/gtm_admbnda_adm2_ocha_conred_20190207.shp")

ggplot() +
  geom_sf(data = lbr_adm2,
          size = .65,
          color = "gray50",
          fill = "gold3",
          alpha = .65) +
  geom_sf(data = lbr_adm1,
          size = .65,
          color = "gray50",
          alpha = .65) +
  geom_sf(data = lbr_int,
          size = .65,
          alpha = .65) +
  geom_sf_text(data = lbr_adm2,
               aes(label = ADM2_ES),
               size = .4) +
  geom_sf_text(data = lbr_adm1,
               aes(label = ADM1_ES),
               size = 1) + 
  geom_sf_label(data = lbr_int,
                aes(label = "Guatemala"),
                size = 2,
                color = "black")
ggsave("guatemalahdx.png") 
