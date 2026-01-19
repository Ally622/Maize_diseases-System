(*
  Maize Diseases Knowledge Base in Coq
  ------------------------------------
  This code models diseases, symptoms, conditions, rules, and inference patterns.
*)

(* ----------------------------- *)
(* 1. Ontology                   *)
(* ----------------------------- *)

Inductive Disease :=
| MLND | Rust | Blight | Smut | DownyMildew | GrayLeafSpot | Anthracnose
| RootRot | EarRot | CommonBunt | StalkRot | ViralStreak | LeafCurl
| Wilt | StripeDisease | ChlorosisComplex | MosaicVirus
| FusariumWilt | AspergillusRot | DiplodiaEarRot.

Inductive Symptom :=
| Yellowing | Necrosis | LeafSpots | StemBreakage | EarDiscoloration
| WhiteFungalGrowth | RustPustules | MoldyKernels | Wilting | Curling
| Streaks | SoftRot | Blisters | PowderyGrowth | WaterSoaking
| DampingOff | GrayLesions | DeadTissue | StuntedGrowth | Browning.

Inductive Condition :=
| HighHumidity | LowHumidity | ModerateHumidity | HighTemp | LowTemp
| WetSoils | PoorDrainage | Drought | InsectVector | DensePlanting
| PoorFertility | LatePlanting | EarlyPlanting
| ContaminatedSeed | MechanicalInjury.

(* ----------------------------- *)
(* 2. Predicates (FACT TABLES)   *)
(* ----------------------------- *)

Inductive has_symptom : Disease -> Symptom -> Prop :=
| hs1  : has_symptom MLND Yellowing
| hs2  : has_symptom MLND Necrosis
| hs3  : has_symptom MLND StuntedGrowth
| hs4  : has_symptom Rust RustPustules
| hs5  : has_symptom Rust LeafSpots
| hs6  : has_symptom Blight LeafSpots
| hs7  : has_symptom Blight DeadTissue
| hs8  : has_symptom Smut Blisters
| hs9  : has_symptom Smut MoldyKernels
| hs10 : has_symptom DownyMildew WhiteFungalGrowth
| hs11 : has_symptom DownyMildew WaterSoaking
| hs12 : has_symptom GrayLeafSpot GrayLesions
| hs13 : has_symptom GrayLeafSpot DeadTissue
| hs14 : has_symptom Anthracnose DeadTissue
| hs15 : has_symptom RootRot SoftRot
| hs16 : has_symptom RootRot Browning
| hs17 : has_symptom EarRot MoldyKernels
| hs18 : has_symptom EarRot EarDiscoloration
| hs19 : has_symptom StalkRot StemBreakage
| hs20 : has_symptom ViralStreak Streaks
| hs21 : has_symptom LeafCurl Curling
| hs22 : has_symptom Wilt Wilting
| hs23 : has_symptom StripeDisease Streaks
| hs24 : has_symptom ChlorosisComplex Yellowing
| hs25 : has_symptom MosaicVirus Yellowing
| hs26 : has_symptom FusariumWilt Wilting
| hs27 : has_symptom AspergillusRot MoldyKernels
| hs28 : has_symptom DiplodiaEarRot MoldyKernels
| hs29 : has_symptom DiplodiaEarRot EarDiscoloration
| hs30 : has_symptom Anthracnose Browning.

Inductive indicates : Symptom -> Disease -> Prop :=
| ind1  : indicates Yellowing ChlorosisComplex
| ind2  : indicates Yellowing MLND
| ind3  : indicates Necrosis MLND
| ind4  : indicates RustPustules Rust
| ind5  : indicates LeafSpots Blight
| ind6  : indicates LeafSpots Rust
| ind7  : indicates MoldyKernels EarRot
| ind8  : indicates MoldyKernels AspergillusRot
| ind9  : indicates WaterSoaking DownyMildew
| ind10 : indicates GrayLesions GrayLeafSpot
| ind11 : indicates Blisters Smut
| ind12 : indicates SoftRot RootRot
| ind13 : indicates Streaks ViralStreak
| ind14 : indicates Streaks StripeDisease
| ind15 : indicates Curling LeafCurl
| ind16 : indicates Wilting Wilt
| ind17 : indicates Wilting FusariumWilt
| ind18 : indicates Browning RootRot
| ind19 : indicates DeadTissue Anthracnose
| ind20 : indicates GrayLesions GrayLeafSpot.

