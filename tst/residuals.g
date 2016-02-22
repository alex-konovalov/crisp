############################################################################
##
##  residuals.g                       CRISP                 Burkhard Höfling
##
##  Copyright © 2000 Burkhard Höfling
##
LogTo("test.log");
START_TEST("residuals");
LoadPackage("crisp", "", false);
CRISP_Read("tst/samples.g");

if PRINT_METHODS then
    TraceMethods(ResidualOp);
fi;

for G in groups do
    Info(InfoTest, 1, G());
    old := fail;
    cl := classes(); 
    for C in cl do
        SetIsOrdinaryFormation(C, true);
    od;
    for i in [1..Length(cl)] do
        if InfoLevel(InfoTest) >= 2 then
            View(cl[i]);
            Print("\n");
        fi;
        new := Size(Residual(G(), cl[i]));
        if old = fail then
            old := new;
        elif old <> new then
            Error("different results");
        fi;
        for j in [i..Length(cl)] do
            I := Intersection(cl[i], cl[j]);
            if InfoLevel(InfoTest) >= 3 then
                View(I);
                Print("\n");
            fi;
            new := Size(Residual(G(), I));
            if old <> new then
                Error("different results");
            fi;
        od;
    od;
    for C in cl do
        for D in cl do
            P := FormationProduct(C, D);
            if InfoLevel(InfoTest) >= 3 then
                View(C, "by", D);
                Print("\n");
            fi;
            new := Size(Residual(G(), P));
            if old <> new then
                Error("different results");
            fi;
        od;
    od;
od;

if PRINT_METHODS then
    UnTraceMethods(ResidualOp);
fi;
STOP_TEST("residuals", 0);


############################################################################
##
#E
##
