### This script was developed by Michael F Meyer (mfmeyer@usgs.gov) for the
### workshop "A Primer on Remote Sensing of Water Quality" at the Pecora 22 
### conference in October 2022. The main goal of the workshop is to provide 
### an introduction to using Google Earth Engine, demonstrate how to make 
### spectral indices for water quality assessment in Google Earth Engine, 
### and demonstrate how to use existing products for assessing water quality
### with remote sensing imagery. 

### This tutorial works through using existing products to evaluate water 
### quality with remote sensing reflectance data. It uses the AquaSat 
### dataset (https://figshare.com/articles/dataset/AquaSat/8139383), which is
### described in detail in the dataset's companion Data Article 
### (https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2019WR024883).
### In essence, AquaSat is a compilation of reflectance data from Landsat 5, 7, 
### and 8 with matched in situ water quality data. By providing data in a 
### tabular structure, the dataset is designed in a way that is familiar to many
### freshwater scientists and limnologists, thereby allowing for a wider user base.

### The dataset is also primarily produced with Open Source Code. All of the code
### and information for recreating AquaSat V1 with updated data can be accessed
### on the project's GitHub repository: https://github.com/GlobalHydrologyLab/AquaSat

### Michael F Meyer and Matt RV Ross are currently working to expand the temporal
### and variable content of AquaSat for a future release of AquaSat V2. While this
### product is being created, interested users are welcome to contact 
### Michael F Meyer (mfmeyer@usgs.gov) with any questions or comments. 

### This script is divided into 4 sections: 
### Step 0: Install and load necessary packages
### Step 1: Load the necessary data
### Step 2: Assess a variable
### Step 3: Assess SDD data in Minnesota

# Step 0: Install and load necessary packages -----------------------------


## If packages do not exist, they will be installed automatically. This step
## will NOT overwrite packages that are alreay installed. 
packages <- c("lubridate",
              "tidyverse",
              "sf",
              "viridis",
              "tigris",
              "hexbin",
              "ggpubr",
              "broom")

install.packages(setdiff(packages, 
                         rownames(installed.packages()))) 

## Load necessary packages
library(tidyverse)
library(viridis)
library(sf)
library(ggpubr)
library(tigris)
library(lubridate)
library(broom)

# Step 1: Load the necessary data -----------------------------------------

aquasat <- read_csv("../data/sr_wq_rs_join.csv") %>%
  filter(blue >= 0 & red >= 0 & green >= 0 & nir >= 0)

## For plotting, we will use the US Census outlines. Because we are fousing on 
## contiguous states in the US, we filter for regions 1-4.
usa <- states(resolution = '5m') %>%
  st_as_sf() %>%
  filter(REGION %in% 1:4)

## Inspect the data
head(aquasat)


# Step 2: Assess a variable -----------------------------------------------

## Let's first look at Secchi Disk Depth (SDD). SDD is a common variable for 
## understanding light attenuation in lakes. It is collected by dropping a white
## and black disk into the water column until it is just barely visible. It is 
## often used as a proxy to calculate the euphotic zone of a lake, or a depth 
## where 1% of entering light is able to reach in the water column. An approximation
## of euphotic zone depth is to multiply SDD by 2.8. 

## First, let's figure out how many SDD samples we have in AquaSat


## Second, let's look at where those samples are in the US

## Third, let's do the same for Chlorophyll a

## Fourth, let's look at all the variables and make a figure that we can 
## send to our supervisors!

data_availability_map <- map(.x = c("chl_a", "secchi", "tss", "doc"),
                             .f = ~ ) 

ggarrange(plotlist = data_availability_map, ncol = 2, nrow = 2)


# Step 3: Assess SDD Data in Minnesota ------------------------------------

## First, get the shapefile for Minnesota
minnesota <- tigris::states() %>%
  filter(STUSPS == "MN") %>%
  st_as_sf()

## Second, get the SDD data that intersects with MN. 
## Note, that you may get an error about spherical geometries during this step. 
## If you get this error, uncomment the line below and re-run the code.
## This step tends to fix things on Mac and Windows, but probems may persist on
## Linux machines. Please ask a helper if you are stuck on this step. 

## sf_use_s2(FALSE)



## Third, make a plot of Euphotic Zone Depth througout MN


## Fourth, let's look at these data by month, so we know 
## when we have the most and best fitting data.


sdd_sp %>%
  
  ggplot() +
  geom_hex(aes(x = ndti, y = secchi)) +
  geom_smooth(aes(x = ndti, y = secchi), method = "lm") +
  scale_y_log10() +
  facet_wrap(~month) +
  scale_fill_viridis_c() +
  ggtitle("NDTI vs Secchi Disk Depth for Minnesota Lakes") +
  theme_bw()

## Fifth, let's look at the fit of the line for the whole time series


## Sixth, let's extract model coefficients, statistics, and diagnostics for 
## each month's linear model. 



## Finally, let's make a model for the whole year!