Inductive triggered_by : Disease -> Condition -> Prop :=
| tr1  : triggered_by MLND InsectVector
| tr2  : triggered_by Rust HighHumidity
| tr3  : triggered_by Rust ModerateHumidity
| tr4  : triggered_by Blight HighHumidity
| tr5  : triggered_by DownyMildew HighHumidity
| tr6  : triggered_by DownyMildew WetSoils
| tr7  : triggered_by GrayLeafSpot HighTemp
| tr8  : triggered_by Smut ContaminatedSeed
| tr9  : triggered_by RootRot PoorDrainage
| tr10 : triggered_by RootRot WetSoils
| tr11 : triggered_by EarRot HighHumidity
| tr12 : triggered_by EarRot MechanicalInjury
| tr13 : triggered_by Wilt Drought
| tr14 : triggered_by LeafCurl InsectVector
| tr15 : triggered_by MosaicVirus InsectVector
| tr16 : triggered_by FusariumWilt WetSoils
| tr17 : triggered_by StalkRot HighTemp
| tr18 : triggered_by Anthracnose HighHumidity
| tr19 : triggered_by AspergillusRot HighTemp
| tr20 : triggered_by DiplodiaEarRot HighHumidity.

Inductive risk_factor : Disease -> Condition -> Prop :=
| rf1  : risk_factor MLND LatePlanting
| rf2  : risk_factor MLND DensePlanting
| rf3  : risk_factor Rust HighHumidity
| rf4  : risk_factor Blight HighHumidity
| rf5  : risk_factor DownyMildew WetSoils
| rf6  : risk_factor GrayLeafSpot HighTemp
| rf7  : risk_factor Smut ContaminatedSeed
| rf8  : risk_factor RootRot PoorDrainage
| rf9  : risk_factor EarRot HighHumidity
| rf10 : risk_factor Wilt Drought
| rf11 : risk_factor MosaicVirus InsectVector
| rf12 : risk_factor FusariumWilt PoorDrainage
| rf13 : risk_factor StalkRot HighTemp
| rf14 : risk_factor DiplodiaEarRot MechanicalInjury
| rf15 : risk_factor AspergillusRot HighTemp.

Inductive co_occurs : Disease -> Disease -> Prop :=
| co1 : co_occurs Rust GrayLeafSpot
| co2 : co_occurs EarRot AspergillusRot
| co3 : co_occurs Smut EarRot
| co4 : co_occurs DownyMildew Blight
| co5 : co_occurs RootRot FusariumWilt
| co6 : co_occurs MLND MosaicVirus
| co7 : co_occurs Anthracnose GrayLeafSpot
| co8 : co_occurs StalkRot RootRot
| co9 : co_occurs DiplodiaEarRot AspergillusRot
| co10: co_occurs Blight Rust.

Inductive severe_under : Disease -> Condition -> Prop :=
| sev1  : severe_under MLND HighHumidity
| sev2  : severe_under Rust HighHumidity
| sev3  : severe_under DownyMildew WetSoils
| sev4  : severe_under GrayLeafSpot HighTemp
| sev5  : severe_under StalkRot HighTemp
| sev6  : severe_under EarRot HighHumidity
| sev7  : severe_under FusariumWilt WetSoils
| sev8  : severe_under Anthracnose HighHumidity
| sev9  : severe_under DiplodiaEarRot HighHumidity
| sev10 : severe_under AspergillusRot HighTemp.

(* ----------------------------- *)
(* 3. Example Queries            *)
(* ----------------------------- *)

Theorem query1 : has_symptom Rust LeafSpots.
Proof. apply hs5. Qed.

Theorem query2 : indicates Streaks ViralStreak.
Proof. apply ind13. Qed.

Theorem query3 : triggered_by DownyMildew WetSoils.
Proof. apply tr6. Qed.

Theorem query4 : severe_under FusariumWilt WetSoils.
Proof. apply sev7. Qed.

Theorem query5 : co_occurs Rust GrayLeafSpot.
Proof. apply co1. Qed.
Theorem test_fact_1 :
  has_symptom MLND Yellowing.
Proof.
  apply hs1.
Qed.


