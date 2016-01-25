# body-segment-param

Repository of body segment parameter models.

## Relative mass models

These are the basic "segment YY is ZZ% of the body mass" models.

* `harless1860.csv`
    * Harless (1860)
    * Found in Zatz's book and Clauser (1969).

* `braune1889.csv`
    * Found in Clauser (1969): Braune and Fischer (1889).
    * Note that the value for the foot mass proportion is given as `1.7` by Clauser and `1.8` by Zatz; comparison with the original text should be done!

* `dempster1955.csv`:
    * Data from Dempster (1955).
    * The original data can be interpreted in various ways; here, I've omitted entries "Trunk minus shoulders" and "Trunk minus limbs" with the assumption that "Shoulders+Thorax+AbdoPelvis" is good enough (there's around 0.9% difference from doing so).

* `fujikawa1963.csv`
    * Found in Clauser (1969): Fujikawa (1963).
    * Japanese population
    * Clauser omits the Fujikawa values from his summary table citing anthropomorphic differences between Caucasian and Japanese populations.

* `clauser1969.csv`: Clauser (1969)

* `zatz-selu.csv`: From Zatz's book.

* `jensen1994.csv`
    * From Jensen and Fletcher (1994), "Distribution of mass to the segments of elderly males and females", Journal of Biomechanics
    * Elderly population

* `cheng2000`
    * From Cheng et al. (2000), "Segment inertial properties of Chinese adults determined from magnetic resonance imaging", Clinical Biomechanics.
    * Chinese population

* `pavol2002`
    * Pavol et al (2002), "Body segment inertial parameter estimation for the general population of older adults", Journal of Biomechanics
    * Older Caucasian population

* `ma2011.csv`
    * From Ma et al. (2011), "Nonlinear regression equations for segmental mass-inertial characteristics of Korean adults estimated using three-dimensional range scan data", Applied Ergonomics.
    * Contains both male and female mass proportions
    * Korean population

## Zatsiorsky's CT scan data

This data has been extracted from "Kinetics of Human Motion", input manually by two different people and cross-checked in Matlab for accuracy.

### Mean data

* `zatz-mean-female-bsp.csv`:    Table A2.5
* `zatz-mean-female-comgyr.csv`: Table A2.11
* `zatz-mean-male-comgyr.csv`:   Table A2.11

### Weight/height regression models

Table A2.6:

* `zatz2-male-com.csv`
* `zatz2-male-mass.csv`
* `zatz2-male-moi-ap.csv`
* `zatz2-male-moi-ml.csv`
* `zatz2-male-moi-si.csv`

Table A2.7:

* `zatz2-female-com.csv`
* `zatz2-female-mass.csv`
* `zatz2-female-moi-ap.csv`
* `zatz2-female-moi-ml.csv`
* `zatz2-female-moi-si.csv`

### Geometric regression models (Table A2.8)

* `zatzN-male-abdo.csv`
* `zatzN-male-arm.csv`
* `zatzN-male-foot.csv`
* `zatzN-male-forearm.csv`
* `zatzN-male-hand.csv`
* `zatzN-male-headneck.csv`
* `zatzN-male-leg.csv`
* `zatzN-male-pelvis.csv`
* `zatzN-male-thigh.csv`
* `zatzN-male-thorax.csv`

### Nonlinear geometric regression models (Table A2.9)

* `zatzNL-female.csv`
* `zatzNL-male.csv`
