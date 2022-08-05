# R_package

## Introduction

On autumn 2020, I followed *Statistics and Probability* course offered by the Faculty of Sciences at the University Of Geneva. The course was tought by Prof [José Nunes](https://genev.unige.ch/research/people/Jose-Manuel-De-Abreu-Nunes) from the Anthropology Unit

A part of the course was an R-project where we were tought how to leverage R programming language, starting by making use of its functional programming properties. This approach challenged me, as I was used to Python programming language and it forced me to change my mindset. However, the effort was totally worthy.

To get initiated with the project, we had to choose a dataset to start coding, I choosed a metabolomics dataset comming from a toxicology study aming at characterize the metabolic effect of Trimethyltin on a 3D "mini-brain" cell system invilving neurons and glial cells, [reference](https://doi.org/10.3390/metabo9040079).

The idea behind the project was to mimic as much as possible the role of a Data Scientist:

1. Data wrangling
2. Function development
3. Package development and distribution

For an in depth reading of my project, you can refer to my [project report](https://github.com/Christ14n97/R_package_2020/blob/master/R-Project-on-Metabolomics-Dataset.pdf). If you want to test it, you can try downloading my [package](https://github.com/Christ14n97/R_package_2020/blob/master/Christian.Peralta.Rpackage_0.1.0.tar.gz) and installing it on your machine to test it.

# Data wrangling

Since my dataset was already cleaned, the best I could do to get started was to develop a function to divide the dataset into smaller slices and then another function to merge all the slices. To this mean, I would be mimicking a scenario where a have several data frames which I need to combine in a single one. 

This was a great opportunity to understand **Map()** and **Reduce()** functions. `Map()` was used to apply iteratively an slicer function. Afterwards, `Reduce()` was used to combine all data frames in a single dataset.

# Function development

The goal behind function development was clear: *"at this stage of the development of your career you cannot care about performance, all you need to care about is that your functions work the way they are meant to do it"*.
And that was the way I proceed, focusing my learning on understanding R, the global enviroment, as well as function's local environment.

Moreover, the mindset applied was imagining that someone would use my functions and what kind of need they might face, namely:

* output rename
* reading several input files from a working directory
* specifying character separators when reading files
* specifying column index or name

In summary, the functions developed include reading and manipulating data frames; unsupervised multivariate analysis (MVA) which included multidimensionality reduction as well as clustering. An importante aspect of MVA is the visualization of teh output; hence visualization functions were developed to automatize this task.

# Package development and distribution

The ultimate goal of the project was to give us hands-on experience on package development and distribution. In this part of the project I had an introduction to software development tools such as git for version control. 

In this part of my project I learn how to:

1. Add my functions
2. Properly document my functions
3. Add dependencies
4. Add data for testing

An example can be seen in the following image 

![](https://github.com/Christ14n97/R_package_2020/blob/master/images/package_dev_example.png)

# Conclusion

Overall, this project was hihgly challenging but the reward was priceless. Since I finished my project I have never stopped using `Map()` functions and encouraging colleages in the field to invest time in understanding it. I have also used it in Python. 
Furthermore, coupling git for version control whilst developing my package was a great experience to get started, and git absolutely helped me to check when a where I made a change which produced an bug.

I am really thankfull to have followed this course, since now I feel confident on my programming skill in R.
