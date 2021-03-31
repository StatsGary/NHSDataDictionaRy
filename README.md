

# NHSDataDictionaRy <img src="man/figures/logo.png" width="160px" align="right" />

  <!-- badges: start -->
 ![R-CMD-check](https://github.com/StatsGary/NHSDataDictionaRy/workflows/R-CMD-check/badge.svg)
 [![Build Status](https://travis-ci.com/StatsGary/NHSDataDictionaRy.svg?token=qEbF4fyFyqZQw11E4C2x&branch=master)](https://travis-ci.com/StatsGary/NHSDataDictionaRy)
   [![CRAN status](https://www.r-pkg.org/badges/version/NHSDataDictionaRy)](https://CRAN.R-project.org/package=NHSDataDictionaRy)
  <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
  [![](https://cranlogs.r-pkg.org/badges/NHSDataDictionaRy)](https://cran.r-project.org/package=NHSDataDictionaRy)
  ![GitHub last commit](https://img.shields.io/github/last-commit/StatsGary/NHSDataDictionaRy)
  ![GitHub Repo stars](https://img.shields.io/github/stars/StatsGary/NHSDataDictionaRy?label=NHSDataDictionaRy%20Stars&style=social)
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
  
  
The goal of this package is to provide a common set of functions for working with NHS Data Dictionary look up tables. 

## Installation

``` r
# install.packages("NHSDataDictionaRy") # if not already installed

```

## Using the package

To use the package, you can download it from CRAN, using the library command to attach to your package:

``` r
library(NHSDataDictionaRy)

```
[Vignette](https://cran.r-project.org/web/packages/NHSDataDictionaRy/vignettes/introduction.html) available to reference the toolset.

## NHS Data Elements

When retrieving the current hyperlinks from the data elements page of R it is known that not all of these elements will have <strong>National Code</strong> tables. If a National Code table does not exist for the selected lookup table, then you will receive a message stating the lookup table requested does not exist and to try another lookup table. If you check this, you will see that the relevant data elements page of the NHS Data Dictionary does not contain that specific national codes table. 

## Additional updates

A new update has been added to the package to allow OpenSafely data to be intergated via the R lookup. 

Updates are being worked on at the moment to include:
- Wrapper functions for returning nhs_data_elements all in one function

These will be made available in the next release. 

## Credits 

This package has been funded by the NHS-R community and designed in conjunction with Arden and GEM CSU. Gary Hutson is the package maintainer and can advise on bug fixes and general functionality issues. 

Please create an issue on GitHub if you have any issues or request changes. 

## Contributors 

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/polc1410"><img src="https://avatars.githubusercontent.com/u/1819213?v=4?s=100" width="100px;" alt=""/><br /><sub><b>polc1410</b></sub></a><br /><a href="#design-polc1410" title="Design">🎨</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
