############################################################################
##
##  timing_projectors_mod.g         CRISP                 Burkhard H\"ofling
##
##  @(#)$Id$
##
##  Copyright (C) 2000 by Burkhard H\"ofling, Mathematisches Institut,
##  Friedrich Schiller-Universit\"at Jena, Germany
##
RequirePackage ("crisp");

MakeReadWriteGlobal ("BFUNC_FROM_TEST_FUNC");
BFUNC_FROM_TEST_FUNC := BFUNC_FROM_TEST_FUNC_MOD;
MakeReadOnlyGlobal ("BFUNC_FROM_TEST_FUNC");

ReadPkg ("crisp", "tst/timing_projectors.g");


############################################################################
##
#E
##