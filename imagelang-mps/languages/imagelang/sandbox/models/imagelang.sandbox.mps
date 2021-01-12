<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:e49b2e19-8dd7-4e15-a317-88b52c044dd5(imagelang.sandbox)">
  <persistence version="9" />
  <languages>
    <use id="ca96008f-2b55-4aca-9023-4df1ac5ab710" name="imagelang" version="0" />
  </languages>
  <imports>
    <import index="hqo1" ref="r:c072ea82-cc35-4066-8f59-164ee75d96eb(imagelang.Fillings)" implicit="true" />
    <import index="ll63" ref="r:bb877c4f-793b-440e-aa99-f2f3caff11d9(imagelang.Colors)" implicit="true" />
  </imports>
  <registry>
    <language id="ca96008f-2b55-4aca-9023-4df1ac5ab710" name="imagelang">
      <concept id="5953258603455585373" name="imagelang.structure.Point" flags="ng" index="DB2lP">
        <property id="5953258603455585453" name="x" index="DB2m5" />
        <property id="5953258603455585530" name="y" index="DB2ni" />
      </concept>
      <concept id="2385273971365752617" name="imagelang.structure.Declaration" flags="ng" index="E9TOz">
        <child id="5082547973226414360" name="value" index="14wxtG" />
        <child id="5082547973226490998" name="variable" index="14wNC2" />
      </concept>
      <concept id="2385273971366355587" name="imagelang.structure.BinaryOperation" flags="ng" index="End29">
        <child id="2385273971366355821" name="left" index="End5B" />
        <child id="2385273971366356384" name="right" index="EnduE" />
      </concept>
      <concept id="2385273971366356866" name="imagelang.structure.Besides" flags="ng" index="Endm8" />
      <concept id="8471406857380337063" name="imagelang.structure.Reference" flags="ng" index="OpIS0">
        <reference id="8471406857380337157" name="target" index="OpIQy" />
      </concept>
      <concept id="1739531870974198255" name="imagelang.structure.Shape" flags="ng" index="OLOVE">
        <child id="2951236858139479543" name="color" index="1DxmIY" />
      </concept>
      <concept id="5082547973226490683" name="imagelang.structure.Variable" flags="ng" index="14wNPf">
        <child id="237156544796738488" name="type" index="3Vz$WA" />
      </concept>
      <concept id="5392604071784098031" name="imagelang.structure.Polygon" flags="ng" index="1bO$wU">
        <child id="5953258603455585833" name="points" index="DB2s1" />
      </concept>
      <concept id="5392604071784099049" name="imagelang.structure.Star" flags="ng" index="1bO$KW">
        <property id="2385273971366411594" name="size" index="EnoX0" />
      </concept>
      <concept id="5392604071784099350" name="imagelang.structure.Triangle" flags="ng" index="1bO$V3">
        <property id="2385273971366386614" name="leg" index="EnmAW" />
      </concept>
      <concept id="5392604071784099687" name="imagelang.structure.FileImage" flags="ng" index="1bO$YM">
        <property id="5392604071784099829" name="path" index="1bO$Ww" />
      </concept>
      <concept id="4019906281281741166" name="imagelang.structure.ImageType" flags="ig" index="3hSn8o" />
      <concept id="4019906281281888505" name="imagelang.structure.TransformType" flags="ig" index="3hSFef" />
      <concept id="4019906281282109742" name="imagelang.structure.HexColor" flags="ng" index="3hTL9o">
        <property id="4019906281282109743" name="color" index="3hTL9p" />
      </concept>
      <concept id="1687683561014834550" name="imagelang.structure.ShearX" flags="ng" index="3sTuSR" />
      <concept id="1687683561014707111" name="imagelang.structure.ClipOrCrop" flags="ng" index="3sTTzA">
        <property id="1687683561014708177" name="height" index="3sTTMg" />
        <property id="1687683561014708098" name="width" index="3sTTN3" />
        <property id="1687683561014707768" name="upperLeftX" index="3sTTPT" />
        <property id="1687683561014707945" name="upperLeftY" index="3sTTQC" />
      </concept>
      <concept id="1687683561014703000" name="imagelang.structure.Scale" flags="ng" index="3sTYzp">
        <property id="1687683561014703001" name="scaleX" index="3sTYzo" />
        <property id="1687683561014703231" name="scaleY" index="3sTYWY" />
      </concept>
      <concept id="1687683561014703484" name="imagelang.structure.Shear" flags="ng" index="3sTYSX">
        <property id="1687683561014703485" name="factor" index="3sTYSW" />
      </concept>
      <concept id="1687683561014698965" name="imagelang.structure.Translate" flags="ng" index="3sTZyk">
        <property id="1687683561014747108" name="y" index="3sTKi_" />
        <property id="1687683561014747056" name="x" index="3sTKjL" />
      </concept>
      <concept id="1687683561015900188" name="imagelang.structure.FillingReference" flags="ng" index="3sXqdt">
        <reference id="1687683561015900321" name="filling" index="3sXqfw" />
      </concept>
      <concept id="1687683561015144205" name="imagelang.structure.Transformed" flags="ng" index="3sYjhc">
        <child id="1687683561015144714" name="transform" index="3sYiDb" />
        <child id="1687683561015144537" name="original" index="3sYiGo" />
      </concept>
      <concept id="1687683561015430186" name="imagelang.structure.Bbox" flags="ng" index="3sZ9tF" />
      <concept id="2951236858139395144" name="imagelang.structure.FillableShape" flags="ng" index="1Dxa81">
        <child id="1687683561015759729" name="filling" index="3sXSwK" />
      </concept>
      <concept id="2951236858139395151" name="imagelang.structure.Circle" flags="ng" index="1Dxa86">
        <property id="2951236858139395161" name="radius" index="1Dxa8g" />
      </concept>
      <concept id="2951236858139395136" name="imagelang.structure.Canvas" flags="ng" index="1Dxa89">
        <child id="2385273971366129790" name="vars" index="Emk9O" />
        <child id="2951236858139395142" name="image" index="1Dxa8f" />
      </concept>
      <concept id="2951236858139395163" name="imagelang.structure.Square" flags="ng" index="1Dxa8i">
        <property id="2951236858139395164" name="size" index="1Dxa8l" />
      </concept>
      <concept id="2951236858139501320" name="imagelang.structure.ColorReference" flags="ng" index="1Dxgl1">
        <reference id="2951236858139501321" name="target" index="1Dxgl0" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1Dxa89" id="2zOT$_1s77G">
    <property role="TrG5h" value="MyDrawing" />
    <node concept="1bO$V3" id="4q8PBg1YoBB" role="1Dxa8f">
      <property role="EnmAW" value="300.0" />
      <node concept="DB2lP" id="4q8PBg1YoBG" role="DB2s1" />
      <node concept="3sXqdt" id="4q8PBg1YJkk" role="3sXSwK">
        <ref role="3sXqfw" to="hqo1:1tFQO7bB58_" resolve="filled" />
      </node>
      <node concept="3hTL9o" id="3v9$RrAdwr8" role="1DxmIY">
        <property role="3hTL9p" value="#0ff" />
      </node>
    </node>
  </node>
  <node concept="1Dxa89" id="4Fmodk11dV2">
    <property role="TrG5h" value="Penguin" />
    <node concept="E9TOz" id="daz9VSMkjz" role="Emk9O">
      <node concept="14wNPf" id="daz9VSMkj$" role="14wNC2">
        <property role="TrG5h" value="t" />
        <node concept="3hSFef" id="daz9VSN1eh" role="3Vz$WA" />
      </node>
      <node concept="3sZ9tF" id="daz9VSO8hX" role="14wxtG" />
    </node>
    <node concept="E9TOz" id="4q8PBg27SL0" role="Emk9O">
      <node concept="14wNPf" id="4q8PBg27SL1" role="14wNC2">
        <property role="TrG5h" value="penguin" />
        <node concept="3hSn8o" id="daz9VSN1fy" role="3Vz$WA" />
      </node>
      <node concept="1bO$YM" id="4Fmodk11tAC" role="14wxtG">
        <property role="1bO$Ww" value="../imagelang/penguin.jpg" />
      </node>
    </node>
    <node concept="E9TOz" id="4q8PBg28g8h" role="Emk9O">
      <node concept="14wNPf" id="4q8PBg28g8i" role="14wNC2">
        <property role="TrG5h" value="penguin1" />
        <node concept="3hSn8o" id="daz9VSN1gd" role="3Vz$WA" />
      </node>
      <node concept="OpIS0" id="7mguUt205IZ" role="14wxtG">
        <ref role="OpIQy" node="4q8PBg27SL1" resolve="penguin" />
      </node>
    </node>
    <node concept="E9TOz" id="4q8PBg2dqVm" role="Emk9O">
      <node concept="14wNPf" id="4q8PBg2dqVn" role="14wNC2">
        <property role="TrG5h" value="twoPenguins" />
        <node concept="3hSn8o" id="daz9VSN1gs" role="3Vz$WA" />
      </node>
      <node concept="Endm8" id="4q8PBg2dqVB" role="14wxtG">
        <node concept="OpIS0" id="7mguUt1ZuHX" role="End5B">
          <ref role="OpIQy" node="4q8PBg27SL1" resolve="penguin" />
        </node>
        <node concept="OpIS0" id="7mguUt1ZuJ$" role="EnduE">
          <ref role="OpIQy" node="4q8PBg27SL1" resolve="penguin" />
        </node>
      </node>
    </node>
    <node concept="E9TOz" id="4q8PBg27SUJ" role="Emk9O">
      <node concept="14wNPf" id="4q8PBg27SUK" role="14wNC2">
        <property role="TrG5h" value="transformed" />
        <node concept="3hSn8o" id="daz9VSN1gK" role="3Vz$WA" />
      </node>
      <node concept="3sYjhc" id="4q8PBg27TBd" role="14wxtG">
        <node concept="3sTTzA" id="1tFQO7bAQvE" role="3sYiDb">
          <property role="3sTTPT" value="300.0" />
          <property role="3sTTQC" value="300.0" />
          <property role="3sTTN3" value="100.0" />
          <property role="3sTTMg" value="100.0" />
        </node>
        <node concept="OpIS0" id="7mguUt20oBQ" role="3sYiGo">
          <ref role="OpIQy" node="4q8PBg27SL1" resolve="penguin" />
        </node>
      </node>
    </node>
    <node concept="E9TOz" id="4q8PBg2fDCi" role="Emk9O">
      <node concept="14wNPf" id="4q8PBg2fDCj" role="14wNC2">
        <property role="TrG5h" value="transform" />
        <node concept="3hSFef" id="daz9VSNzPL" role="3Vz$WA" />
      </node>
      <node concept="OpIS0" id="7mguUt20oy1" role="14wxtG">
        <ref role="OpIQy" node="daz9VSMkj$" resolve="t" />
      </node>
    </node>
    <node concept="Endm8" id="7mguUt22n8r" role="1Dxa8f">
      <node concept="3sYjhc" id="7mguUt22n$k" role="End5B">
        <node concept="3sTYzp" id="7mguUt22n_m" role="3sYiDb">
          <property role="3sTYzo" value="0.5" />
          <property role="3sTYWY" value="0.5" />
        </node>
        <node concept="OpIS0" id="7mguUt22nC4" role="3sYiGo">
          <ref role="OpIQy" node="4q8PBg2dqVn" resolve="twoPenguins" />
        </node>
      </node>
      <node concept="OpIS0" id="7mguUt22naj" role="EnduE">
        <ref role="OpIQy" node="4q8PBg27SUK" resolve="transformed" />
      </node>
    </node>
  </node>
  <node concept="1Dxa89" id="4Fmodk123nN">
    <property role="TrG5h" value="Ellipse" />
    <node concept="3sYjhc" id="4q8PBg20g$H" role="1Dxa8f">
      <node concept="3sTZyk" id="4q8PBg22ijS" role="3sYiDb">
        <property role="3sTKjL" value="100.0" />
        <property role="3sTKi_" value="100.0" />
      </node>
      <node concept="1bO$KW" id="4q8PBg27SGe" role="3sYiGo">
        <property role="EnoX0" value="100.0" />
        <node concept="DB2lP" id="4q8PBg27SGg" role="DB2s1" />
        <node concept="3sXqdt" id="4q8PBg27SH1" role="3sXSwK">
          <ref role="3sXqfw" to="hqo1:1tFQO7bB59I" resolve="empty" />
        </node>
        <node concept="1Dxgl1" id="4q8PBg27SHF" role="1DxmIY">
          <ref role="1Dxgl0" to="ll63:2zOT$_1sowP" resolve="blue" />
        </node>
      </node>
    </node>
  </node>
  <node concept="1Dxa89" id="24qcwCbgUhY">
    <property role="TrG5h" value="Polygon" />
    <node concept="1bO$wU" id="4q8PBg1Yluo" role="1Dxa8f">
      <node concept="DB2lP" id="5aueixV0CK3" role="DB2s1">
        <property role="DB2m5" value="0.0" />
        <property role="DB2ni" value="0.0" />
      </node>
      <node concept="DB2lP" id="5aueixV0CPi" role="DB2s1">
        <property role="DB2m5" value="100.0" />
        <property role="DB2ni" value="100.0" />
      </node>
      <node concept="DB2lP" id="5aueixV0CQw" role="DB2s1">
        <property role="DB2m5" value="200.0" />
        <property role="DB2ni" value="100.0" />
      </node>
      <node concept="DB2lP" id="5aueixV0CRm" role="DB2s1">
        <property role="DB2m5" value="300.0" />
        <property role="DB2ni" value="0.0" />
      </node>
      <node concept="3sXqdt" id="4q8PBg1YluK" role="3sXSwK">
        <ref role="3sXqfw" to="hqo1:1tFQO7bB58_" resolve="filled" />
      </node>
      <node concept="1Dxgl1" id="4q8PBg1YluZ" role="1DxmIY">
        <ref role="1Dxgl0" to="ll63:2zOT$_1sowP" resolve="blue" />
      </node>
    </node>
  </node>
  <node concept="1Dxa89" id="3v9$RrAh4f2">
    <property role="TrG5h" value="Example" />
    <node concept="E9TOz" id="3v9$RrAhbvb" role="Emk9O">
      <node concept="14wNPf" id="3v9$RrAhbvc" role="14wNC2">
        <property role="TrG5h" value="parallelogram" />
        <node concept="3hSn8o" id="daz9VSO8mK" role="3Vz$WA" />
      </node>
      <node concept="3sYjhc" id="3v9$RrAh4op" role="14wxtG">
        <node concept="3sTuSR" id="3v9$RrAh4px" role="3sYiDb">
          <property role="3sTYSW" value="2.0" />
        </node>
        <node concept="1Dxa8i" id="3v9$RrAh4rI" role="3sYiGo">
          <property role="1Dxa8l" value="100.0" />
          <node concept="3sXqdt" id="3v9$RrAh4s$" role="3sXSwK">
            <ref role="3sXqfw" to="hqo1:1tFQO7bB58_" resolve="filled" />
          </node>
          <node concept="1Dxgl1" id="3v9$RrAh55U" role="1DxmIY">
            <ref role="1Dxgl0" to="ll63:2zOT$_1sowP" resolve="blue" />
          </node>
        </node>
      </node>
    </node>
    <node concept="E9TOz" id="3v9$RrAhoJM" role="Emk9O">
      <node concept="14wNPf" id="3v9$RrAhoJN" role="14wNC2">
        <property role="TrG5h" value="scale" />
        <node concept="3hSFef" id="daz9VSO8n4" role="3Vz$WA" />
      </node>
      <node concept="3sTYzp" id="daz9VSO8_x" role="14wxtG">
        <property role="3sTYzo" value="0.0" />
        <property role="3sTYWY" value="0.0" />
      </node>
    </node>
    <node concept="E9TOz" id="3v9$RrAhbEh" role="Emk9O">
      <node concept="14wNPf" id="3v9$RrAhbEi" role="14wNC2">
        <property role="TrG5h" value="ellipse" />
        <node concept="3hSn8o" id="daz9VSO8n$" role="3Vz$WA" />
      </node>
      <node concept="3sYjhc" id="3v9$RrAh4v$" role="14wxtG">
        <node concept="OpIS0" id="7mguUt20oMD" role="3sYiDb">
          <ref role="OpIQy" node="3v9$RrAhoJN" resolve="scale" />
        </node>
        <node concept="1Dxa86" id="3v9$RrAh4zz" role="3sYiGo">
          <property role="1Dxa8g" value="50.0" />
          <node concept="3sXqdt" id="3v9$RrAh4$p" role="3sXSwK">
            <ref role="3sXqfw" to="hqo1:1tFQO7bB59I" resolve="empty" />
          </node>
          <node concept="1Dxgl1" id="3v9$RrAh4_u" role="1DxmIY">
            <ref role="1Dxgl0" to="ll63:2zOT$_1sowQ" resolve="red" />
          </node>
        </node>
      </node>
    </node>
    <node concept="Endm8" id="3v9$RrAh4lC" role="1Dxa8f">
      <node concept="OpIS0" id="7mguUt20oNK" role="End5B">
        <ref role="OpIQy" node="3v9$RrAhbvc" resolve="parallelogram" />
      </node>
      <node concept="OpIS0" id="7mguUt20oOF" role="EnduE">
        <ref role="OpIQy" node="3v9$RrAhbEi" resolve="ellipse" />
      </node>
    </node>
  </node>
</model>

