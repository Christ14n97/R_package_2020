# R_package

## Introduction

On autumn 2020, I followed *Statistics and Probability* course given by the Faculty of Sciences at the University Of Geneva. The course was tought by Prof [José Nunes](https://genev.unige.ch/research/people/Jose-Manuel-De-Abreu-Nunes).

A part of the course was an R-project where we were tought how to leverage R programming language, starting by making use of its functional programming properties. This approach challenged me, as I was used to Python programming language and it forced me to change my mindset. However, the effort was totally worthy.

To get initiated with the project, we had to choose a dataset to start coding, I choosed a metabolomics dataset comming from a toxicology study aming at characterize the metabolic effect of Trimethyltin on a 3D "mini-brain" cell system invilving neurons and glial cells, [reference](https://doi.org/10.3390/metabo9040079).

The idea behind the project was to mimics as much as possible the role of a Data Scientist:

1. Data wrangling
2. Function development
3. Package development and distribution

For an in depth reading of my project, you can refer to my [project report](https://github.com/Christ14n97/R_package_2020/blob/master/R-Project-on-Metabolomics-Dataset.pdf). If you want to test it, you can try downloading my [package](https://github.com/Christ14n97/R_package_2020/blob/master/Christian.Peralta.Rpackage_0.1.0.tar.gz) and installing it on your machine to test it.

# Data wrangling

Since my dataset was already cleaned, the best I could do to get started was to develop a function to divide the dataset into smaller slices and then another function to merge all the slices. In this I would be mimicking a scenario where a have several data frames which I need to combine in a single one. 

This was a great opportunity to understand **Map()** and **Reduce()** functions. `Map()` was used to apply iteratively an slicer function. Afterwards, `Reduce()` was used to combine all data frames in a single dataset.

# Function development

The goal behind function development was clear: *"at this stage of the development of your career you cannot care about performance, you need to care about your functions work the way they are meant to do it"*.
And that was the way I proceed, focusing my learning in understanding R and the global enviroment, as well as function local environment.

Moreover, the mindset applied was imagining that someone would use my functions and what kind of need they might face, namely:

* output rename
* reading several input files from a working directory
* specifying character separators when reading files
* specifying column index or name

# Package development and distribution

The ultimate goal of the project was to give us hands-on experience on package development and software development tools such as git for version control. 

In this part of my project I learn how to:

1. Add my functions
2. Properly document my functions
3. Add dependencies
4. Add data for testing

An example can be seen in the following image 

![](https://github.com/Christ14n97/R_package_2020/blob/master/images/package_dev_example.png)

