__Data Import__
- readxl - faster, no java dependency
- read_excel{readxl} - determines file format
- read_xls{readxl}, read_xlsx{readxl} - direct methods
- select range
- Skip rows
- select sheet
- readr - faster
- in tibble format
- read_csv

__Data Wrangling(Data Manipulation)__
- pipe operations
- dplyr - select, filter(along with is.na(), complete.cases(.))
- mutate (with ymd{lubridate} - ymd(paste0()))
- separate{tidyr} - to seperate values in columns
- slice(c(rownumbers)) - to view only specific rows

__Data Export__
- write_csv - write new or append to existing file
- .rdata - R representational object - save and load

__Data Sampling__
- sample_frac(%)
- sample_n(n)
- sample_n(50, replace = TRUE)  #specify to resample when those many rows are not available in data count

__Data Grouping__
- group_by()
- arrange()

__Functions used:__
- n() - get count of a variable
- n_groups() - get count of grouped variables
- cumsum - arrange, differentiate by colours shows better
- cummean - violin plot shows better
- AFTER VIRAL EVENT	BEFORE VIRAL EVENT
- cumany(number.of.items > third quantile)	cumall(number.of.items < third quantile)
- summarise(columnNameNeeded = )
- summarise_if(is.numeric, mean)
- ungroup() - when viewing or extracting index
- nest{tidyr} - compartmentalize

__Data Modelling__
- map{purrr} - return a vector same length of the input
- ns - natural spline
- lm - linear model
- create a model and plot - actual(scatter) and predicted (line)

__Data Format(conversion)__
- wide to long:
gather(key,value, columnNames…….)

- long to wide:
spread(key,value, columnNames……)

__Handling old code__
- Quosure and Unquosure
 valueVar <- quos(someColumn1, someColumn2, . . . )

 - select(UQ(valueVar)) OR
 - someVerb(!!!valueVar)

