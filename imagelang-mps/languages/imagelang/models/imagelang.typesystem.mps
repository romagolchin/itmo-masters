<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:e2b4a237-91e5-43de-a551-e78b897b4289(imagelang.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="5" />
    <devkit ref="00000000-0000-4000-0000-1de82b3a4936(jetbrains.mps.devkit.aspect.typesystem)" />
  </languages>
  <imports>
    <import index="i5hu" ref="r:b3782452-bf10-4ef1-8aaf-fef26baa6603(imagelang.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1153417849900" name="jetbrains.mps.baseLanguage.structure.GreaterThanOrEqualsExpression" flags="nn" index="2d3UOw" />
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1076505808687" name="jetbrains.mps.baseLanguage.structure.WhileStatement" flags="nn" index="2$JKZl">
        <child id="1076505808688" name="condition" index="2$JKZa" />
      </concept>
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1070534370425" name="jetbrains.mps.baseLanguage.structure.IntegerType" flags="in" index="10Oyi0" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271221393" name="jetbrains.mps.baseLanguage.structure.NPENotEqualsExpression" flags="nn" index="17QLQc" />
      <concept id="1225271283259" name="jetbrains.mps.baseLanguage.structure.NPEEqualsExpression" flags="nn" index="17R0WA" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1081506773034" name="jetbrains.mps.baseLanguage.structure.LessThanExpression" flags="nn" index="3eOVzh" />
      <concept id="1081516740877" name="jetbrains.mps.baseLanguage.structure.NotExpression" flags="nn" index="3fqX7Q">
        <child id="1081516765348" name="expression" index="3fr31v" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1185788614172" name="jetbrains.mps.lang.typesystem.structure.NormalTypeClause" flags="ng" index="mw_s8">
        <child id="1185788644032" name="normalType" index="mwGJk" />
      </concept>
      <concept id="1175517767210" name="jetbrains.mps.lang.typesystem.structure.ReportErrorStatement" flags="nn" index="2MkqsV">
        <child id="1175517851849" name="errorString" index="2MkJ7o" />
      </concept>
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1195214364922" name="jetbrains.mps.lang.typesystem.structure.NonTypesystemRule" flags="ig" index="18kY7G" />
      <concept id="3937244445246642777" name="jetbrains.mps.lang.typesystem.structure.AbstractReportStatement" flags="ng" index="1urrMJ">
        <child id="3937244445246642781" name="nodeToReport" index="1urrMF" />
      </concept>
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174643105530" name="jetbrains.mps.lang.typesystem.structure.InferenceRule" flags="ig" index="1YbPZF" />
      <concept id="1174648085619" name="jetbrains.mps.lang.typesystem.structure.AbstractRule" flags="ng" index="1YuPPy">
        <child id="1174648101952" name="applicableNode" index="1YuTPh" />
      </concept>
      <concept id="1174650418652" name="jetbrains.mps.lang.typesystem.structure.ApplicableNodeReference" flags="nn" index="1YBJjd">
        <reference id="1174650432090" name="applicableNode" index="1YBMHb" />
      </concept>
      <concept id="1174657487114" name="jetbrains.mps.lang.typesystem.structure.TypeOfExpression" flags="nn" index="1Z2H0r">
        <child id="1174657509053" name="term" index="1Z2MuG" />
      </concept>
      <concept id="1174658326157" name="jetbrains.mps.lang.typesystem.structure.CreateEquationStatement" flags="nn" index="1Z5TYs" />
      <concept id="1174660718586" name="jetbrains.mps.lang.typesystem.structure.AbstractEquationStatement" flags="nn" index="1Zf1VF">
        <child id="1174660783413" name="leftExpression" index="1ZfhK$" />
        <child id="1174660783414" name="rightExpression" index="1ZfhKB" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1179168000618" name="jetbrains.mps.lang.smodel.structure.Node_GetIndexInParentOperation" flags="nn" index="2bSWHS" />
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="7453996997717780434" name="jetbrains.mps.lang.smodel.structure.Node_GetSConceptOperation" flags="nn" index="2yIwOk" />
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="1180031783296" name="jetbrains.mps.lang.smodel.structure.Concept_IsSubConceptOfOperation" flags="nn" index="2Zo12i">
        <child id="1180031783297" name="conceptArgument" index="2Zo12j" />
      </concept>
      <concept id="1139613262185" name="jetbrains.mps.lang.smodel.structure.Node_GetParentOperation" flags="nn" index="1mfA1w" />
      <concept id="1180636770613" name="jetbrains.mps.lang.smodel.structure.SNodeCreator" flags="nn" index="3zrR0B">
        <child id="1180636770616" name="createdType" index="3zrR0E" />
      </concept>
      <concept id="1172326502327" name="jetbrains.mps.lang.smodel.structure.Concept_IsExactlyOperation" flags="nn" index="3O6GUB">
        <child id="1206733650006" name="conceptArgument" index="3QVz_e" />
      </concept>
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI" />
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
      <concept id="1138056282393" name="jetbrains.mps.lang.smodel.structure.SLinkListAccess" flags="nn" index="3Tsc0h">
        <reference id="1138056546658" name="link" index="3TtcxE" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1204796164442" name="jetbrains.mps.baseLanguage.collections.structure.InternalSequenceOperation" flags="nn" index="23sCx2">
        <child id="1204796294226" name="closure" index="23t8la" />
      </concept>
      <concept id="1235566554328" name="jetbrains.mps.baseLanguage.collections.structure.AnyOperation" flags="nn" index="2HwmR7" />
      <concept id="1203518072036" name="jetbrains.mps.baseLanguage.collections.structure.SmartClosureParameterDeclaration" flags="ig" index="Rh6nW" />
      <concept id="1162935959151" name="jetbrains.mps.baseLanguage.collections.structure.GetSizeOperation" flags="nn" index="34oBXx" />
    </language>
  </registry>
  <node concept="18kY7G" id="3v9$RrA3OJR">
    <property role="TrG5h" value="check_Variable" />
    <node concept="3clFbS" id="3v9$RrA3OJS" role="18ibNy">
      <node concept="3clFbJ" id="3v9$RrA3OQN" role="3cqZAp">
        <node concept="2OqwBi" id="3v9$RrA3RyN" role="3clFbw">
          <node concept="2OqwBi" id="3v9$RrA3PHT" role="2Oq$k0">
            <node concept="1PxgMI" id="3v9$RrA3Ptu" role="2Oq$k0">
              <node concept="chp4Y" id="3v9$RrA3Pyp" role="3oSUPX">
                <ref role="cht4Q" to="i5hu:2zOT$_1s4h0" resolve="Canvas" />
              </node>
              <node concept="2OqwBi" id="3v9$RrA3Pkh" role="1m5AlR">
                <node concept="2OqwBi" id="3v9$RrA3P15" role="2Oq$k0">
                  <node concept="1YBJjd" id="3v9$RrA3ORq" role="2Oq$k0">
                    <ref role="1YBMHb" node="3v9$RrA3OOz" resolve="variable" />
                  </node>
                  <node concept="1mfA1w" id="3v9$RrA3Pac" role="2OqNvi" />
                </node>
                <node concept="1mfA1w" id="3v9$RrA3PqO" role="2OqNvi" />
              </node>
            </node>
            <node concept="3Tsc0h" id="3v9$RrA3PTQ" role="2OqNvi">
              <ref role="3TtcxE" to="i5hu:24qcwCbgR1Y" resolve="vars" />
            </node>
          </node>
          <node concept="2HwmR7" id="3v9$RrA3SUa" role="2OqNvi">
            <node concept="1bVj0M" id="3v9$RrA3SUc" role="23t8la">
              <node concept="3clFbS" id="3v9$RrA3SUd" role="1bW5cS">
                <node concept="3clFbF" id="3v9$RrA3SY9" role="3cqZAp">
                  <node concept="1Wc70l" id="3v9$RrA3VK6" role="3clFbG">
                    <node concept="17R0WA" id="3v9$RrA3UvI" role="3uHU7B">
                      <node concept="2OqwBi" id="3v9$RrA3TEj" role="3uHU7B">
                        <node concept="2OqwBi" id="3v9$RrA3TbI" role="2Oq$k0">
                          <node concept="37vLTw" id="3v9$RrA3SY8" role="2Oq$k0">
                            <ref role="3cqZAo" node="3v9$RrA3SUe" resolve="it" />
                          </node>
                          <node concept="3TrEf2" id="3v9$RrA3Tl1" role="2OqNvi">
                            <ref role="3Tt5mk" to="i5hu:4q8PBg22YLQ" resolve="variable" />
                          </node>
                        </node>
                        <node concept="3TrcHB" id="3v9$RrA3TUy" role="2OqNvi">
                          <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                        </node>
                      </node>
                      <node concept="2OqwBi" id="3v9$RrA3V3J" role="3uHU7w">
                        <node concept="1YBJjd" id="3v9$RrA3UHF" role="2Oq$k0">
                          <ref role="1YBMHb" node="3v9$RrA3OOz" resolve="variable" />
                        </node>
                        <node concept="3TrcHB" id="3v9$RrA3Vj9" role="2OqNvi">
                          <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                        </node>
                      </node>
                    </node>
                    <node concept="17QLQc" id="3v9$RrA3W8q" role="3uHU7w">
                      <node concept="2OqwBi" id="3v9$RrA3WBH" role="3uHU7B">
                        <node concept="37vLTw" id="3v9$RrA3VVC" role="2Oq$k0">
                          <ref role="3cqZAo" node="3v9$RrA3SUe" resolve="it" />
                        </node>
                        <node concept="3TrEf2" id="3v9$RrA3Xcx" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:4q8PBg22YLQ" resolve="variable" />
                        </node>
                      </node>
                      <node concept="1YBJjd" id="3v9$RrA3WlT" role="3uHU7w">
                        <ref role="1YBMHb" node="3v9$RrA3OOz" resolve="variable" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="Rh6nW" id="3v9$RrA3SUe" role="1bW2Oz">
                <property role="TrG5h" value="it" />
                <node concept="2jxLKc" id="3v9$RrA3SUf" role="1tU5fm" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="3v9$RrA3OQP" role="3clFbx">
          <node concept="2MkqsV" id="3v9$RrA3Xz7" role="3cqZAp">
            <node concept="3cpWs3" id="3v9$RrA3XUN" role="2MkJ7o">
              <node concept="2OqwBi" id="3v9$RrA3Y40" role="3uHU7w">
                <node concept="1YBJjd" id="3v9$RrA3XVw" role="2Oq$k0">
                  <ref role="1YBMHb" node="3v9$RrA3OOz" resolve="variable" />
                </node>
                <node concept="3TrcHB" id="3v9$RrA3Ym9" role="2OqNvi">
                  <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                </node>
              </node>
              <node concept="Xl_RD" id="3v9$RrA3XzI" role="3uHU7B">
                <property role="Xl_RC" value="Duplicate name " />
              </node>
            </node>
            <node concept="1YBJjd" id="3v9$RrA3Yqf" role="1urrMF">
              <ref role="1YBMHb" node="3v9$RrA3OOz" resolve="variable" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="3v9$RrA3OOz" role="1YuTPh">
      <property role="TrG5h" value="variable" />
      <ref role="1YaFvo" to="i5hu:4q8PBg22YGV" resolve="Variable" />
    </node>
  </node>
  <node concept="18kY7G" id="3v9$RrA50bX">
    <property role="TrG5h" value="check_IReference" />
    <node concept="3clFbS" id="3v9$RrA50bY" role="18ibNy">
      <node concept="3cpWs8" id="3v9$RrA4Yab" role="3cqZAp">
        <node concept="3cpWsn" id="3v9$RrA4Yac" role="3cpWs9">
          <property role="TrG5h" value="cur" />
          <node concept="3Tqbb2" id="3v9$RrA4Yaa" role="1tU5fm" />
          <node concept="1YBJjd" id="3v9$RrA50hc" role="33vP2m">
            <ref role="1YBMHb" node="3v9$RrA50c0" resolve="iReference" />
          </node>
        </node>
      </node>
      <node concept="2$JKZl" id="3v9$RrA4Y61" role="3cqZAp">
        <node concept="3clFbS" id="3v9$RrA4Y63" role="2LFqv$">
          <node concept="3clFbF" id="3v9$RrA4ZA_" role="3cqZAp">
            <node concept="37vLTI" id="3v9$RrA4ZKk" role="3clFbG">
              <node concept="2OqwBi" id="3v9$RrA4ZO3" role="37vLTx">
                <node concept="37vLTw" id="3v9$RrA4ZMd" role="2Oq$k0">
                  <ref role="3cqZAo" node="3v9$RrA4Yac" resolve="cur" />
                </node>
                <node concept="1mfA1w" id="3v9$RrA4ZVi" role="2OqNvi" />
              </node>
              <node concept="37vLTw" id="3v9$RrA4ZA$" role="37vLTJ">
                <ref role="3cqZAo" node="3v9$RrA4Yac" resolve="cur" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3fqX7Q" id="3v9$RrA4Zyk" role="2$JKZa">
          <node concept="2OqwBi" id="3v9$RrA51ax" role="3fr31v">
            <node concept="2OqwBi" id="3v9$RrA4Zym" role="2Oq$k0">
              <node concept="2OqwBi" id="3v9$RrA4Zyn" role="2Oq$k0">
                <node concept="37vLTw" id="3v9$RrA4Zyo" role="2Oq$k0">
                  <ref role="3cqZAo" node="3v9$RrA4Yac" resolve="cur" />
                </node>
                <node concept="1mfA1w" id="3v9$RrA50Kx" role="2OqNvi" />
              </node>
              <node concept="2yIwOk" id="3v9$RrA50VV" role="2OqNvi" />
            </node>
            <node concept="3O6GUB" id="3v9$RrA51nJ" role="2OqNvi">
              <node concept="chp4Y" id="3v9$RrA51r4" role="3QVz_e">
                <ref role="cht4Q" to="i5hu:2zOT$_1s4h0" resolve="Canvas" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3cpWs8" id="3v9$RrA536K" role="3cqZAp">
        <node concept="3cpWsn" id="3v9$RrA536L" role="3cpWs9">
          <property role="TrG5h" value="declarationIndex" />
          <node concept="10Oyi0" id="3v9$RrA52F5" role="1tU5fm" />
          <node concept="2OqwBi" id="3v9$RrA536M" role="33vP2m">
            <node concept="1PxgMI" id="3v9$RrA536N" role="2Oq$k0">
              <node concept="chp4Y" id="3v9$RrA536O" role="3oSUPX">
                <ref role="cht4Q" to="i5hu:24qcwCbfqWD" resolve="Declaration" />
              </node>
              <node concept="2OqwBi" id="3v9$RrA536P" role="1m5AlR">
                <node concept="2OqwBi" id="3v9$RrA536Q" role="2Oq$k0">
                  <node concept="1YBJjd" id="3v9$RrA536R" role="2Oq$k0">
                    <ref role="1YBMHb" node="3v9$RrA50c0" resolve="iReference" />
                  </node>
                  <node concept="3TrEf2" id="3v9$RrA7ilp" role="2OqNvi">
                    <ref role="3Tt5mk" to="i5hu:3v9$RrA7hQv" resolve="target" />
                  </node>
                </node>
                <node concept="1mfA1w" id="3v9$RrA536T" role="2OqNvi" />
              </node>
            </node>
            <node concept="2bSWHS" id="3v9$RrA536U" role="2OqNvi" />
          </node>
        </node>
      </node>
      <node concept="3clFbJ" id="3v9$RrA52Xi" role="3cqZAp">
        <node concept="3clFbS" id="3v9$RrA52Xk" role="3clFbx">
          <node concept="2MkqsV" id="3v9$RrA54Z1" role="3cqZAp">
            <node concept="3cpWs3" id="3v9$RrA56xt" role="2MkJ7o">
              <node concept="Xl_RD" id="3v9$RrA56zV" role="3uHU7w">
                <property role="Xl_RC" value=" is not declared" />
              </node>
              <node concept="3cpWs3" id="3v9$RrA55hA" role="3uHU7B">
                <node concept="Xl_RD" id="3v9$RrA54Zg" role="3uHU7B">
                  <property role="Xl_RC" value="Variable " />
                </node>
                <node concept="2OqwBi" id="3v9$RrA55Uy" role="3uHU7w">
                  <node concept="2OqwBi" id="3v9$RrA55vt" role="2Oq$k0">
                    <node concept="1YBJjd" id="3v9$RrA55hS" role="2Oq$k0">
                      <ref role="1YBMHb" node="3v9$RrA50c0" resolve="iReference" />
                    </node>
                    <node concept="3TrEf2" id="3v9$RrA7imZ" role="2OqNvi">
                      <ref role="3Tt5mk" to="i5hu:3v9$RrA7hQv" resolve="target" />
                    </node>
                  </node>
                  <node concept="3TrcHB" id="3v9$RrA7iwX" role="2OqNvi">
                    <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="1YBJjd" id="3v9$RrA57hd" role="1urrMF">
              <ref role="1YBMHb" node="3v9$RrA50c0" resolve="iReference" />
            </node>
          </node>
        </node>
        <node concept="1Wc70l" id="3v9$RrA6mvF" role="3clFbw">
          <node concept="3fqX7Q" id="3v9$RrA6m$R" role="3uHU7B">
            <node concept="2OqwBi" id="3v9$RrA6n6n" role="3fr31v">
              <node concept="2OqwBi" id="3v9$RrA6mGz" role="2Oq$k0">
                <node concept="37vLTw" id="3v9$RrA6m_u" role="2Oq$k0">
                  <ref role="3cqZAo" node="3v9$RrA4Yac" resolve="cur" />
                </node>
                <node concept="2yIwOk" id="3v9$RrA6mMY" role="2OqNvi" />
              </node>
              <node concept="2Zo12i" id="3v9$RrA6LUo" role="2OqNvi">
                <node concept="chp4Y" id="3v9$RrA6M2m" role="2Zo12j">
                  <ref role="cht4Q" to="i5hu:24qcwCbhIhF" resolve="Image" />
                </node>
              </node>
            </node>
          </node>
          <node concept="2d3UOw" id="3v9$RrA54gb" role="3uHU7w">
            <node concept="2OqwBi" id="3v9$RrA54F3" role="3uHU7w">
              <node concept="37vLTw" id="3v9$RrA5xUF" role="2Oq$k0">
                <ref role="3cqZAo" node="3v9$RrA4Yac" resolve="cur" />
              </node>
              <node concept="2bSWHS" id="3v9$RrA54Xe" role="2OqNvi" />
            </node>
            <node concept="37vLTw" id="3v9$RrA53rw" role="3uHU7B">
              <ref role="3cqZAo" node="3v9$RrA536L" resolve="declarationIndex" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="3v9$RrA50c0" role="1YuTPh">
      <property role="TrG5h" value="iReference" />
      <ref role="1YaFvo" to="i5hu:3v9$RrA7hQq" resolve="IReference" />
    </node>
  </node>
  <node concept="1YbPZF" id="3v9$RrAal89">
    <property role="TrG5h" value="typeof_Declaration" />
    <node concept="3clFbS" id="3v9$RrAal8a" role="18ibNy">
      <node concept="1Z5TYs" id="3v9$RrAbdUw" role="3cqZAp">
        <node concept="mw_s8" id="3v9$RrAbdUy" role="1ZfhK$">
          <node concept="1Z2H0r" id="3v9$RrAbdUz" role="mwGJk">
            <node concept="2OqwBi" id="3v9$RrAbdU$" role="1Z2MuG">
              <node concept="1YBJjd" id="3v9$RrAbdU_" role="2Oq$k0">
                <ref role="1YBMHb" node="3v9$RrAale6" resolve="declaration" />
              </node>
              <node concept="3TrEf2" id="3v9$RrAbdUA" role="2OqNvi">
                <ref role="3Tt5mk" to="i5hu:4q8PBg22YLQ" resolve="variable" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="3v9$RrAbdVo" role="1ZfhKB">
          <node concept="1Z2H0r" id="3v9$RrAbdVk" role="mwGJk">
            <node concept="2OqwBi" id="3v9$RrAbe3h" role="1Z2MuG">
              <node concept="1YBJjd" id="3v9$RrAbdVG" role="2Oq$k0">
                <ref role="1YBMHb" node="3v9$RrAale6" resolve="declaration" />
              </node>
              <node concept="3TrEf2" id="3v9$RrAbec$" role="2OqNvi">
                <ref role="3Tt5mk" to="i5hu:4q8PBg22G4o" resolve="value" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="3v9$RrAale6" role="1YuTPh">
      <property role="TrG5h" value="declaration" />
      <ref role="1YaFvo" to="i5hu:24qcwCbfqWD" resolve="Declaration" />
    </node>
  </node>
  <node concept="1YbPZF" id="3v9$RrAalIi">
    <property role="TrG5h" value="typeof_Image" />
    <node concept="3clFbS" id="3v9$RrAalIj" role="18ibNy">
      <node concept="1Z5TYs" id="3v9$RrAalVc" role="3cqZAp">
        <node concept="mw_s8" id="3v9$RrAalW3" role="1ZfhKB">
          <node concept="2ShNRf" id="3v9$RrAalVZ" role="mwGJk">
            <node concept="3zrR0B" id="3v9$RrAam34" role="2ShVmc">
              <node concept="3Tqbb2" id="3v9$RrAam36" role="3zrR0E">
                <ref role="ehGHo" to="i5hu:3v9$RrAae5I" resolve="ImageType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="3v9$RrAalVf" role="1ZfhK$">
          <node concept="1Z2H0r" id="3v9$RrAalOp" role="mwGJk">
            <node concept="1YBJjd" id="3v9$RrAalQF" role="1Z2MuG">
              <ref role="1YBMHb" node="3v9$RrAalNp" resolve="image" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="3v9$RrAalNp" role="1YuTPh">
      <property role="TrG5h" value="image" />
      <ref role="1YaFvo" to="i5hu:24qcwCbhIhF" resolve="Image" />
    </node>
  </node>
  <node concept="1YbPZF" id="3v9$RrAaM3U">
    <property role="TrG5h" value="typeof_Transform" />
    <node concept="3clFbS" id="3v9$RrAaM3V" role="18ibNy">
      <node concept="1Z5TYs" id="3v9$RrAaM3W" role="3cqZAp">
        <node concept="mw_s8" id="3v9$RrAaM3X" role="1ZfhKB">
          <node concept="2ShNRf" id="3v9$RrAaM3Y" role="mwGJk">
            <node concept="3zrR0B" id="3v9$RrAaM3Z" role="2ShVmc">
              <node concept="3Tqbb2" id="3v9$RrAaM40" role="3zrR0E">
                <ref role="ehGHo" to="i5hu:3v9$RrAaM3T" resolve="TransformType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="3v9$RrAaM41" role="1ZfhK$">
          <node concept="1Z2H0r" id="3v9$RrAaM42" role="mwGJk">
            <node concept="1YBJjd" id="3v9$RrAaM43" role="1Z2MuG">
              <ref role="1YBMHb" node="3v9$RrAaM44" resolve="transform" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="3v9$RrAaM44" role="1YuTPh">
      <property role="TrG5h" value="transform" />
      <ref role="1YaFvo" to="i5hu:1tFQO7bz1nk" resolve="Transform" />
    </node>
  </node>
  <node concept="1YbPZF" id="3v9$RrAaUm3">
    <property role="TrG5h" value="typeof_IReference" />
    <node concept="3clFbS" id="3v9$RrAaUm4" role="18ibNy">
      <node concept="1Z5TYs" id="3v9$RrAaUm5" role="3cqZAp">
        <node concept="mw_s8" id="3v9$RrAaUm6" role="1ZfhK$">
          <node concept="1Z2H0r" id="3v9$RrAaUm7" role="mwGJk">
            <node concept="1YBJjd" id="3v9$RrAaUm8" role="1Z2MuG">
              <ref role="1YBMHb" node="3v9$RrAaUme" resolve="iReference" />
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="3v9$RrAaUm9" role="1ZfhKB">
          <node concept="1Z2H0r" id="3v9$RrAaUma" role="mwGJk">
            <node concept="2OqwBi" id="3v9$RrAaUmb" role="1Z2MuG">
              <node concept="1YBJjd" id="3v9$RrAaUmc" role="2Oq$k0">
                <ref role="1YBMHb" node="3v9$RrAaUme" resolve="iReference" />
              </node>
              <node concept="3TrEf2" id="3v9$RrAaUmd" role="2OqNvi">
                <ref role="3Tt5mk" to="i5hu:3v9$RrA7hQv" resolve="target" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="3v9$RrAaUme" role="1YuTPh">
      <property role="TrG5h" value="iReference" />
      <ref role="1YaFvo" to="i5hu:3v9$RrA7hQq" resolve="IReference" />
    </node>
  </node>
  <node concept="18kY7G" id="3v9$RrAeu6w">
    <property role="TrG5h" value="check_Polygon" />
    <node concept="3clFbS" id="3v9$RrAeu6x" role="18ibNy">
      <node concept="3clFbJ" id="3v9$RrAeudO" role="3cqZAp">
        <node concept="1Wc70l" id="3v9$RrAfrU2" role="3clFbw">
          <node concept="2OqwBi" id="3v9$RrAfsRl" role="3uHU7B">
            <node concept="2OqwBi" id="3v9$RrAfshr" role="2Oq$k0">
              <node concept="1YBJjd" id="3v9$RrAfrWs" role="2Oq$k0">
                <ref role="1YBMHb" node="3v9$RrAeu7a" resolve="polygon" />
              </node>
              <node concept="2yIwOk" id="3v9$RrAfsxy" role="2OqNvi" />
            </node>
            <node concept="3O6GUB" id="3v9$RrAftdn" role="2OqNvi">
              <node concept="chp4Y" id="3v9$RrAftyZ" role="3QVz_e">
                <ref role="cht4Q" to="i5hu:4Fmodk112zJ" resolve="Polygon" />
              </node>
            </node>
          </node>
          <node concept="3eOVzh" id="3v9$RrAezms" role="3uHU7w">
            <node concept="3cmrfG" id="3v9$RrAezqb" role="3uHU7w">
              <property role="3cmrfH" value="3" />
            </node>
            <node concept="2OqwBi" id="3v9$RrAewh8" role="3uHU7B">
              <node concept="2OqwBi" id="3v9$RrAeurM" role="2Oq$k0">
                <node concept="1YBJjd" id="3v9$RrAeueZ" role="2Oq$k0">
                  <ref role="1YBMHb" node="3v9$RrAeu7a" resolve="polygon" />
                </node>
                <node concept="3Tsc0h" id="3v9$RrAeuEX" role="2OqNvi">
                  <ref role="3TtcxE" to="i5hu:5aueixV0xSD" resolve="points" />
                </node>
              </node>
              <node concept="34oBXx" id="3v9$RrAexGh" role="2OqNvi" />
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="3v9$RrAeudQ" role="3clFbx">
          <node concept="2MkqsV" id="3v9$RrAezsv" role="3cqZAp">
            <node concept="Xl_RD" id="3v9$RrAezt6" role="2MkJ7o">
              <property role="Xl_RC" value="At least 3 points required" />
            </node>
            <node concept="1YBJjd" id="3v9$RrAez_M" role="1urrMF">
              <ref role="1YBMHb" node="3v9$RrAeu7a" resolve="polygon" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="3v9$RrAeu7a" role="1YuTPh">
      <property role="TrG5h" value="polygon" />
      <ref role="1YaFvo" to="i5hu:4Fmodk112zJ" resolve="Polygon" />
    </node>
  </node>
</model>

