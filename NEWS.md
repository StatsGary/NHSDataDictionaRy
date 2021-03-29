## Test environments
* local R installation, R 4.0.3
* ubuntu 16.04 (on travis-ci), R 4.0.3
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.
* Note for qpdf not being installed - known issue with later R versions. Checks run and returned successfully for Uwe Ligges

## Version control

### 1.2.0 - Initial build release 
To get the package out there and fixed to support change of structure of the NHS Data Dictionary website. This is fully working and details of how to use are in the vignette

### 1.2.1 - Default codes xpath added to master NHS Data Dictionary lookup 
The changes to the master site mean the default and national codes have been separated on the site, so this has been added to the master lookup and the changes pushed back to CRAN. 

### 1.2.2 - OpenSafely wrapper added for lookups to OpenSafely site
An OpenSafely wrapper has been added for lookups to the OpenSafely site and to return the relevant lookup files required. 


