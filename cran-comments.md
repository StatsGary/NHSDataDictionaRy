## Test environments
* local R installation, R 4.0.3
* ubuntu 16.04 (on travis-ci), R 4.0.3
* win-builder (devel)

## R CMD check results

> checking for unstated dependencies in examples ... OK
   WARNING
  'qpdf' is needed for checks on size reduction of PDFs

0 errors √ | 1 warning x | 0 notes √

The warning disapears when checking on Travis and other environments. Known issue with this version of R and RStudio. 


## Version control

### 1.2.0 - Initial build release 
To get the package out there and fixed to support change of structure of the NHS Data Dictionary website. This is fully working and details of how to use are in the vignette

### 1.2.1 - Default codes xpath added to master NHS Data Dictionary lookup 
The changes to the master site mean the default and national codes have been separated on the site, so this has been added to the master lookup and the changes pushed back to CRAN. 

### 1.2.2 - Added OpenSafely to the package
Added OpenSafely function to package to allow OpenSafely data to be interrogated.

### 1.2.3 - Added more advanced error handling for SSL certificates
NHS Data Dictionary website had an unverified SSL certificate, which led to the package being rejected by CRAN. These additions have been fixed and it will be resubmitted to the site. 




