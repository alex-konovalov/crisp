############################################################################
##
##  timings.g                       CRISP                  Burkhard Höfling
##
##  Copyright (C) 2000, 2011 by Burkhard Höfling
##
LoadPackage ("crisp");

FAST_TEST := true;
DO_TIMING := false;

ReadPackage ("crisp", "tst/timing_injectors.g");
ReadPackage ("crisp", "tst/timing_normals.g");
ReadPackage ("crisp", "tst/timing_normpro.g");
ReadPackage ("crisp", "tst/timing_projectors.g");
ReadPackage ("crisp", "tst/timing_radicals.g");
ReadPackage ("crisp", "tst/timing_residuals.g");
ReadPackage ("crisp", "tst/timing_socle.g");

FAST_TEST := false;
DO_TIMING := true;

ReadPackage ("crisp", "tst/timing_injectors.g");
ReadPackage ("crisp", "tst/timing_normals.g");
ReadPackage ("crisp", "tst/timing_projectors.g");
ReadPackage ("crisp", "tst/timing_radicals.g");
ReadPackage ("crisp", "tst/timing_residuals.g");
ReadPackage ("crisp", "tst/timing_socle.g");
ReadPackage ("crisp", "tst/timing_normpro.g");


############################################################################
##
#E
##
