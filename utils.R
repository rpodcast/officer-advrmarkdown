image_lookup <- function(robot_master) {
  if (robot_master %in% c("metalman", "quickman", "woodman")) {
    ext <- "jpg"
  } else {
    ext <- "png"
  }
  
  res <- file.path("img/megaman", paste(robot_master, ext, sep = "."))
  return(res)
  
}

create_slides <- function(customer, 
                          easy_master, 
                          easy_text, 
                          difficult_master, 
                          difficult_text, 
                          template = "templates/megaman.pptx") {
  
  my_pres <- read_pptx(template)
  
  my_pres <- my_pres %>%
    
    # add title slide
    add_slide(layout = "title_slide", master = "Office Theme") %>%
    ph_with_text(type = "ctrTitle", str = "Megaman 2 Survey") %>%
    ph_with_text(type = "subTitle", str = glue::glue("Customer: {customer}")) %>%
    ph_with_text(type = "dt", str = format(Sys.Date())) %>%
    ph_with_text(type = "sldNum", str = "slide 1") %>%
    
    # easiest robot master
    add_slide(layout = "robot_master_slide", master = "Office Theme") %>%
    ph_with_text(type = "title", str = "Easiest Robot Master") %>%
    ph_with_img(type = "pic", src = image_lookup(easy_master)) %>%
    ph_with_text(type = "body", index = 3, str = easy_master) %>%
    ph_with_text(type = "body", index = 4, str = easy_text) %>%
    
    # difficult robot master
    add_slide(layout = "robot_master_slide", master = "Office Theme") %>%
    ph_with_text(type = "title", str = "Difficult Robot Master") %>%
    ph_with_img(type = "pic", src = image_lookup(difficult_master)) %>%
    ph_with_text(type = "body", index = 3, str = difficult_master) %>%
    ph_with_text(type = "body", index = 4, str = difficult_text)
    
    # 
    # # add vector based plot on graph slide
    # add_slide(layout = "graph_slide", master = "Office Theme") %>%
    # ph_with_text(type = "title", str = "Attempts for all robots") %>%
    # ph_with_vg(ggobj = attempts_plot, type = "body", index = 3)
    # 
  
  return(my_pres)
}

