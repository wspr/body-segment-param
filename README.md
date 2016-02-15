# Repository of body segment parameter models

This is the main README for this repository. The user-friendly front page is located at <http://wspr.github.io/body-segment-param>.

This repository contains the raw data for a multitude of body segment parameter models.
Collecting this data, especially in standard form, is a tedious process; we hope that by making this data more widely available, biomechanics researchers (&c.) will be able able to concentrate more on biomechanics rather than copying tables of numbers.
We also hope that by making a rich set of data available, questions will arise regarding accuracy, scope, and coverage of the models, and that researchers will be more able to chose the appropriate model for their particular application.

This project is quite incomplete! The data added to date has been largely to support our own work. Contributions welcome of course; see the main Github repository and make a pull request.

Models are divided into multiple folders and are described briefly below. Please consult the original publication for each model for further information.

## Relative mass models

These are the basic "segment YY is ZZ% of the body mass" models.

* `harless1860.csv`
    * Harless (1860)
    * Found in zats's book and Clauser (1969).

* `braune1889.csv`
    * Found in Clauser (1969): Braune and Fischer (1889).
    * Note that the value for the foot mass proportion is given as `1.7` by Clauser and `1.8` by zats; comparison with the original text should be done!

* `dempster1955.csv`:
    * Data from Dempster (1955).
    * The original data can be interpreted in various ways; here, I've omitted entries "Trunk minus shoulders" and "Trunk minus limbs" with the assumption that "Shoulders+Thorax+AbdoPelvis" is good enough (there's around 0.9% difference from doing so).

* `fujikawa1963.csv`
    * Found in Clauser (1969): Fujikawa (1963).
    * Japanese population
    * Clauser omits the Fujikawa values from his summary table citing anthropomorphic differences between Caucasian and Japanese populations.

* `clauser1969.csv`: Clauser (1969)

* `zats-selu1979f.csv`: From zats's book.
    * N = ??

* `zats-selu1979m.csv`: From zats's book.
    * N = 100
    * Includes standard deviation.

* `jensen1994.csv`
    * From Jensen and Fletcher (1994), "Distribution of mass to the segments of elderly males and females", Journal of Biomechanics
    * Elderly population

* `cheng2000`
    * From Cheng et al. (2000), "Segment inertial properties of Chinese adults determined from magnetic resonance imaging", Clinical Biomechanics.
    * Chinese population

* `pavol2002`
    * Pavol et al (2002), "Body segment inertial parameter estimation for the general population of older adults", Journal of Biomechanics
    * Older Caucasian population

* `chen2011.csv`
    * From Chen et al. (2011), "A method for estimating subject-specific body segment inertial parameters in human movement analysis", Gait & Posture.
    * A kinematic method, unusually.
    * Contains standard deviation.
    * N = 12.

* `ma2011.csv`
    * From Ma et al. (2011), "Nonlinear regression equations for segmental mass-inertial characteristics of Korean adults estimated using three-dimensional range scan data", Applied Ergonomics.
    * Contains both male and female mass proportions
    * Korean population

## Zatsiorsky's CT scan data

This data has been extracted from "Kinetics of Human Motion", input manually by two different people and cross-checked in Matlab for accuracy.

### Mean data

* `zats-mean-female-bsp.csv`:    Table A2.5
* `zats-mean-female-comgyr.csv`: Table A2.11
* `zats-mean-male-comgyr.csv`:   Table A2.11

### Weight/height regression models

Table A2.6:

* `zats2-male-com.csv`
* `zats2-male-mass.csv`
* `zats2-male-moi-ap.csv`
* `zats2-male-moi-ml.csv`
* `zats2-male-moi-si.csv`

Table A2.7:

* `zats2-female-com.csv`
* `zats2-female-mass.csv`
* `zats2-female-moi-ap.csv`
* `zats2-female-moi-ml.csv`
* `zats2-female-moi-si.csv`

### Geometric regression models (Table A2.8)

* `zatsN-male-abdo.csv`
* `zatsN-male-arm.csv`
* `zatsN-male-foot.csv`
* `zatsN-male-forearm.csv`
* `zatsN-male-hand.csv`
* `zatsN-male-headneck.csv`
* `zatsN-male-leg.csv`
* `zatsN-male-pelvis.csv`
* `zatsN-male-thigh.csv`
* `zatsN-male-thorax.csv`

### Nonlinear geometric regression models (Table A2.9)

* `zatsNL-female.csv`
* `zatsNL-male.csv`