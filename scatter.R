#Libraries ----
library(readxl)
library(bp)

#Input data ----
bp_data <- read_excel("//Users//fabiothon//Desktop//Code//Bloodpressure//bp.xlsx")

#Data conversion -----
bp_data$time <- as.POSIXct(bp_data$time)

#bp ----
bp <- process_data(bp_data, 
                            sbp = 'systolic_pressure', 
                            dbp = 'diastolic_pressure', 
                            date_time = 'time', 
                            hr = 'pulse')
head(bp)
bp_scatter(bp)
bp_stats(bp)
bp_report(bp)
