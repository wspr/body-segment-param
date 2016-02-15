# Repository of body segment parameter models

This is the main README for this repository. The user-friendly front page is located at <http://wspr.github.io/body-segment-param>.

This repository contains the raw data for a multitude of body segment parameter models.
Collecting this data, especially in standard form, is a tedious process; we hope that by making this data more widely available, biomechanics researchers (&c.) will be able able to concentrate more on biomechanics rather than copying tables of numbers.
We also hope that by making a rich set of data available, questions will arise regarding accuracy, scope, and coverage of the models, and that researchers will be more able to chose the appropriate model for their particular application.

This project is quite incomplete! The data added to date has been largely to support our own work. Contributions welcome of course; see the main Github repository and make a pull request.

Models are divided into multiple folders and are described briefly below. Please consult the original publication for each model for further information.

## Relative mass models

These are the basic "segment YY is ZZ% of the body mass" models.

To permit consistency of comparison between models, all models are presented with (at least) two columns.
The first is "original mass", which is the value given by the study.
In some cases, these masses will sum to the "average mass" in kg of the participants in the study.
In other cases (usually cadaveric), the masses are given in percentage of total body mass, but this total will not quite equal 100% due to the dissection processes.

All data is then presented in a "rescaled mass" column, pre-calculated to meaningless precision, such that the sum of the segments exactly equals 100%.
This results in a few cases where, due to rounding errors in the publications, data is presented that sums to, say, 99.8% and the rescaled column is, to all extents and purposes equal to the original column modulo some small discrepancies.
In other cases, care was evidently taken to ensure the segments summed to exactly 100% even with a precision of only 0.1 percentage points.

* `harless1860.csv`
    * Harless (1860)
    * Found in zats's book and Clauser (1969).

* `braune1889.csv`
    * Found in Clauser (1969): Braune and Fischer (1889).
    * Note that the value for the foot mass proportion is given as `1.7` by Clauser and `1.8` by zats; comparison with the original text should be done!

* `dempster1955.csv`:
    * Data from Dempster (1955).
    * Standard deviations can be calculated from data given by Dempster but have been taken from Zatsiorski (2002).
    * The original data can be interpreted in various ways; here, I've omitted entries "Trunk minus shoulders" and "Trunk minus limbs" with the assumption that "Shoulders+Thorax+AbdoPelvis" is good enough (there's around 0.9% difference from doing so).

* `fujikawa1963.csv`
    * Found in Clauser (1969): Fujikawa (1963).
    * Japanese population.
    * Clauser omits the Fujikawa values from his summary table citing anthropomorphic differences between Caucasian and Japanese populations.

* `clauser1969.csv`: Clauser (1969)

* `zats-selu1979f.csv`:
    * From Zatsiorski (2002), "Kinetics of Human Motion", Human Kinetics.
    * N = 15.

* `zats-selu1979m.csv`
    * From Zatsiorski (2002), "Kinetics of Human Motion", Human Kinetics.
    * N = 100.
    * Includes standard deviation.

* `jensen1994F.csv`/`jensen1994M.csv`
    * From Jensen and Fletcher (1994), "Distribution of mass to the segments of elderly males and females", Journal of Biomechanics
    * Elderly population

* `cheng2000`
    * From Cheng et al. (2000), "Segment inertial properties of Chinese adults determined from magnetic resonance imaging", Clinical Biomechanics.
    * Chinese population.
    * Includes standard deviation.
    * Includes CoM.

* `pavol2002F.csv`/`pavol2002M.csv`
    * Pavol et al (2002), "Body segment inertial parameter estimation for the general population of older adults", Journal of Biomechanics
    * Older Caucasian population.
    * Includes standard deviation.

* `chen2011.csv`
    * From Chen et al. (2011), "A method for estimating subject-specific body segment inertial parameters in human movement analysis", Gait & Posture.
    * A kinematic method, unusually.
    * Includes standard deviation.
    * Includes CoM.
    * N = 12.

* `ma2011F.csv`/`ma2011M.csv`
    * From Ma et al. (2011), "Nonlinear regression equations for segmental mass-inertial characteristics of Korean adults estimated using three-dimensional range scan data", Applied Ergonomics.
    * Korean population

## Zatsiorsky's CT scan data

This data has been extracted from Zatsiorski (2002), "Kinetics of Human Motion", Human Kinetics, input manually by two different people and cross-checked in Matlab for accuracy.

### Mean data

* `zats-mean-female-bsp.csv`:    Table A2.5
* `zats-mean-female-comgyr.csv`: Table A2.11
* `zats-mean-male-bsp.csv`:      Table  4.4
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
