#
# Configuration file for a RASE database. Defines k-mer size resistance
# breakpoints for individual antibiotics and the order of antibiotics for
# plotting.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

#########
# INDEX #
#########

#db name
name=ngonorrhoeae-usa

# k-mer size, can contain multiple values
k=18

###############
# ANTIBIOTICS #
###############

antibiotics:=cfm cro cip azm

###############
# BREAKPOINTS #
###############

# ESC = extended-spectrum cephalosporin
cfm=0.250 # cefixime (CFX in the original paper, belongs to ESC)
cro=0.125 # ceftriaxone (CRO in the original paper, belongs to ESC)
cip=1.000 # ciprofloxacin (CIPRO in the original paper)
azm=2.000 # azithromycin (AZI in the original paper)

