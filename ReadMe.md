Thank you for your interest in the Remote Sensing of Water Quality Workshop!
We are so excited at the enthusiasm for the workshop!

The workshop will have a fair amount of live coding for attendees, so please be
sure to bring a machine with you, if you intend on coding along. All scripts and
slides will be available after the workshop for participants.

The workshop is divided into three main components and will follow this general
schedule. Please feel free to come and go as you wish.

- 08:00 - 08:15 am MST: Welcome, Introduction, Ground Rules, Sticky Notes
- 08:15 - 08:45 am MST: An Introduction to Google Earth Engine
- 08:45 - 09:00 am MST: Break
- 09:00 - 10:00 am MST: Working with Spectral Indices for Water Quality in Google
Earth Engine
- 10:00 - 10:15 am MST: Break
- 10:15 - 11:00 am MST: Working with AquaSat - A Harmonized Spectral Reflectance
and Water Quality Dataset
- 11:00 - 11:30 am MST: Applying AquaSat in Google Earth Engine
- 11:30 - 12:00 pm MST: Open Lab


In preparation for the workshop, we wanted to be sure that everyone had the
proper software and licenses.

1. **Google Earth Engine**: The majority of time in the
workshop will be spent using Google Earth Engine. Please be sure that you have
an authorized account. You can register for a free account [here](https://earthengine.google.com/]).
It can sometimes take a few days to get an approved account, so please be sure
to sign up sooner than later. Please note that depending on your affiliation,
you may need an enterprise account through your institution. Please consult your
local departments and branches if this pertains to you.

2. **R and RStudio**: The last portion of the workshop will be in R, and we will be using
the RStudio Integrated Development Environment. You can download R [here](https://cran.r-project.org/),
and RStudio [here](https://www.rstudio.com/products/rstudio/download/).
We recommend having the latest version of R, but older versions will likely
work well. If you wish to install necessarily packages in advance of the
 workshop, those can be installed using the code below:
```
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
```
3. **AquaSat**: The R portion of the workshop will use AquaSat V1. You can download
AquaSat [here](https://figshare.com/articles/dataset/AquaSat/8139383). 


Please be sure to reach out to Michael F Meyer (mfmeyer@usgs.gov) with any
questions, comments, or concerns you may have.
