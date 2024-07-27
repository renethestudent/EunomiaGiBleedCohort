# 01_EunomiaCohorts.R

# Purpose: Set up Eunomia testing environment for OMOP/OHDSI Analytics
# Elements:
# - Download required pacakges
# - Set up Eunomia
# - Check cohort definitions have instantiated


# Step 1 : Install Required packaged
install.packages("SqlRender")
install.packages("DatabaseConnector")
install.packages("Eunomia")

# Add EUNOMIA_DATA_FOLDER as an environment variable
usethis::edit_r_environ()
# set the variable commented below to .Renviron
#EUNOMIA_DATA_FOLDER='<local>/data'

# set connection details for Eunomia
connectionDetails <- Eunomia::getEunomiaConnectionDetails()
# connect to Eunomia GiBleed
connection <- DatabaseConnector::connect(connectionDetails)

# Build GiBleed Cohorts
Eunomia::createCohorts(connectionDetails = connectionDetails)

# Peek cohort definition 3 for GI Bleed
sql <- "SELECT * FROM main.cohort WHERE COHORT_DEFINITION_ID = 3;"
tb <- DatabaseConnector::querySql(connection = connection, sql = sql) |>
  tibble::as_tibble()
tb
