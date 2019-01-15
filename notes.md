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

* Typical functins like `ph_with_text`, (i.e. the ones without the `_at` suffix) inherit font properties, etc from the template itself
* For customized templates, you'll be manipulating the properties in powerpoint slide master view potentially a lot
* All of the functions that add text to an existing placeholder must have the index parameter populated.
* How do you know what those index values are?  Use the annotate function and open that up in powerpoint to grab the index values for the placeholders you want to populate

## Graphics

* If you are dealing with customers that want to tweak the appearance of things after you provide the result (much like how some people customize graphics in programs like adobe illustrator after getting a graph from other software), I recommend using the `rvg` package to insert vector-based graphics in a powerpoint slide
* You can't please everybody!

## Use cases

* If you are producing an ad-hoc slides summarizing an iterative data exploration, officer may not be more beneficial than using rmarkdown with powerpoint output
* officer really shines with automation pipelines and very specific template requirements
* Somewhat like how LaTeX lets you customize practically every aspect of document markup, although with `officer` you can't do all cusotomization through code (need to manipulate template in powerpoint directly)
* Imagine a shiny application that elicits info from a user, and has a simple download slides button that uses officer on the backend to take care of the nitty-gritty details, all user has to do is complete questions in an app


## Helpful resouces

* Len Kiefer's blog posts about using officer (add links)
* resources on manipulating powerpoint templates (find bookmarks in my pinboard)
* Stack overflow `officer` tag

