#############################################################################
##
##  util.gd                         CRISP                 Burkhard H\"ofling
##
##  @(#)$Id$
##
##  Copyright (C) 2000 by Burkhard H\"ofling, Mathematisches Institut,
##  Friedrich Schiller-Universit\"at Jena, Germany
##
Revision.util_gd :=
    "@(#)$Id$";


#############################################################################
##
#A  NormalGeneratorsOfNilpotentResidualNilpotentResidual 
##
##  the normal closure of the subgroup generated by these elements
##  is the nilpotent residual (i.e., last term of the lower central series)
##
DeclareAttribute ("NormalGeneratorsOfNilpotentResidual", IsGroup);


#############################################################################
##
#F  ChiefSeriesElAbFactorUnderAction (<grp>, <M>, <N>)
##
##  computes a <grp>-chief series of the elementary abelian normal section M/N,
##  i.e. a list M = N_0 > N_1 > ... > N_r = N of subgroups of <grp> such that 
##  each N_i is normal in M and there is no <grp>-invariant subgroup between 
##  N_i and N_{i+1}.
##
DeclareGlobalFunction ("ChiefSeriesElAbFactorUnderAction");


#############################################################################
##
#F  PcgsChiefSeriesElAbModuloPcgsUnderAction (<grp>, <sec>)
##
##  computes a series of pcgs representing a <grp>-chief series of the  
##  elementary abelian normal section M/N,
##  i.e. a list M = N_0 > N_1 > ... > N_r = N of subgroups of <grp> such that 
##  each N_i is normal in M and there is no <grp>-invariant subgroup between 
##  N_i and N_{i+1}.
##
DeclareGlobalFunction ("PcgsChiefSeriesElAbModuloPcgsUnderAction");


#############################################################################
##
#F  IsAbelianModuloPcgs (<pcgs>)
##
##  tests whether pcgs (regarded as factor group) is abelian
##
DeclareGlobalFunction ("IsAbelianModuloPcgs");


#############################################################################
##
#O  CentralizesLayer (<list>, <mpcgs>)
##
DeclareOperation ("CentralizesLayer", [IsListOrCollection, IsModuloPcgs]);


#############################################################################
##
#F  PcgsElementaryAbelianSeriesFromGenericPcgs (<G>)
##
##  computes a pcgs exhibiting an elementary abelian series of G
##  from a given pcgs, avoiding SpecialPcgs. In particular returns the family 
##  pcgs if it has the required property
##
DeclareGlobalFunction ("PcgsElementaryAbelianSeriesFromGenericPcgs");


#############################################################################
##
#P  IsPrimitiveSolvable (<grp>)
##
DeclareProperty ("IsPrimitiveSolvable", IsGroup);


#############################################################################
##
#A  IndicesElementaryAbelianSteps (<pcgs>)
##
##  if the pc series defined by <pcgs> refines an elementary abelian series,
##  then IndicesElementaryAbelianSteps contains a list of the elements of
##  the pc series forming such an elementary abelian normal series
##
DeclareAttribute ("IndicesElementaryAbelianSteps", IsPcgs);


#############################################################################
##
#O  SiftedPcElementWrtPcSequence (<pcgs>, <seq>, <depths>, <x>)
##
##  sifts an element x through a pc sequence <seq> (that is, a plain list
##  whose elements form a (modulo) pcgs), reducing <x> if it has the same  
##  depth (wrt. the pcgs <pcgs>) as an element in seq. It returns the 
##  sifted element. <depths> must be a list containing for each element 
##  in seq its depth wrt. <pcgs>.
##
DeclareOperation ("SiftedPcElementWrtPcSequence", 
   [IsPcgs, IsListOrCollection, IsList, IsMultiplicativeElementWithInverse]);
   
#############################################################################
##
#O  AddPcElementToPcSequence (<pcgs>, <seq>, <depths>, <x>)
##
##  sifts an element <x> through a pc sequence <seq> reducing <x> if it has 
##  the same depth (wrt. the pcgs <pcgs>) as an element in <seq>. If the
##  resulting element is nontrivial, it is inserted at the
##  appropriate position in <seq>, and the list <depths>, which must be a 
##  list containing for each element in <seq> its depth wrt. <pcgs>, 
##  is adjusted accordingly. In this case, AddPcElementToPcSequence returns 
##  true. Otherwise it returns false. 
##
DeclareOperation ("AddPcElementToPcSequence", 
   [IsPcgs, IsListOrCollection, IsList, IsMultiplicativeElementWithInverse]);


#############################################################################
##
#A  InducedPcgsWrtPcgs
##
KeyDependentOperation ("InducedPcgsWrtPcgs", IsGroup, IsPcgs, ReturnTrue);


#############################################################################
##
#A  PrimePowerGensPcSequence (<grp>)
##
##  returns a record with components `primes', `generators', and `pcgs'.
##  `pcgs' contains a pcgs of <grp>
##  `primes' contains the set of all prime divisors of <grp>, and
##  `generators' contains a list of group elements, such that the elements in
##  generators[i] have relative order primes[i] and order a power of primes[i].
##  In addition, the list obtained by concatenating all lists in generators
##  forms a pcgs of <grp> when sorted according to their depths wrt. pcgs.

DeclareAttribute ("PrimePowerGensPcSequence", IsGroup);


#############################################################################
##
#F  InstallMethodByNiceMonomorphismForGroupAndClass( <oper>, <filt1>, <filt2>)
##
##  install method for oper taking a group and a class
BindGlobal( "InstallMethodByNiceMonomorphismForGroupAndClass", 
   function( oper, filt1, filt2)
   InstallMethod (oper,
      "handled by nice monomorphism",
      true,
      [IsGroup and IsHandledByNiceMonomorphism and filt1, filt2],
      0,
      function( grp, class)
         return PreImagesSet (NiceMonomorphism (grp), 
            oper (NiceObject (grp), class) );
      end);
   end);


#############################################################################
##
#F  InstallMethodByNiceMonomorphismForGroupAndClassReturningBool (
##      <oper>, <filt1>, <filt2>)
##
BindGlobal( "InstallMethodByNiceMonomorphismForGroupAndBool", 
   function( oper, filt1, filt2)
   InstallMethod (oper,
      "handled by nice monomorphism",
      true,
      [IsGroup and IsHandledByNiceMonomorphism and filt1, filt2],
      0,
      function( grp, class)
         return oper (NiceObject (grp), class);
      end);
   end);


#############################################################################
##
#E
##
