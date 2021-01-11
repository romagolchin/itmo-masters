<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:61b3147b-bba9-4ff1-85f1-a1b7edd1bac4(imagelang.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="14" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="i5hu" ref="r:b3782452-bf10-4ef1-8aaf-fef26baa6603(imagelang.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="62hf" ref="r:19b55077-23c6-4e27-8af1-519aa82747d9(imagelang.behavior)" implicit="true" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi" />
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
      </concept>
      <concept id="1106270549637" name="jetbrains.mps.lang.editor.structure.CellLayout_Horizontal" flags="nn" index="2iRfu4" />
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1237303669825" name="jetbrains.mps.lang.editor.structure.CellLayout_Indent" flags="nn" index="l2Vlx" />
      <concept id="1237307900041" name="jetbrains.mps.lang.editor.structure.IndentLayoutIndentStyleClassItem" flags="ln" index="lj46D" />
      <concept id="1237308012275" name="jetbrains.mps.lang.editor.structure.IndentLayoutNewLineStyleClassItem" flags="ln" index="ljvvj" />
      <concept id="1237375020029" name="jetbrains.mps.lang.editor.structure.IndentLayoutNewLineChildrenStyleClassItem" flags="ln" index="pj6Ft" />
      <concept id="1142886221719" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeCondition" flags="in" index="pkWqt" />
      <concept id="1142886811589" name="jetbrains.mps.lang.editor.structure.ConceptFunctionParameter_node" flags="nn" index="pncrf" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="1078938745671" name="jetbrains.mps.lang.editor.structure.EditorComponentDeclaration" flags="ig" index="PKFIW" />
      <concept id="1078939183254" name="jetbrains.mps.lang.editor.structure.CellModel_Component" flags="sg" stub="3162947552742194261" index="PMmxH">
        <reference id="1078939183255" name="editorComponent" index="PMmxG" />
      </concept>
      <concept id="1186414536763" name="jetbrains.mps.lang.editor.structure.BooleanStyleSheetItem" flags="ln" index="VOi$J">
        <property id="1186414551515" name="flag" index="VOm3f" />
      </concept>
      <concept id="1233758997495" name="jetbrains.mps.lang.editor.structure.PunctuationLeftStyleClassItem" flags="ln" index="11L4FC" />
      <concept id="1233759184865" name="jetbrains.mps.lang.editor.structure.PunctuationRightStyleClassItem" flags="ln" index="11LMrY" />
      <concept id="1088013125922" name="jetbrains.mps.lang.editor.structure.CellModel_RefCell" flags="sg" stub="730538219795941030" index="1iCGBv">
        <child id="1088186146602" name="editorComponent" index="1sWHZn" />
      </concept>
      <concept id="1236262245656" name="jetbrains.mps.lang.editor.structure.MatchingLabelStyleClassItem" flags="ln" index="3mYdg7">
        <property id="1238091709220" name="labelName" index="1413C4" />
      </concept>
      <concept id="1088185857835" name="jetbrains.mps.lang.editor.structure.InlineEditorComponent" flags="ig" index="1sVBvm" />
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <property id="1139852716018" name="noTargetText" index="1$x2rV" />
        <property id="1140017977771" name="readOnly" index="1Intyy" />
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
      </concept>
      <concept id="1073389446423" name="jetbrains.mps.lang.editor.structure.CellModel_Collection" flags="sn" stub="3013115976261988961" index="3EZMnI">
        <child id="1106270802874" name="cellLayout" index="2iSdaV" />
        <child id="1073389446424" name="childCellModel" index="3EZMnx" />
      </concept>
      <concept id="1073389577006" name="jetbrains.mps.lang.editor.structure.CellModel_Constant" flags="sn" stub="3610246225209162225" index="3F0ifn">
        <property id="1073389577007" name="text" index="3F0ifm" />
      </concept>
      <concept id="1073389658414" name="jetbrains.mps.lang.editor.structure.CellModel_Property" flags="sg" stub="730538219796134133" index="3F0A7n" />
      <concept id="1219418625346" name="jetbrains.mps.lang.editor.structure.IStyleContainer" flags="ng" index="3F0Thp">
        <child id="1219418656006" name="styleItem" index="3F10Kt" />
      </concept>
      <concept id="1073389882823" name="jetbrains.mps.lang.editor.structure.CellModel_RefNode" flags="sg" stub="730538219795960754" index="3F1sOY" />
      <concept id="1073390211982" name="jetbrains.mps.lang.editor.structure.CellModel_RefNodeList" flags="sg" stub="2794558372793454595" index="3F2HdR" />
      <concept id="1088612959204" name="jetbrains.mps.lang.editor.structure.CellModel_Alternation" flags="sg" stub="8104358048506729361" index="1QoScp">
        <property id="1088613081987" name="vertical" index="1QpmdY" />
        <child id="1145918517974" name="alternationCondition" index="3e4ffs" />
        <child id="1088612958265" name="ifTrueCellModel" index="1QoS34" />
        <child id="1088612973955" name="ifFalseCellModel" index="1QoVPY" />
      </concept>
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
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
  <node concept="24kQdi" id="2zOT$_1s4hu">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:2zOT$_1s4hr" resolve="Square" />
    <node concept="3EZMnI" id="5aueixV1_nl" role="2wV5jI">
      <node concept="PMmxH" id="5aueixV1_oe" role="3EZMnx">
        <ref role="PMmxG" node="5aueixV1$dl" resolve="Description" />
      </node>
      <node concept="3F0ifn" id="5aueixV1_pu" role="3EZMnx">
        <property role="3F0ifm" value="of size" />
      </node>
      <node concept="3F0A7n" id="5aueixV1_qo" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:2zOT$_1s4hs" resolve="size" />
        <node concept="ljvvj" id="5aueixV1_qp" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="l2Vlx" id="5aueixV1_no" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="2zOT$_1s4og">
    <ref role="1XX52x" to="i5hu:2zOT$_1s4h0" resolve="Canvas" />
    <node concept="3EZMnI" id="2zOT$_1s4oi" role="2wV5jI">
      <node concept="3F0ifn" id="2zOT$_1s4oo" role="3EZMnx">
        <property role="3F0ifm" value="Canvas" />
      </node>
      <node concept="3F0A7n" id="2zOT$_1s4ou" role="3EZMnx">
        <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        <node concept="ljvvj" id="2zOT$_1s4ov" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F2HdR" id="24qcwCbgUlS" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:24qcwCbgR1Y" resolve="vars" />
        <node concept="2iRkQZ" id="4q8PBg27VB9" role="2czzBx" />
        <node concept="ljvvj" id="24qcwCbhpL_" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="lj46D" id="5aueixV1fWY" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="24qcwCbfUPq" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:2zOT$_1s4h6" resolve="image" />
        <node concept="ljvvj" id="24qcwCbhpG$" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="lj46D" id="5aueixV1fYc" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="l2Vlx" id="2zOT$_1s4ok" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="2zOT$_1s9Hh">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:2zOT$_1s4hf" resolve="Circle" />
    <node concept="3EZMnI" id="5aueixV1$aI" role="2wV5jI">
      <node concept="PMmxH" id="5aueixV1_d_" role="3EZMnx">
        <ref role="PMmxG" node="5aueixV1$dl" resolve="Description" />
      </node>
      <node concept="3F0ifn" id="5aueixV1_e3" role="3EZMnx">
        <property role="3F0ifm" value="of radius" />
      </node>
      <node concept="3F0A7n" id="5aueixV1_fJ" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:2zOT$_1s4hp" resolve="radius" />
      </node>
      <node concept="l2Vlx" id="5aueixV1$aL" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="2zOT$_1siTs">
    <ref role="1XX52x" to="i5hu:2zOT$_1siTp" resolve="Color" />
    <node concept="3EZMnI" id="2zOT$_1siTu" role="2wV5jI">
      <node concept="3F0ifn" id="2zOT$_1siT$" role="3EZMnx">
        <property role="3F0ifm" value="Color" />
      </node>
      <node concept="3F0A7n" id="2zOT$_1siTE" role="3EZMnx">
        <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
      </node>
      <node concept="l2Vlx" id="2zOT$_1siTw" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="2zOT$_1sucb">
    <ref role="1XX52x" to="i5hu:2zOT$_1suc8" resolve="ColorReference" />
    <node concept="1iCGBv" id="2zOT$_1sucn" role="2wV5jI">
      <ref role="1NtTu8" to="i5hu:2zOT$_1suc9" resolve="target" />
      <node concept="1sVBvm" id="2zOT$_1sucp" role="1sWHZn">
        <node concept="3F0A7n" id="2zOT$_1sucw" role="2wV5jI">
          <property role="1Intyy" value="true" />
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
      </node>
    </node>
  </node>
  <node concept="PKFIW" id="2zOT$_1s$5t">
    <property role="TrG5h" value="ShapeColor" />
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:2zOT$_1s4h8" resolve="FillableShape" />
    <node concept="3EZMnI" id="2zOT$_1s$5v" role="2wV5jI">
      <node concept="3F0ifn" id="2zOT$_1s$5A" role="3EZMnx">
        <property role="3F0ifm" value="color" />
      </node>
      <node concept="3F1sOY" id="2zOT$_1s$5G" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:2zOT$_1soRR" resolve="color" />
      </node>
      <node concept="l2Vlx" id="2zOT$_1s$5y" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="5aueixV0y0Z">
    <ref role="1XX52x" to="i5hu:5aueixV0xLt" resolve="Point" />
    <node concept="3EZMnI" id="5aueixV0y1R" role="2wV5jI">
      <node concept="3F0ifn" id="5aueixV0y4C" role="3EZMnx">
        <property role="3F0ifm" value="(" />
      </node>
      <node concept="3F0A7n" id="5aueixV0y2n" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:5aueixV0xMH" resolve="x" />
      </node>
      <node concept="3F0ifn" id="5aueixV0y6E" role="3EZMnx">
        <property role="3F0ifm" value="," />
      </node>
      <node concept="l2Vlx" id="5aueixV0y1U" role="2iSdaV" />
      <node concept="3F0A7n" id="5aueixV0y3E" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:5aueixV0xNU" resolve="y" />
      </node>
      <node concept="3F0ifn" id="5aueixV0y5C" role="3EZMnx">
        <property role="3F0ifm" value=")" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="5aueixV0ycL">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:4Fmodk112zJ" resolve="Polygon" />
    <node concept="3EZMnI" id="5aueixV0ydD" role="2wV5jI">
      <node concept="PMmxH" id="5aueixV1rZH" role="3EZMnx">
        <ref role="PMmxG" node="5aueixV1$dl" resolve="Description" />
      </node>
      <node concept="3F0ifn" id="5aueixV2ZnP" role="3EZMnx">
        <property role="3F0ifm" value="of points" />
        <node concept="ljvvj" id="1w$3KkGSlS3" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F2HdR" id="5aueixV0ye$" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:5aueixV0xSD" resolve="points" />
        <node concept="pj6Ft" id="5aueixV0yeB" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="l2Vlx" id="5aueixV0yeC" role="2czzBx" />
        <node concept="ljvvj" id="1w$3KkGScVV" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="lj46D" id="1w$3KkGSuMW" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="l2Vlx" id="5aueixV0ydG" role="2iSdaV" />
    </node>
  </node>
  <node concept="PKFIW" id="5aueixV1rZz">
    <property role="TrG5h" value="ShapeFilling" />
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:2zOT$_1s4h8" resolve="FillableShape" />
    <node concept="1QoScp" id="5aueixV1rZ$" role="2wV5jI">
      <property role="1QpmdY" value="true" />
      <node concept="3F0ifn" id="5aueixV1rZ_" role="1QoS34">
        <property role="3F0ifm" value="filled" />
      </node>
      <node concept="pkWqt" id="5aueixV1rZA" role="3e4ffs">
        <node concept="3clFbS" id="5aueixV1rZB" role="2VODD2">
          <node concept="3clFbF" id="5aueixV1rZC" role="3cqZAp">
            <node concept="2OqwBi" id="5aueixV1rZD" role="3clFbG">
              <node concept="pncrf" id="5aueixV1rZE" role="2Oq$k0" />
              <node concept="2qgKlT" id="1tFQO7bJZY$" role="2OqNvi">
                <ref role="37wK5l" to="62hf:1tFQO7bErnw" resolve="isFilled" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3F0ifn" id="5aueixV1rZG" role="1QoVPY">
        <property role="3F0ifm" value="empty" />
      </node>
    </node>
  </node>
  <node concept="PKFIW" id="5aueixV1$dl">
    <property role="3GE5qa" value="images" />
    <property role="TrG5h" value="Description" />
    <ref role="1XX52x" to="i5hu:2zOT$_1s4h8" resolve="FillableShape" />
    <node concept="3EZMnI" id="5aueixV1_2D" role="2wV5jI">
      <node concept="3F1sOY" id="1tFQO7bFPb5" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bB5dL" resolve="filling" />
      </node>
      <node concept="3F1sOY" id="5aueixV1_2L" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:2zOT$_1soRR" resolve="color" />
      </node>
      <node concept="PMmxH" id="5aueixV1_2M" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      </node>
      <node concept="l2Vlx" id="5aueixV1_2G" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="5aueixV24jo">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:4Fmodk112E5" resolve="Ellipse" />
    <node concept="3EZMnI" id="5aueixV24kg" role="2wV5jI">
      <node concept="PMmxH" id="5aueixV24ly" role="3EZMnx">
        <ref role="PMmxG" node="5aueixV1$dl" resolve="Description" />
      </node>
      <node concept="3F0ifn" id="5aueixV24m0" role="3EZMnx">
        <property role="3F0ifm" value="of width" />
      </node>
      <node concept="3F0A7n" id="5aueixV24oD" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:4Fmodk11KFA" resolve="width" />
      </node>
      <node concept="3F0ifn" id="5aueixV24pB" role="3EZMnx">
        <property role="3F0ifm" value="and height" />
      </node>
      <node concept="3F0A7n" id="5aueixV24rp" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:4Fmodk11KFC" resolve="height" />
      </node>
      <node concept="l2Vlx" id="5aueixV24kj" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="5aueixV2d1H">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:4Fmodk112XB" resolve="FileImage" />
    <node concept="3EZMnI" id="5aueixV2d2_" role="2wV5jI">
      <node concept="3F0ifn" id="5aueixV2d3R" role="3EZMnx">
        <property role="3F0ifm" value="image from" />
      </node>
      <node concept="l2Vlx" id="5aueixV2d2C" role="2iSdaV" />
      <node concept="3F0A7n" id="5aueixV2d5_" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:4Fmodk112ZP" resolve="path" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="5aueixV2djW">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:4Fmodk0Wimi" resolve="Line" />
    <node concept="3EZMnI" id="5aueixV2dkO" role="2wV5jI">
      <node concept="3F1sOY" id="5aueixV2dme" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:2zOT$_1soRR" resolve="color" />
        <node concept="lj46D" id="5aueixV2dmf" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="ljvvj" id="5aueixV2dmg" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="5aueixV2dkV" role="3EZMnx">
        <property role="3F0ifm" value="line from" />
      </node>
      <node concept="3F1sOY" id="5aueixV2J9P" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:5aueixV2d$H" resolve="from" />
      </node>
      <node concept="3F0ifn" id="5aueixV2Jas" role="3EZMnx">
        <property role="3F0ifm" value="to" />
      </node>
      <node concept="3F1sOY" id="5aueixV2Jbu" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:5aueixV2d_U" resolve="to" />
      </node>
      <node concept="2iRfu4" id="5aueixV2dq1" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="5aueixV2Zt3">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:4Fmodk112HB" resolve="Rectangle" />
    <node concept="3EZMnI" id="5aueixV2Zv9" role="2wV5jI">
      <node concept="PMmxH" id="5aueixV2Zwr" role="3EZMnx">
        <ref role="PMmxG" node="5aueixV1$dl" resolve="Description" />
      </node>
      <node concept="3F0ifn" id="5aueixV2ZwT" role="3EZMnx">
        <property role="3F0ifm" value="of width" />
      </node>
      <node concept="3F0A7n" id="5aueixV3cHv" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:4Fmodk11KFA" resolve="width" />
      </node>
      <node concept="3F0ifn" id="5aueixV2Zy_" role="3EZMnx">
        <property role="3F0ifm" value="and height" />
      </node>
      <node concept="3F0A7n" id="5aueixV3cJL" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:4Fmodk11KFC" resolve="height" />
      </node>
      <node concept="2iRfu4" id="5aueixV2Zvc" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="5aueixV3Rrp">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:4Fmodk112ND" resolve="Star" />
    <node concept="3EZMnI" id="5aueixV3RrS" role="2wV5jI">
      <node concept="PMmxH" id="5aueixV3RsL" role="3EZMnx">
        <ref role="PMmxG" node="5aueixV1$dl" resolve="Description" />
      </node>
      <node concept="3F0ifn" id="5aueixV3Rtf" role="3EZMnx">
        <property role="3F0ifm" value="of size" />
      </node>
      <node concept="3F0A7n" id="5aueixV3Ruy" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:24qcwCbhVPa" resolve="size" />
        <node concept="ljvvj" id="5aueixV3Ruz" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="2iRfu4" id="5aueixV3Rwq" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="5aueixV3Rz$">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:4Fmodk112Sm" resolve="Triangle" />
    <node concept="3EZMnI" id="5aueixV3R$s" role="2wV5jI">
      <node concept="PMmxH" id="5aueixV3R_l" role="3EZMnx">
        <ref role="PMmxG" node="5aueixV1$dl" resolve="Description" />
      </node>
      <node concept="3F0ifn" id="5aueixV3R_N" role="3EZMnx">
        <property role="3F0ifm" value="with leg" />
      </node>
      <node concept="3F0A7n" id="5aueixV3RCh" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:24qcwCbhPIQ" resolve="leg" />
        <node concept="ljvvj" id="5aueixV3RCi" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="2iRfu4" id="5aueixV3R$v" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="1tFQO7bz1Ze">
    <property role="3GE5qa" value="transforms" />
    <ref role="1XX52x" to="i5hu:1tFQO7bz1Cj" resolve="Then" />
    <node concept="3EZMnI" id="1tFQO7bz206" role="2wV5jI">
      <node concept="3F1sOY" id="1tFQO7bz236" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bz1Re" resolve="left" />
        <node concept="lj46D" id="1tFQO7bz237" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="ljvvj" id="1tFQO7bz238" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="PMmxH" id="1tFQO7bz20A" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <node concept="ljvvj" id="1tFQO7bz20B" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="1tFQO7bz29H" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bz1TA" resolve="right" />
      </node>
      <node concept="2iRfu4" id="1tFQO7bz209" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="1tFQO7bz45u">
    <property role="3GE5qa" value="transforms" />
    <ref role="1XX52x" to="i5hu:1tFQO7bz1ut" resolve="PrimitiveTransform" />
    <node concept="3EZMnI" id="1tFQO7b_sFZ" role="2wV5jI">
      <node concept="2iRfu4" id="1tFQO7b_sG0" role="2iSdaV" />
      <node concept="PMmxH" id="1tFQO7bz45X" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <node concept="ljvvj" id="1tFQO7bz45Y" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="1tFQO7b$J6W">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:1tFQO7b$IWd" resolve="Transformed" />
    <node concept="3EZMnI" id="1tFQO7b$J7O" role="2wV5jI">
      <node concept="3F1sOY" id="1tFQO7b$J8K" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7b$J4a" resolve="transform" />
      </node>
      <node concept="3F0ifn" id="1tFQO7b$J9C" role="3EZMnx">
        <property role="3F0ifm" value="(" />
      </node>
      <node concept="3F1sOY" id="1tFQO7b$Jbk" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7b$J1p" resolve="original" />
      </node>
      <node concept="3F0ifn" id="1tFQO7b$JbR" role="3EZMnx">
        <property role="3F0ifm" value=")" />
      </node>
      <node concept="2iRfu4" id="1tFQO7b$J7R" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="1tFQO7b_ssZ">
    <property role="3GE5qa" value="transforms" />
    <ref role="1XX52x" to="i5hu:1tFQO7bz38p" resolve="Rotate" />
    <node concept="3EZMnI" id="4q8PBg1Z3xs" role="2wV5jI">
      <node concept="l2Vlx" id="4q8PBg1Z3xt" role="2iSdaV" />
      <node concept="3F0ifn" id="4q8PBg1Z3xu" role="3EZMnx">
        <property role="3F0ifm" value="rotate" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1Z3xv" role="3EZMnx">
        <property role="3F0ifm" value="(" />
        <node concept="11L4FC" id="4q8PBg1Z3xw" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3mYdg7" id="4q8PBg1Z3xx" role="3F10Kt">
          <property role="1413C4" value="body-paren" />
        </node>
        <node concept="11LMrY" id="4q8PBg1Z3xy" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="4q8PBg1Z3xz" role="3EZMnx">
        <property role="3F0ifm" value="angle" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1Z3x$" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="4q8PBg1Z3x_" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="4q8PBg1Z3xA" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bz3c0" resolve="angle" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1Z3xB" role="3EZMnx">
        <property role="3F0ifm" value="," />
        <node concept="11L4FC" id="4q8PBg1Z3xC" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="4q8PBg1Z3xD" role="3EZMnx">
        <property role="3F0ifm" value="center" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1Z3xE" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="4q8PBg1Z3xF" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="4q8PBg1Z3xG" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bzhvU" resolve="center" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1Z3xH" role="3EZMnx">
        <property role="3F0ifm" value=")" />
        <node concept="11L4FC" id="4q8PBg1Z3xI" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3mYdg7" id="4q8PBg1Z3xJ" role="3F10Kt">
          <property role="1413C4" value="body-paren" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="1tFQO7bABjM">
    <property role="3GE5qa" value="transforms" />
    <ref role="1XX52x" to="i5hu:1tFQO7bz4eB" resolve="ClipOrCrop" />
    <node concept="3EZMnI" id="4q8PBg1ZRxX" role="2wV5jI">
      <node concept="l2Vlx" id="4q8PBg1ZRxY" role="2iSdaV" />
      <node concept="PMmxH" id="4q8PBg1ZR$5" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRy0" role="3EZMnx">
        <property role="3F0ifm" value="(" />
        <node concept="11L4FC" id="4q8PBg1ZRy1" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3mYdg7" id="4q8PBg1ZRy2" role="3F10Kt">
          <property role="1413C4" value="body-paren" />
        </node>
        <node concept="11LMrY" id="4q8PBg1ZRy3" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRy4" role="3EZMnx">
        <property role="3F0ifm" value="upper left X" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRy5" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="4q8PBg1ZRy6" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="4q8PBg1ZRy7" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bz4oS" resolve="upperLeftX" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRy8" role="3EZMnx">
        <property role="3F0ifm" value="," />
        <node concept="11L4FC" id="4q8PBg1ZRy9" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRya" role="3EZMnx">
        <property role="3F0ifm" value="upper left Y" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRyb" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="4q8PBg1ZRyc" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="4q8PBg1ZRyd" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bz4rD" resolve="upperLeftY" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRye" role="3EZMnx">
        <property role="3F0ifm" value="," />
        <node concept="11L4FC" id="4q8PBg1ZRyf" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRyg" role="3EZMnx">
        <property role="3F0ifm" value="width" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRyh" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="4q8PBg1ZRyi" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="4q8PBg1ZRyj" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bz4u2" resolve="width" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRyk" role="3EZMnx">
        <property role="3F0ifm" value="," />
        <node concept="11L4FC" id="4q8PBg1ZRyl" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRym" role="3EZMnx">
        <property role="3F0ifm" value="height" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRyn" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="4q8PBg1ZRyo" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="4q8PBg1ZRyp" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bz4vh" resolve="height" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1ZRyq" role="3EZMnx">
        <property role="3F0ifm" value=")" />
        <node concept="11L4FC" id="4q8PBg1ZRyr" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3mYdg7" id="4q8PBg1ZRys" role="3F10Kt">
          <property role="1413C4" value="body-paren" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="1tFQO7bARcv">
    <property role="3GE5qa" value="operations" />
    <ref role="1XX52x" to="i5hu:24qcwCbhIa3" resolve="BinaryOperation" />
    <node concept="3EZMnI" id="1tFQO7bARcW" role="2wV5jI">
      <node concept="3F1sOY" id="1tFQO7bARdr" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:24qcwCbhIdH" resolve="left" />
      </node>
      <node concept="PMmxH" id="1tFQO7bARe5" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      </node>
      <node concept="3F1sOY" id="1tFQO7bAReD" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:24qcwCbhImw" resolve="right" />
      </node>
      <node concept="2iRfu4" id="1tFQO7bARcZ" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="1tFQO7bBBzF">
    <ref role="1XX52x" to="i5hu:1tFQO7bBBws" resolve="FillingReference" />
    <node concept="1iCGBv" id="1tFQO7bBBzT" role="2wV5jI">
      <ref role="1NtTu8" to="i5hu:1tFQO7bBByx" resolve="filling" />
      <node concept="1sVBvm" id="1tFQO7bBBzV" role="1sWHZn">
        <node concept="3F0A7n" id="1tFQO7bBB$A" role="2wV5jI">
          <property role="1Intyy" value="true" />
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="4q8PBg1YMGh">
    <property role="3GE5qa" value="transforms" />
    <ref role="1XX52x" to="i5hu:1tFQO7bz3eo" resolve="Scale" />
    <node concept="3EZMnI" id="4q8PBg1YNMY" role="2wV5jI">
      <node concept="l2Vlx" id="4q8PBg1YNMZ" role="2iSdaV" />
      <node concept="3F0ifn" id="4q8PBg1YNN0" role="3EZMnx">
        <property role="3F0ifm" value="scale" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1YNN1" role="3EZMnx">
        <property role="3F0ifm" value="(" />
        <node concept="11L4FC" id="4q8PBg1YNN2" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3mYdg7" id="4q8PBg1YNN3" role="3F10Kt">
          <property role="1413C4" value="body-paren" />
        </node>
        <node concept="11LMrY" id="4q8PBg1YNN4" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="4q8PBg1YNN5" role="3EZMnx">
        <property role="3F0ifm" value="scale X" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1YNN6" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="4q8PBg1YNN7" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="4q8PBg1YNN8" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bz3ep" resolve="scaleX" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1YNN9" role="3EZMnx">
        <property role="3F0ifm" value="," />
        <node concept="11L4FC" id="4q8PBg1YNNa" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="4q8PBg1YNNb" role="3EZMnx">
        <property role="3F0ifm" value="scale Y" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1YNNc" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="4q8PBg1YNNd" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="4q8PBg1YNNe" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bz3hZ" resolve="scaleY" />
      </node>
      <node concept="3F0ifn" id="4q8PBg1YNNr" role="3EZMnx">
        <property role="3F0ifm" value=")" />
        <node concept="11L4FC" id="4q8PBg1YNNs" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3mYdg7" id="4q8PBg1YNNt" role="3F10Kt">
          <property role="1413C4" value="body-paren" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="4q8PBg20gBu">
    <property role="3GE5qa" value="transforms" />
    <ref role="1XX52x" to="i5hu:1tFQO7bz3lW" resolve="Shear" />
    <node concept="3EZMnI" id="4q8PBg20gBS" role="2wV5jI">
      <node concept="l2Vlx" id="4q8PBg20gBT" role="2iSdaV" />
      <node concept="PMmxH" id="4q8PBg20gCS" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      </node>
      <node concept="3F0ifn" id="4q8PBg20gBV" role="3EZMnx">
        <property role="3F0ifm" value="(" />
        <node concept="11L4FC" id="4q8PBg20gBW" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3mYdg7" id="4q8PBg20gBX" role="3F10Kt">
          <property role="1413C4" value="body-paren" />
        </node>
        <node concept="11LMrY" id="4q8PBg20gBY" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="4q8PBg20gBZ" role="3EZMnx">
        <property role="3F0ifm" value="factor" />
      </node>
      <node concept="3F0ifn" id="4q8PBg20gC0" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="4q8PBg20gC1" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="4q8PBg20gC2" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bz3lX" resolve="factor" />
      </node>
      <node concept="3F0ifn" id="4q8PBg20gC3" role="3EZMnx">
        <property role="3F0ifm" value=")" />
        <node concept="11L4FC" id="4q8PBg20gC4" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3mYdg7" id="4q8PBg20gC5" role="3F10Kt">
          <property role="1413C4" value="body-paren" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="4q8PBg20yS$">
    <property role="3GE5qa" value="transforms" />
    <ref role="1XX52x" to="i5hu:1tFQO7bz2fl" resolve="Translate" />
    <node concept="3EZMnI" id="4q8PBg20yTa" role="2wV5jI">
      <node concept="l2Vlx" id="4q8PBg20yTb" role="2iSdaV" />
      <node concept="3F0ifn" id="4q8PBg20yTc" role="3EZMnx">
        <property role="3F0ifm" value="translate" />
      </node>
      <node concept="3F0ifn" id="4q8PBg20yTd" role="3EZMnx">
        <property role="3F0ifm" value="(" />
        <node concept="11L4FC" id="4q8PBg20yTe" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3mYdg7" id="4q8PBg20yTf" role="3F10Kt">
          <property role="1413C4" value="body-paren" />
        </node>
        <node concept="11LMrY" id="4q8PBg20yTg" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="4q8PBg20yTh" role="3EZMnx">
        <property role="3F0ifm" value="x" />
      </node>
      <node concept="3F0ifn" id="4q8PBg20yTi" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="4q8PBg20yTj" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="4q8PBg20yTk" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:1tFQO7bzdYK" resolve="x" />
      </node>
      <node concept="3F0ifn" id="4q8PBg20yTl" role="3EZMnx">
        <property role="3F0ifm" value="," />
        <node concept="11L4FC" id="4q8PBg20yTm" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="4q8PBg20yTn" role="3EZMnx">
        <property role="3F0ifm" value="y" />
      </node>
      <node concept="3F0ifn" id="4q8PBg20yTo" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="4q8PBg20yTp" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="4q8PBg20yTq" role="3EZMnx">
        <property role="1$x2rV" value="0.0" />
        <ref role="1NtTu8" to="i5hu:1tFQO7bzdZ$" resolve="y" />
      </node>
      <node concept="3F0ifn" id="4q8PBg20yTr" role="3EZMnx">
        <property role="3F0ifm" value=")" />
        <node concept="11L4FC" id="4q8PBg20yTs" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3mYdg7" id="4q8PBg20yTt" role="3F10Kt">
          <property role="1413C4" value="body-paren" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="4q8PBg22G61">
    <ref role="1XX52x" to="i5hu:24qcwCbfqWD" resolve="Declaration" />
    <node concept="3EZMnI" id="4q8PBg246cx" role="2wV5jI">
      <node concept="3F1sOY" id="4q8PBg246dL" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:4q8PBg22YLQ" resolve="variable" />
      </node>
      <node concept="3F0ifn" id="4q8PBg246e3" role="3EZMnx">
        <property role="3F0ifm" value="=" />
      </node>
      <node concept="3F1sOY" id="4q8PBg246eC" role="3EZMnx">
        <ref role="1NtTu8" to="i5hu:4q8PBg22G4o" resolve="value" />
      </node>
      <node concept="2iRfu4" id="4q8PBg246c$" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="4q8PBg2467V">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:4q8PBg22YGV" resolve="Variable" />
    <node concept="3EZMnI" id="4q8PBg2468x" role="2wV5jI">
      <node concept="l2Vlx" id="4q8PBg2468y" role="2iSdaV" />
      <node concept="3F0ifn" id="4q8PBg2468z" role="3EZMnx">
        <property role="3F0ifm" value="var" />
      </node>
      <node concept="3F0A7n" id="4q8PBg2468$" role="3EZMnx">
        <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="4q8PBg24G3M">
    <property role="3GE5qa" value="images" />
    <ref role="1XX52x" to="i5hu:3v9$RrA7hQq" resolve="IReference" />
    <node concept="1iCGBv" id="4q8PBg24G4c" role="2wV5jI">
      <ref role="1NtTu8" to="i5hu:3v9$RrA7hQv" resolve="target" />
      <node concept="1sVBvm" id="4q8PBg24G4e" role="1sWHZn">
        <node concept="3F0A7n" id="4q8PBg24G4x" role="2wV5jI">
          <property role="1Intyy" value="true" />
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="3v9$RrAdffl">
    <ref role="1XX52x" to="i5hu:3v9$RrAbC4I" resolve="HexColor" />
    <node concept="3F0A7n" id="3v9$RrAdfg4" role="2wV5jI">
      <ref role="1NtTu8" to="i5hu:3v9$RrAbC4J" resolve="color" />
    </node>
  </node>
</model>

