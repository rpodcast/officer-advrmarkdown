## Why use officer over Rmarkdown?
* You need finer-grained control over formatting
* You use a non-standard template in powerpoint
* Manipulate other areas in a word doc like footers & headers
* officer plays nicely with automation and shiny apps
* ability to create vector-based graphics in ppt with rvg package (but some work ongoing to make that available in Rmarkdown ppt see https://github.com/davidgohel/rvg/issues/26 )

## Why use Rmarkdown over officer?
* officer syntax is a bunch of functions to manipulate textual elements
* markdown text is much more intuitive and lends itself well to more ad-hoc and data science workflows
* The essential document markup is covered if you don't need a lot of customization

## Disclaimers
* I did not create the officer package, I am just a very happy user 
* I am anything but a fan of microsoft office formats like ppt and word documents, but my job requires these formats for formal communications and presentations

## About officer

* Authored by David Gohel https://github.com/davidgohel https://twitter.com/davidgohel
* Second generation (first was ReporteRs which was based in java)
* officer is based in C++ and takes advantage of the (relatively) newer microsoft XML-based formats (i.e. docx, pptx)

## Goal of this talk

* Show you some basic workflow and interesting capabilities that officer brings
* compare and contrast with Rmarkdown & pandoc workflow
* Share resources with more information and examples

## Powerpoint template manipulation

* 
