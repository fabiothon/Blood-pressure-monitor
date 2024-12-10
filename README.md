# Blood pressure as a function of time

This R script visualizes and analyzes blood pressure data using `ggplot2`, `dplyr`, `readxl`, and `ggrepel`. It imports an Excel file containing timestamps, systolic and diastolic pressure, and heart rate (pulse) readings. The timestamps are converted to POSIXct format for accurate time plotting.

The script generates a line plot, where systolic, diastolic pressure, and pulse are displayed over time with distinct colors (red for systolic, blue for diastolic, and grey for pulse). The plot includes a secondary y-axis for heart rate and is annotated with non-overlapping labels using `geom_text_repel` to display individual data values.

The plot is further customized with axis labels, a title, a caption, and a dynamic subtitle showing average systolic and diastolic pressure. The mean systolic and diastolic pressures are calculated at the end of the script, rounding the systolic mean to one decimal place for clarity.

## Application overview
<img width="939" alt="picture_1" src="https://github.com/user-attachments/assets/efdc3996-5264-43e5-8447-25bd435e8652">
<img width="942" alt="picture_2" src="https://github.com/user-attachments/assets/a0a842d8-e48e-4fff-9468-a4d211bd901b">



## Requirements
- [R](https://www.r-project.org)

## Usage

1. Download of all necessary files
2. Install necessary libraries on your local environment
3. Run application

## Contributing

Pull requests are welcome! For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Licenses
This script uses the [MIT](https://choosealicense.com/licenses/mit/) License.
