
install.packages("SqlRender")
install.packages("DatabaseConnector")
install.packages("Eunomia")

connectionDetails <- Eunomia::getEunomiaConnectionDetails()
connection <- DatabaseConnector::connect(connectionDetails)

Eunomia::createCohorts(connectionDetails = connectionDetails, 
                       cdmDatabaseSchema = "main")