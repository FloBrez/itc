require(bookdown)
setwd("C:\\Users\\flori\\OneDrive\\Projekte\\intro_to_causality")
bookdown::render_book("index.md", output_dir = "C:\\Users\\flori\\OneDrive\\Projekte\\intro_to_causality\\docs")
bookdown::render_book("index.md", "bookdown::pdf_book", output_dir = "C:\\Users\\flori\\OneDrive\\Projekte\\intro_to_causality\\pdfs")
