# R_package

## Introduction

On autumn 2020, I followed *Statistics and Probability* course given by the Faculty of Sciences at the University Of Geneva. The course was tought by Prof [José Nunes](https://genev.unige.ch/research/people/Jose-Manuel-De-Abreu-Nunes).

A part of the course was an R-project where we were tought how to leverage R programming language, starting by making use of its functional programming properties. This approach challenged me, as I was used to Python programming language and it forced me to change my mindset. However, the effort was totally worthy.

To get initiated with the project, we had to choose a dataset to start coding, I choosed a metabolomics dataset comming from a toxicology study aming at characterize the metabolic effect of Trimethyltin on a 3D "mini-brain" cell system invilving neurons and glial cells, [reference](https://doi.org/10.3390/metabo9040079).

The idea behind the project was to mimics as much as possible the role of a Data Scientist:

1. Data wrangling
2. Function development
3. Package development and deployment

For a quick reading of my project, you can refer to my [project report](https://github.com/Christ14n97/R_package_2020/blob/master/R-Project-on-Metabolomics-Dataset.pdf). If you want to test it, you can try downloading my [package](https://github.com/Christ14n97/R_package_2020/blob/master/Christian.Peralta.Rpackage_0.1.0.tar.gz) and installing it on your machine to test it.

# Data wrangling

Since my dataset was already cleaned, the best I could do to get started was to develop a function to divide the dataset into smaller slices and then another function to merge all the slices. In this I would be mimicking a scenario where a have several data frames which I need to combine in a single one. 

This was a great opportunity to understand **Map()** and **Reduce()** functions. `Map()` was used to apply iteratively an slicer function. Afterwards, `Reduce()` was used to combine all data frames in a single dataset.

# Function development


