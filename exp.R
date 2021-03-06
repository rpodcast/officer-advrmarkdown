library(tidyverse)
library(officer)
library(rvg)

my_pres <- read_pptx("templates/megaman.pptx")

layout_summary(my_pres)
layout_properties(my_pres, "robot_master_slide")
layout_properties(my_pres, "title_slide")
layout_properties(my_pres, "graph_slide")

annotate_base("templates/megaman.pptx", "templates/megaman_annotated.pptx")

# create plot
source("plot.R")

my_pres <- my_pres %>%
  
  # add title slide
  add_slide(layout = "title_slide", master = "Office Theme") %>%
  ph_with_text(type = "ctrTitle", str = "Megaman 2 Survey") %>%
  ph_with_text(type = "subTitle", str = "Customer: Eric Nantz") %>%
  ph_with_text(type = "dt", str = format(Sys.Date())) %>%
  ph_with_text(type = "sldNum", str = "slide 1") %>%
  
  # easiest robot master
  add_slide(layout = "robot_master_slide", master = "Office Theme") %>%
  ph_with_text(type = "title", str = "Easiest Robot Master") %>%
  ph_with_img(type = "pic", src = "img/megaman/CW-09-MetalMan-Art.jpg") %>%
  ph_with_text(type = "body", index = 3, str = "Metal Man") %>%
  ph_with_text(type = "body", index = 4, str = "Metal Man's stage had fairly simple enemies to eliminate, and his attack patterns were not sophisicated") %>%
  
  # add vector based plot on graph slide
  add_slide(layout = "graph_slide", master = "Office Theme") %>%
  ph_with_text(type = "title", str = "Attempts for all robots") %>%
  ph_with_vg(ggobj = attempts_plot, type = "body", index = 3)
  

print(my_pres, target = "test.pptx")

