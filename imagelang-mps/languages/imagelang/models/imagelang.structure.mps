<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:b3782452-bf10-4ef1-8aaf-fef26baa6603(imagelang.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="9" />
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="4fqr" ref="r:fa713d69-08ea-4732-b1f2-cb07f9e103ef(jetbrains.mps.execution.util.structure)" implicit="true" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1082978164218" name="jetbrains.mps.lang.structure.structure.DataTypeDeclaration" flags="ng" index="AxPO6">
        <property id="7791109065626895363" name="datatypeId" index="3F6X1D" />
      </concept>
      <concept id="1082978499127" name="jetbrains.mps.lang.structure.structure.ConstrainedDataTypeDeclaration" flags="ng" index="Az7Fb">
        <property id="1083066089218" name="constraint" index="FLfZY" />
      </concept>
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <property id="4628067390765956802" name="abstract" index="R5$K7" />
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
        <child id="1071489727083" name="linkDeclaration" index="1TKVEi" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1169125989551" name="jetbrains.mps.lang.structure.structure.InterfaceConceptDeclaration" flags="ig" index="PlHQZ" />
      <concept id="1169127622168" name="jetbrains.mps.lang.structure.structure.InterfaceConceptReference" flags="ig" index="PrWs8">
        <reference id="1169127628841" name="intfc" index="PrY4T" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <property id="1096454100552" name="rootable" index="19KtqR" />
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
        <child id="1169129564478" name="implements" index="PzmwI" />
      </concept>
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <property id="241647608299431129" name="propertyId" index="IQ2nx" />
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
      </concept>
      <concept id="1071489288298" name="jetbrains.mps.lang.structure.structure.LinkDeclaration" flags="ig" index="1TJgyj">
        <property id="1071599776563" name="role" index="20kJfa" />
        <property id="1071599893252" name="sourceCardinality" index="20lbJX" />
        <property id="1071599937831" name="metaClass" index="20lmBu" />
        <property id="241647608299431140" name="linkId" index="IQ2ns" />
        <reference id="1071599976176" name="target" index="20lvS9" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1TIwiD" id="2zOT$_1s4h0">
    <property role="EcuMT" value="2951236858139395136" />
    <property role="TrG5h" value="Canvas" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="2zOT$_1s4h3" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="24qcwCbgR1Y" role="1TKVEi">
      <property role="IQ2ns" value="2385273971366129790" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="vars" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="24qcwCbfqWD" resolve="Declaration" />
    </node>
    <node concept="1TJgyj" id="2zOT$_1s4h6" role="1TKVEi">
      <property role="IQ2ns" value="2951236858139395142" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="image" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="24qcwCbhIhF" resolve="Image" />
    </node>
    <node concept="PrWs8" id="3v9$RrAj2BM" role="PzmwI">
      <ref role="PrY4T" to="tpck:3fifI_xCcJN" resolve="ScopeProvider" />
    </node>
    <node concept="PrWs8" id="2zOT$_1tOMk" role="PzmwI">
      <ref role="PrY4T" to="4fqr:431DWIovi3l" resolve="IMainClass" />
    </node>
  </node>
  <node concept="1TIwiD" id="2zOT$_1s4h8">
    <property role="TrG5h" value="FillableShape" />
    <property role="EcuMT" value="2951236858139395144" />
    <property role="R5$K7" value="true" />
    <property role="3GE5qa" value="images" />
    <ref role="1TJDcQ" node="1w$3KkGSO7J" resolve="Shape" />
    <node concept="1TJgyj" id="1tFQO7bB5dL" role="1TKVEi">
      <property role="IQ2ns" value="1687683561015759729" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="filling" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="1tFQO7bBBws" resolve="FillingReference" />
    </node>
  </node>
  <node concept="1TIwiD" id="2zOT$_1s4hf">
    <property role="EcuMT" value="2951236858139395151" />
    <property role="TrG5h" value="Circle" />
    <property role="34LRSv" value="circle" />
    <property role="3GE5qa" value="images" />
    <ref role="1TJDcQ" node="4Fmodk112E5" resolve="Ellipse" />
    <node concept="1TJgyi" id="2zOT$_1s4hp" role="1TKVEl">
      <property role="IQ2nx" value="2951236858139395161" />
      <property role="TrG5h" value="radius" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
  </node>
  <node concept="1TIwiD" id="2zOT$_1s4hr">
    <property role="EcuMT" value="2951236858139395163" />
    <property role="TrG5h" value="Square" />
    <property role="34LRSv" value="square" />
    <property role="3GE5qa" value="images" />
    <ref role="1TJDcQ" node="4Fmodk112HB" resolve="Rectangle" />
    <node concept="1TJgyi" id="2zOT$_1s4hs" role="1TKVEl">
      <property role="IQ2nx" value="2951236858139395164" />
      <property role="TrG5h" value="size" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
  </node>
  <node concept="1TIwiD" id="2zOT$_1siTp">
    <property role="EcuMT" value="2951236858139455065" />
    <property role="TrG5h" value="Color" />
    <property role="34LRSv" value="color" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="2zOT$_1siTq" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="2zOT$_1suc8">
    <property role="EcuMT" value="2951236858139501320" />
    <property role="TrG5h" value="ColorReference" />
    <ref role="1TJDcQ" node="3v9$RrAbTia" resolve="BaseColor" />
    <node concept="1TJgyj" id="2zOT$_1suc9" role="1TKVEi">
      <property role="IQ2ns" value="2951236858139501321" />
      <property role="20kJfa" value="target" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="2zOT$_1siTp" resolve="Color" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Fmodk0Wh8P">
    <property role="EcuMT" value="5392604071782847029" />
    <property role="TrG5h" value="Primitive" />
    <property role="R5$K7" value="true" />
    <property role="3GE5qa" value="images" />
    <ref role="1TJDcQ" node="24qcwCbhIhF" resolve="Image" />
  </node>
  <node concept="1TIwiD" id="4Fmodk0Wimi">
    <property role="EcuMT" value="5392604071782851986" />
    <property role="TrG5h" value="Line" />
    <property role="34LRSv" value="line" />
    <property role="3GE5qa" value="images" />
    <ref role="1TJDcQ" node="1w$3KkGSO7J" resolve="Shape" />
    <node concept="1TJgyj" id="5aueixV2d$H" role="1TKVEi">
      <property role="IQ2ns" value="5953258603456026925" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="from" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="5aueixV0xLt" resolve="Point" />
    </node>
    <node concept="1TJgyj" id="5aueixV2d_U" role="1TKVEi">
      <property role="IQ2ns" value="5953258603456027002" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="to" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="5aueixV0xLt" resolve="Point" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Fmodk112zJ">
    <property role="EcuMT" value="5392604071784098031" />
    <property role="TrG5h" value="Polygon" />
    <property role="3GE5qa" value="images" />
    <property role="34LRSv" value="polygon" />
    <ref role="1TJDcQ" node="2zOT$_1s4h8" resolve="FillableShape" />
    <node concept="1TJgyj" id="5aueixV0xSD" role="1TKVEi">
      <property role="IQ2ns" value="5953258603455585833" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="points" />
      <property role="20lbJX" value="fLJekj6/_1__n" />
      <ref role="20lvS9" node="5aueixV0xLt" resolve="Point" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Fmodk112E5">
    <property role="EcuMT" value="5392604071784098437" />
    <property role="TrG5h" value="Ellipse" />
    <property role="3GE5qa" value="images" />
    <property role="34LRSv" value="ellipse" />
    <ref role="1TJDcQ" node="2zOT$_1s4h8" resolve="FillableShape" />
  </node>
  <node concept="1TIwiD" id="4Fmodk112HB">
    <property role="EcuMT" value="5392604071784098663" />
    <property role="TrG5h" value="Rectangle" />
    <property role="3GE5qa" value="images" />
    <property role="34LRSv" value="rectangle" />
    <ref role="1TJDcQ" node="2zOT$_1s4h8" resolve="FillableShape" />
  </node>
  <node concept="1TIwiD" id="4Fmodk112ND">
    <property role="EcuMT" value="5392604071784099049" />
    <property role="TrG5h" value="Star" />
    <property role="3GE5qa" value="images" />
    <property role="34LRSv" value="star" />
    <ref role="1TJDcQ" node="4Fmodk112zJ" resolve="Polygon" />
    <node concept="1TJgyi" id="24qcwCbhVPa" role="1TKVEl">
      <property role="IQ2nx" value="2385273971366411594" />
      <property role="TrG5h" value="size" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Fmodk112Sm">
    <property role="EcuMT" value="5392604071784099350" />
    <property role="TrG5h" value="Triangle" />
    <property role="3GE5qa" value="images" />
    <property role="34LRSv" value="triangle" />
    <ref role="1TJDcQ" node="4Fmodk112zJ" resolve="Polygon" />
    <node concept="1TJgyi" id="24qcwCbhPIQ" role="1TKVEl">
      <property role="IQ2nx" value="2385273971366386614" />
      <property role="TrG5h" value="leg" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Fmodk112XB">
    <property role="EcuMT" value="5392604071784099687" />
    <property role="TrG5h" value="FileImage" />
    <property role="34LRSv" value="file image" />
    <property role="3GE5qa" value="images" />
    <ref role="1TJDcQ" node="4Fmodk0Wh8P" resolve="Primitive" />
    <node concept="1TJgyi" id="4Fmodk112ZP" role="1TKVEl">
      <property role="IQ2nx" value="5392604071784099829" />
      <property role="TrG5h" value="path" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="24qcwCbfqWD">
    <property role="EcuMT" value="2385273971365752617" />
    <property role="TrG5h" value="Declaration" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="4q8PBg22YLQ" role="1TKVEi">
      <property role="IQ2ns" value="5082547973226490998" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="variable" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="4q8PBg22YGV" resolve="Variable" />
    </node>
    <node concept="1TJgyj" id="4q8PBg22G4o" role="1TKVEi">
      <property role="IQ2ns" value="5082547973226414360" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="value" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="4q8PBg22FYx" resolve="Expression" />
    </node>
  </node>
  <node concept="1TIwiD" id="24qcwCbhIa3">
    <property role="EcuMT" value="2385273971366355587" />
    <property role="TrG5h" value="BinaryOperation" />
    <property role="R5$K7" value="true" />
    <property role="3GE5qa" value="operations" />
    <ref role="1TJDcQ" node="24qcwCbhIhF" resolve="Image" />
    <node concept="1TJgyj" id="24qcwCbhIdH" role="1TKVEi">
      <property role="IQ2ns" value="2385273971366355821" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="left" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="24qcwCbhIhF" resolve="Image" />
    </node>
    <node concept="1TJgyj" id="24qcwCbhImw" role="1TKVEi">
      <property role="IQ2ns" value="2385273971366356384" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="right" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="24qcwCbhIhF" resolve="Image" />
    </node>
  </node>
  <node concept="1TIwiD" id="24qcwCbhIhF">
    <property role="TrG5h" value="Image" />
    <property role="EcuMT" value="2385273971366356075" />
    <property role="R5$K7" value="true" />
    <property role="3GE5qa" value="images" />
    <ref role="1TJDcQ" node="4q8PBg22FYx" resolve="Expression" />
  </node>
  <node concept="1TIwiD" id="24qcwCbhIu2">
    <property role="EcuMT" value="2385273971366356866" />
    <property role="3GE5qa" value="operations" />
    <property role="TrG5h" value="Besides" />
    <property role="34LRSv" value="besides" />
    <ref role="1TJDcQ" node="24qcwCbhIa3" resolve="BinaryOperation" />
  </node>
  <node concept="1TIwiD" id="5aueixUZMvC">
    <property role="EcuMT" value="5953258603455391720" />
    <property role="3GE5qa" value="operations" />
    <property role="TrG5h" value="Behind" />
    <property role="34LRSv" value="behind" />
    <ref role="1TJDcQ" node="24qcwCbhIa3" resolve="BinaryOperation" />
  </node>
  <node concept="1TIwiD" id="5aueixUZMAy">
    <property role="EcuMT" value="5953258603455392162" />
    <property role="3GE5qa" value="operations" />
    <property role="TrG5h" value="Above" />
    <property role="34LRSv" value="above" />
    <ref role="1TJDcQ" node="24qcwCbhIa3" resolve="BinaryOperation" />
  </node>
  <node concept="1TIwiD" id="5aueixV0xLt">
    <property role="EcuMT" value="5953258603455585373" />
    <property role="TrG5h" value="Point" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="5aueixV0xMH" role="1TKVEl">
      <property role="IQ2nx" value="5953258603455585453" />
      <property role="TrG5h" value="x" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
    <node concept="1TJgyi" id="5aueixV0xNU" role="1TKVEl">
      <property role="IQ2nx" value="5953258603455585530" />
      <property role="TrG5h" value="y" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
  </node>
  <node concept="1TIwiD" id="1tFQO7bz1nk">
    <property role="EcuMT" value="1687683561014695380" />
    <property role="TrG5h" value="Transform" />
    <property role="R5$K7" value="true" />
    <property role="3GE5qa" value="transforms" />
    <ref role="1TJDcQ" node="4q8PBg22FYx" resolve="Expression" />
  </node>
  <node concept="1TIwiD" id="1tFQO7bz1ut">
    <property role="EcuMT" value="1687683561014695837" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="PrimitiveTransform" />
    <property role="R5$K7" value="true" />
    <ref role="1TJDcQ" node="1tFQO7bz1nk" resolve="Transform" />
  </node>
  <node concept="1TIwiD" id="1tFQO7bz1Cj">
    <property role="EcuMT" value="1687683561014696467" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="Then" />
    <property role="34LRSv" value="then" />
    <ref role="1TJDcQ" node="1tFQO7bz1nk" resolve="Transform" />
    <node concept="1TJgyj" id="1tFQO7bz1Re" role="1TKVEi">
      <property role="IQ2ns" value="1687683561014697422" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="left" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="1tFQO7bz1nk" resolve="Transform" />
    </node>
    <node concept="1TJgyj" id="1tFQO7bz1TA" role="1TKVEi">
      <property role="IQ2ns" value="1687683561014697574" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="right" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="1tFQO7bz1nk" resolve="Transform" />
    </node>
  </node>
  <node concept="1TIwiD" id="1tFQO7bz2fl">
    <property role="EcuMT" value="1687683561014698965" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="Translate" />
    <property role="34LRSv" value="translate" />
    <ref role="1TJDcQ" node="1tFQO7bz1ut" resolve="PrimitiveTransform" />
    <node concept="1TJgyi" id="1tFQO7bzdYK" role="1TKVEl">
      <property role="IQ2nx" value="1687683561014747056" />
      <property role="TrG5h" value="x" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
    <node concept="1TJgyi" id="1tFQO7bzdZ$" role="1TKVEl">
      <property role="IQ2nx" value="1687683561014747108" />
      <property role="TrG5h" value="y" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
  </node>
  <node concept="1TIwiD" id="1tFQO7bz38p">
    <property role="EcuMT" value="1687683561014702617" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="Rotate" />
    <property role="34LRSv" value="rotate" />
    <ref role="1TJDcQ" node="1tFQO7bz1ut" resolve="PrimitiveTransform" />
    <node concept="1TJgyi" id="1tFQO7bz3c0" role="1TKVEl">
      <property role="IQ2nx" value="1687683561014702848" />
      <property role="TrG5h" value="angle" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
    <node concept="1TJgyj" id="1tFQO7bzhvU" role="1TKVEi">
      <property role="IQ2ns" value="1687683561014761466" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="center" />
      <ref role="20lvS9" node="5aueixV0xLt" resolve="Point" />
    </node>
  </node>
  <node concept="1TIwiD" id="1tFQO7bz3eo">
    <property role="EcuMT" value="1687683561014703000" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="Scale" />
    <property role="34LRSv" value="scale" />
    <ref role="1TJDcQ" node="1tFQO7bz1ut" resolve="PrimitiveTransform" />
    <node concept="1TJgyi" id="1tFQO7bz3ep" role="1TKVEl">
      <property role="IQ2nx" value="1687683561014703001" />
      <property role="TrG5h" value="scaleX" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
    <node concept="1TJgyi" id="1tFQO7bz3hZ" role="1TKVEl">
      <property role="IQ2nx" value="1687683561014703231" />
      <property role="TrG5h" value="scaleY" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
  </node>
  <node concept="1TIwiD" id="1tFQO7bz3lW">
    <property role="EcuMT" value="1687683561014703484" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="Shear" />
    <property role="34LRSv" value="shear" />
    <property role="R5$K7" value="true" />
    <ref role="1TJDcQ" node="1tFQO7bz1ut" resolve="PrimitiveTransform" />
    <node concept="1TJgyi" id="1tFQO7bz3lX" role="1TKVEl">
      <property role="IQ2nx" value="1687683561014703485" />
      <property role="TrG5h" value="factor" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
  </node>
  <node concept="1TIwiD" id="1tFQO7bz3En">
    <property role="EcuMT" value="1687683561014704791" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="VerticalMirror" />
    <property role="34LRSv" value="vertical mirror" />
    <ref role="1TJDcQ" node="1tFQO7bz1ut" resolve="PrimitiveTransform" />
  </node>
  <node concept="1TIwiD" id="1tFQO7bz3Po">
    <property role="EcuMT" value="1687683561014705496" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="HorizontalMirror" />
    <property role="34LRSv" value="horizontal mirror" />
    <ref role="1TJDcQ" node="1tFQO7bz1ut" resolve="PrimitiveTransform" />
  </node>
  <node concept="1TIwiD" id="1tFQO7bz4eB">
    <property role="EcuMT" value="1687683561014707111" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="ClipOrCrop" />
    <property role="34LRSv" value="clip" />
    <ref role="1TJDcQ" node="1tFQO7bz1ut" resolve="PrimitiveTransform" />
    <node concept="1TJgyi" id="1tFQO7bz4oS" role="1TKVEl">
      <property role="IQ2nx" value="1687683561014707768" />
      <property role="TrG5h" value="upperLeftX" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
    <node concept="1TJgyi" id="1tFQO7bz4rD" role="1TKVEl">
      <property role="IQ2nx" value="1687683561014707945" />
      <property role="TrG5h" value="upperLeftY" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
    <node concept="1TJgyi" id="1tFQO7bz4u2" role="1TKVEl">
      <property role="IQ2nx" value="1687683561014708098" />
      <property role="TrG5h" value="width" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
    <node concept="1TJgyi" id="1tFQO7bz4vh" role="1TKVEl">
      <property role="IQ2nx" value="1687683561014708177" />
      <property role="TrG5h" value="height" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
  </node>
  <node concept="1TIwiD" id="1tFQO7bzzlQ">
    <property role="EcuMT" value="1687683561014834550" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="ShearX" />
    <property role="34LRSv" value="shear along x" />
    <ref role="1TJDcQ" node="1tFQO7bz3lW" resolve="Shear" />
  </node>
  <node concept="1TIwiD" id="1tFQO7bz$CC">
    <property role="EcuMT" value="1687683561014839848" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="ShearY" />
    <property role="34LRSv" value="shear along y" />
    <ref role="1TJDcQ" node="1tFQO7bz3lW" resolve="Shear" />
  </node>
  <node concept="1TIwiD" id="1tFQO7b$IWd">
    <property role="EcuMT" value="1687683561015144205" />
    <property role="3GE5qa" value="images" />
    <property role="TrG5h" value="Transformed" />
    <ref role="1TJDcQ" node="24qcwCbhIhF" resolve="Image" />
    <node concept="1TJgyj" id="1tFQO7b$J4a" role="1TKVEi">
      <property role="IQ2ns" value="1687683561015144714" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="transform" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="1tFQO7bz1nk" resolve="Transform" />
    </node>
    <node concept="1TJgyj" id="1tFQO7b$J1p" role="1TKVEi">
      <property role="IQ2ns" value="1687683561015144537" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="original" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="24qcwCbhIhF" resolve="Image" />
    </node>
  </node>
  <node concept="1TIwiD" id="1tFQO7b_OKE">
    <property role="EcuMT" value="1687683561015430186" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="Bbox" />
    <property role="34LRSv" value="bbox" />
    <ref role="1TJDcQ" node="1tFQO7bz1ut" resolve="PrimitiveTransform" />
  </node>
  <node concept="1TIwiD" id="1tFQO7bB3I0">
    <property role="EcuMT" value="1687683561015753600" />
    <property role="TrG5h" value="Filling" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1tFQO7bB3L1" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="1tFQO7bBBws">
    <property role="EcuMT" value="1687683561015900188" />
    <property role="TrG5h" value="FillingReference" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1tFQO7bBByx" role="1TKVEi">
      <property role="IQ2ns" value="1687683561015900321" />
      <property role="20kJfa" value="filling" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="1tFQO7bB3I0" resolve="Filling" />
    </node>
  </node>
  <node concept="1TIwiD" id="1w$3KkGSO7J">
    <property role="EcuMT" value="1739531870974198255" />
    <property role="3GE5qa" value="images" />
    <property role="TrG5h" value="Shape" />
    <property role="R5$K7" value="true" />
    <ref role="1TJDcQ" node="4Fmodk0Wh8P" resolve="Primitive" />
    <node concept="1TJgyj" id="2zOT$_1soRR" role="1TKVEi">
      <property role="IQ2ns" value="2951236858139479543" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="color" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="3v9$RrAbTia" resolve="BaseColor" />
    </node>
    <node concept="1TJgyi" id="4Fmodk11KFA" role="1TKVEl">
      <property role="IQ2nx" value="5392604071784286950" />
      <property role="TrG5h" value="width" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
    <node concept="1TJgyi" id="4Fmodk11KFC" role="1TKVEl">
      <property role="IQ2nx" value="5392604071784286952" />
      <property role="TrG5h" value="height" />
      <ref role="AX2Wp" to="tpee:gc$lTUB" resolve="_FPNumber_String" />
    </node>
  </node>
  <node concept="1TIwiD" id="4q8PBg1ZI5P">
    <property role="EcuMT" value="5082547973225636213" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="Clip" />
    <property role="34LRSv" value="clip" />
    <ref role="1TJDcQ" node="1tFQO7bz4eB" resolve="ClipOrCrop" />
  </node>
  <node concept="1TIwiD" id="4q8PBg1ZI7a">
    <property role="EcuMT" value="5082547973225636298" />
    <property role="3GE5qa" value="transforms" />
    <property role="TrG5h" value="Crop" />
    <property role="34LRSv" value="crop" />
    <ref role="1TJDcQ" node="1tFQO7bz4eB" resolve="ClipOrCrop" />
  </node>
  <node concept="1TIwiD" id="4q8PBg22FYx">
    <property role="EcuMT" value="5082547973226413985" />
    <property role="TrG5h" value="Expression" />
    <property role="R5$K7" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
  </node>
  <node concept="1TIwiD" id="4q8PBg22XgW">
    <property role="EcuMT" value="5082547973226484796" />
    <property role="3GE5qa" value="images" />
    <property role="TrG5h" value="ImageReference" />
    <ref role="1TJDcQ" node="4Fmodk0Wh8P" resolve="Primitive" />
    <node concept="PrWs8" id="3v9$RrA7hQx" role="PzmwI">
      <ref role="PrY4T" node="3v9$RrA7hQq" resolve="IReference" />
    </node>
  </node>
  <node concept="1TIwiD" id="4q8PBg22YGV">
    <property role="EcuMT" value="5082547973226490683" />
    <property role="3GE5qa" value="images" />
    <property role="TrG5h" value="Variable" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="4q8PBg22YIC" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="4q8PBg24nPk">
    <property role="EcuMT" value="5082547973226855764" />
    <property role="3GE5qa" value="images" />
    <property role="TrG5h" value="TransformReference" />
    <ref role="1TJDcQ" node="1tFQO7bz1ut" resolve="PrimitiveTransform" />
    <node concept="PrWs8" id="3v9$RrA7hQz" role="PzmwI">
      <ref role="PrY4T" node="3v9$RrA7hQq" resolve="IReference" />
    </node>
  </node>
  <node concept="PlHQZ" id="3v9$RrA7hQq">
    <property role="EcuMT" value="4019906281280970138" />
    <property role="TrG5h" value="IReference" />
    <node concept="1TJgyj" id="3v9$RrA7hQv" role="1TKVEi">
      <property role="IQ2ns" value="4019906281280970143" />
      <property role="20kJfa" value="target" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="4q8PBg22YGV" resolve="Variable" />
    </node>
  </node>
  <node concept="1TIwiD" id="3v9$RrAae5I">
    <property role="EcuMT" value="4019906281281741166" />
    <property role="TrG5h" value="ImageType" />
    <property role="34LRSv" value="image" />
    <property role="3GE5qa" value="types" />
    <ref role="1TJDcQ" to="tpee:fz3vP1H" resolve="Type" />
  </node>
  <node concept="1TIwiD" id="3v9$RrAaM3T">
    <property role="EcuMT" value="4019906281281888505" />
    <property role="TrG5h" value="TransformType" />
    <property role="34LRSv" value="transform" />
    <property role="3GE5qa" value="types" />
    <ref role="1TJDcQ" to="tpee:fz3vP1H" resolve="Type" />
  </node>
  <node concept="Az7Fb" id="3v9$RrAbC4H">
    <property role="3F6X1D" value="4019906281282109741" />
    <property role="TrG5h" value="HexColorString" />
    <property role="FLfZY" value="#([0-9a-f]{6}|[0-9a-f]{3})" />
  </node>
  <node concept="1TIwiD" id="3v9$RrAbC4I">
    <property role="EcuMT" value="4019906281282109742" />
    <property role="TrG5h" value="HexColor" />
    <ref role="1TJDcQ" node="3v9$RrAbTia" resolve="BaseColor" />
    <node concept="1TJgyi" id="3v9$RrAbC4J" role="1TKVEl">
      <property role="IQ2nx" value="4019906281282109743" />
      <property role="TrG5h" value="color" />
      <ref role="AX2Wp" node="3v9$RrAbC4H" resolve="HexColorString" />
    </node>
  </node>
  <node concept="1TIwiD" id="3v9$RrAbTia">
    <property role="EcuMT" value="4019906281282180234" />
    <property role="TrG5h" value="BaseColor" />
    <property role="R5$K7" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
  </node>
</model>

