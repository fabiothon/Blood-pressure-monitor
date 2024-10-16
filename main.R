# Libraries -----
library(ggplot2)
library(dplyr)
library(readxl)
library(ggrepel)

# Global setting:
options(ggrepel.max.overlaps = Inf)

# Excel file input ------
bp_data <- read_excel("//Users//fabiothon//Desktop//Code//Bloodpressure//bp.xlsx")
head(bp_data)

# Data conversion ----- 
bp_data$time <- as.POSIXct(bp_data$time)
head(bp_data$time)

# Plot -----
ggplot(bp_data, aes(x = time)) +
  geom_line(aes(y = systolic_pressure, color = "Systolic")) +
  geom_point(aes(y = systolic_pressure, color = "Systolic")) +
  geom_line(aes(y = diastolic_pressure, color = "Diastolic")) +
  geom_point(aes(y = diastolic_pressure, color = "Diastolic")) +
  geom_line(aes(y = pulse, color = "Heart rate")) +
  geom_point(aes(y = pulse, color = "Heart rate")) +
  scale_color_manual(values = c("Systolic" = "red", "Diastolic" = "blue", 
                                "Heart rate" = "darkgrey")) +
  labs(title = "Blood pressure of Steve Shoes (1984)",
       subtitle = paste("Average (Systolic):", round(mean(bp_data$systolic_pressure), 
                                                     digits = 1 ),
                        " / Average (Diastolic):", round(mean(bp_data$diastolic_pressure), 
                                                         digits = 1)),
       caption = "System: Blood Measure Machine XT-290",
       x = "Date", y = "Blood pressure [mmHg]", color = "Legend") +
  theme_bw()  +
  scale_y_continuous(sec.axis = sec_axis(~., name = "Heart rate [bpm]")) +
  scale_x_datetime(breaks = seq(from = min(bp_data$time),
                  to = max(bp_data$time),
                  by = "24 hours"),
                  labels = scales::date_format("%d.%m", tz = "CET"),
                  expand = c(0.01, 0.01)
                                          ) +
  
# Adding labels ----
  geom_text_repel(aes(y = systolic_pressure, label = systolic_pressure),
                color = "red", show.legend = FALSE, nudge_x = 0.1, nudge_y = 7,
                segment.color = "grey") +
  geom_text_repel(aes(y = diastolic_pressure, label = diastolic_pressure),
                  color = "blue", show.legend = FALSE, nudge_x = 0.1, nudge_y = 5,
                  segment.color = "grey") +
  geom_text_repel(aes(y = pulse, label = pulse),
                  color = "darkgrey", show.legend = FALSE, nudge_x = 0.1, nudge_y = 5,
                  segment.color = "grey")

#Mean -----
round(mean(bp_data$systolic_pressure), digits = 1)
mean(bp_data$diastolic_pressure)
