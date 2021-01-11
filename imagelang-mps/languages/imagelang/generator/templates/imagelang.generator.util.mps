<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:1b898324-867b-40bd-88ea-4fba393a2cd1(imagelang.generator.util)">
  <persistence version="9" />
  <languages>
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="11" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="17" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="1" />
    <use id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures" version="0" />
    <use id="b401a680-8325-4110-8fd3-84331ff25bef" name="jetbrains.mps.lang.generator" version="3" />
    <devkit ref="a2eb3a43-fcc2-4200-80dc-c60110c4862d(jetbrains.mps.devkit.templates)" />
  </languages>
  <imports>
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="i5hu" ref="r:b3782452-bf10-4ef1-8aaf-fef26baa6603(imagelang.structure)" />
    <import index="z60i" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.awt(JDK/)" />
    <import index="tpek" ref="r:00000000-0000-4000-0000-011c895902c0(jetbrains.mps.baseLanguage.behavior)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="mhbf" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.model(MPS.OpenAPI/)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1465982738277781862" name="jetbrains.mps.baseLanguage.structure.PlaceholderMember" flags="nn" index="2tJIrI" />
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1081236700938" name="jetbrains.mps.baseLanguage.structure.StaticMethodDeclaration" flags="ig" index="2YIFZL" />
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070534370425" name="jetbrains.mps.baseLanguage.structure.IntegerType" flags="in" index="10Oyi0" />
      <concept id="1070534555686" name="jetbrains.mps.baseLanguage.structure.CharType" flags="in" index="10Pfzv" />
      <concept id="1070534644030" name="jetbrains.mps.baseLanguage.structure.BooleanType" flags="in" index="10P_77" />
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="1225271283259" name="jetbrains.mps.baseLanguage.structure.NPEEqualsExpression" flags="nn" index="17R0WA" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <property id="4276006055363816570" name="isSynchronized" index="od$2w" />
        <property id="1181808852946" name="isFinal" index="DiZV1" />
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123152" name="jetbrains.mps.baseLanguage.structure.EqualsExpression" flags="nn" index="3clFbC" />
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
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="7812454656619025416" name="jetbrains.mps.baseLanguage.structure.MethodDeclaration" flags="ng" index="1rXfSm">
        <property id="8355037393041754995" name="isNative" index="2aFKle" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ng" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="446c26eb-2b7b-4bf0-9b35-f83fa582753e" name="jetbrains.mps.lang.modelapi">
      <concept id="4733039728785194814" name="jetbrains.mps.lang.modelapi.structure.NamedNodeReference" flags="ng" index="ZC_QK">
        <reference id="7256306938026143658" name="target" index="2aWVGs" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="7400021826774799413" name="jetbrains.mps.lang.smodel.structure.NodePointerExpression" flags="ng" index="2tJFMh">
        <child id="7400021826774799510" name="ref" index="2tJFKM" />
      </concept>
      <concept id="4065387505485742749" name="jetbrains.mps.lang.smodel.structure.AbstractPointerResolveOperation" flags="ng" index="2yCiFS">
        <child id="3648723375513868575" name="repositoryArg" index="Vysub" />
      </concept>
      <concept id="1143234257716" name="jetbrains.mps.lang.smodel.structure.Node_GetModelOperation" flags="nn" index="I4A8Y" />
      <concept id="1145404486709" name="jetbrains.mps.lang.smodel.structure.SemanticDowncastExpression" flags="nn" index="2JrnkZ">
        <child id="1145404616321" name="leftExpression" index="2JrQYb" />
      </concept>
      <concept id="3648723375513868532" name="jetbrains.mps.lang.smodel.structure.NodePointer_ResolveOperation" flags="ng" index="Vyspw" />
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
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
      <concept id="1203518072036" name="jetbrains.mps.baseLanguage.collections.structure.SmartClosureParameterDeclaration" flags="ig" index="Rh6nW" />
      <concept id="1225727723840" name="jetbrains.mps.baseLanguage.collections.structure.FindFirstOperation" flags="nn" index="1z4cxt" />
    </language>
  </registry>
  <node concept="312cEu" id="6RTgCFCLoSE">
    <property role="TrG5h" value="Util" />
    <node concept="2YIFZL" id="1tFQO7bI8D5" role="jymVt">
      <property role="TrG5h" value="isFilled" />
      <node concept="3Tm1VV" id="1tFQO7bI8D6" role="1B3o_S" />
      <node concept="10P_77" id="1tFQO7bI8D7" role="3clF45" />
      <node concept="37vLTG" id="1tFQO7bI8D0" role="3clF46">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="1tFQO7bI8D1" role="1tU5fm">
          <ref role="ehGHo" to="i5hu:2zOT$_1s4h8" resolve="FillableShape" />
        </node>
      </node>
      <node concept="3clFbS" id="1tFQO7bI8CP" role="3clF47">
        <node concept="3clFbF" id="1tFQO7bI8CQ" role="3cqZAp">
          <node concept="17R0WA" id="1w$3KkGSCwD" role="3clFbG">
            <node concept="2OqwBi" id="1tFQO7bI8CS" role="3uHU7B">
              <node concept="2OqwBi" id="1tFQO7bI8CT" role="2Oq$k0">
                <node concept="2OqwBi" id="1tFQO7bI8CU" role="2Oq$k0">
                  <node concept="37vLTw" id="1tFQO7bI8D2" role="2Oq$k0">
                    <ref role="3cqZAo" node="1tFQO7bI8D0" resolve="node" />
                  </node>
                  <node concept="3TrEf2" id="1tFQO7bI8CW" role="2OqNvi">
                    <ref role="3Tt5mk" to="i5hu:1tFQO7bB5dL" resolve="filling" />
                  </node>
                </node>
                <node concept="3TrEf2" id="1tFQO7bI8CX" role="2OqNvi">
                  <ref role="3Tt5mk" to="i5hu:1tFQO7bBByx" resolve="filling" />
                </node>
              </node>
              <node concept="3TrcHB" id="1tFQO7bI8CY" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
            <node concept="Xl_RD" id="1tFQO7bI8CZ" role="3uHU7w">
              <property role="Xl_RC" value="filled" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="3v9$RrAbTfq" role="jymVt" />
    <node concept="2YIFZL" id="4vSAr3EDjG_" role="jymVt">
      <property role="TrG5h" value="getStaticColorField" />
      <property role="DiZV1" value="false" />
      <property role="od$2w" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="3clFbS" id="4vSAr3EDjGB" role="3clF47">
        <node concept="3cpWs8" id="2zwD_vqdYPi" role="3cqZAp">
          <node concept="3cpWsn" id="2zwD_vqdYPj" role="3cpWs9">
            <property role="TrG5h" value="colorNode" />
            <node concept="2OqwBi" id="2zwD_vqdYPk" role="33vP2m">
              <node concept="2tJFMh" id="2zwD_vqdYPl" role="2Oq$k0">
                <node concept="ZC_QK" id="2zwD_vqe8sf" role="2tJFKM">
                  <ref role="2aWVGs" to="z60i:~Color" resolve="Color" />
                </node>
              </node>
              <node concept="Vyspw" id="2zwD_vqdYPn" role="2OqNvi">
                <node concept="2OqwBi" id="2zwD_vqdYPo" role="Vysub">
                  <node concept="2JrnkZ" id="2zwD_vqdYPp" role="2Oq$k0">
                    <node concept="2OqwBi" id="2zwD_vqdYPq" role="2JrQYb">
                      <node concept="37vLTw" id="2zwD_vqdYPr" role="2Oq$k0">
                        <ref role="3cqZAo" node="4vSAr3EDjHI" resolve="colorReference" />
                      </node>
                      <node concept="I4A8Y" id="2zwD_vqdYPs" role="2OqNvi" />
                    </node>
                  </node>
                  <node concept="liA8E" id="2zwD_vqdYPt" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SModel.getRepository()" resolve="getRepository" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3Tqbb2" id="2zwD_vqe8O1" role="1tU5fm">
              <ref role="ehGHo" to="tpee:fz12cDA" resolve="ClassConcept" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4vSAr3EI7E3" role="3cqZAp">
          <node concept="2OqwBi" id="4vSAr3EDjHe" role="3cqZAk">
            <node concept="2OqwBi" id="4vSAr3EDjHf" role="2Oq$k0">
              <node concept="37vLTw" id="2zwD_vqdZJw" role="2Oq$k0">
                <ref role="3cqZAo" node="2zwD_vqdYPj" resolve="colorNode" />
              </node>
              <node concept="2qgKlT" id="4vSAr3EDjHh" role="2OqNvi">
                <ref role="37wK5l" to="tpek:4_LVZ3pBr7M" resolve="staticFields" />
              </node>
            </node>
            <node concept="1z4cxt" id="4vSAr3EI6SP" role="2OqNvi">
              <node concept="1bVj0M" id="4vSAr3EI6SR" role="23t8la">
                <node concept="3clFbS" id="4vSAr3EI6SS" role="1bW5cS">
                  <node concept="3clFbF" id="4vSAr3EI6ST" role="3cqZAp">
                    <node concept="17R0WA" id="4vSAr3EI6SU" role="3clFbG">
                      <node concept="2OqwBi" id="5aueixV4hBd" role="3uHU7w">
                        <node concept="2OqwBi" id="5aueixV4gRL" role="2Oq$k0">
                          <node concept="37vLTw" id="4vSAr3EI6SW" role="2Oq$k0">
                            <ref role="3cqZAo" node="4vSAr3EDjHI" resolve="colorReference" />
                          </node>
                          <node concept="3TrEf2" id="5aueixV4hjQ" role="2OqNvi">
                            <ref role="3Tt5mk" to="i5hu:2zOT$_1suc9" resolve="target" />
                          </node>
                        </node>
                        <node concept="3TrcHB" id="5aueixV4hQd" role="2OqNvi">
                          <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                        </node>
                      </node>
                      <node concept="2OqwBi" id="4vSAr3EI6SY" role="3uHU7B">
                        <node concept="37vLTw" id="4vSAr3EI6SZ" role="2Oq$k0">
                          <ref role="3cqZAo" node="4vSAr3EI6T1" resolve="it" />
                        </node>
                        <node concept="3TrcHB" id="4vSAr3EI6T0" role="2OqNvi">
                          <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="Rh6nW" id="4vSAr3EI6T1" role="1bW2Oz">
                  <property role="TrG5h" value="it" />
                  <node concept="2jxLKc" id="4vSAr3EI6T2" role="1tU5fm" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tqbb2" id="4vSAr3EDjHG" role="3clF45">
        <ref role="ehGHo" to="tpee:f$Wx3kv" resolve="StaticFieldDeclaration" />
      </node>
      <node concept="37vLTG" id="4vSAr3EDjHI" role="3clF46">
        <property role="TrG5h" value="colorReference" />
        <node concept="3Tqbb2" id="4vSAr3EDjHJ" role="1tU5fm">
          <ref role="ehGHo" to="i5hu:2zOT$_1suc8" resolve="ColorReference" />
        </node>
      </node>
      <node concept="3Tm1VV" id="4vSAr3EDjHH" role="1B3o_S" />
    </node>
    <node concept="3Tm1VV" id="6RTgCFCLoSF" role="1B3o_S" />
    <node concept="2tJIrI" id="3v9$RrAbFh3" role="jymVt" />
    <node concept="2YIFZL" id="3v9$RrAbCM1" role="jymVt">
      <property role="TrG5h" value="getRgbColor" />
      <node concept="3clFbS" id="3v9$RrAbCM4" role="3clF47">
        <node concept="3clFbF" id="3v9$RrAbJ6y" role="3cqZAp">
          <node concept="37vLTI" id="3v9$RrAbK1a" role="3clFbG">
            <node concept="2OqwBi" id="3v9$RrAbKx6" role="37vLTx">
              <node concept="37vLTw" id="3v9$RrAbKdj" role="2Oq$k0">
                <ref role="3cqZAo" node="3v9$RrAbCOC" resolve="hexColor" />
              </node>
              <node concept="liA8E" id="3v9$RrAbKJD" role="2OqNvi">
                <ref role="37wK5l" to="wyt6:~String.substring(int)" resolve="substring" />
                <node concept="3cmrfG" id="3v9$RrAbKLn" role="37wK5m">
                  <property role="3cmrfH" value="1" />
                </node>
              </node>
            </node>
            <node concept="37vLTw" id="3v9$RrAbJ6w" role="37vLTJ">
              <ref role="3cqZAo" node="3v9$RrAbCOC" resolve="hexColor" />
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="3v9$RrAbCTB" role="3cqZAp">
          <node concept="3clFbC" id="3v9$RrAbEp8" role="3clFbw">
            <node concept="3cmrfG" id="3v9$RrAbEqV" role="3uHU7w">
              <property role="3cmrfH" value="3" />
            </node>
            <node concept="2OqwBi" id="3v9$RrAbDl1" role="3uHU7B">
              <node concept="37vLTw" id="3v9$RrAbCXb" role="2Oq$k0">
                <ref role="3cqZAo" node="3v9$RrAbCOC" resolve="hexColor" />
              </node>
              <node concept="liA8E" id="3v9$RrAbDzw" role="2OqNvi">
                <ref role="37wK5l" to="wyt6:~String.length()" resolve="length" />
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="3v9$RrAbCTD" role="3clFbx">
            <node concept="3cpWs8" id="3v9$RrAdy4W" role="3cqZAp">
              <node concept="3cpWsn" id="3v9$RrAdy4X" role="3cpWs9">
                <property role="TrG5h" value="r" />
                <node concept="10Pfzv" id="3v9$RrAdwWK" role="1tU5fm" />
                <node concept="2OqwBi" id="3v9$RrAdy4Y" role="33vP2m">
                  <node concept="37vLTw" id="3v9$RrAdy4Z" role="2Oq$k0">
                    <ref role="3cqZAo" node="3v9$RrAbCOC" resolve="hexColor" />
                  </node>
                  <node concept="liA8E" id="3v9$RrAdy50" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.charAt(int)" resolve="charAt" />
                    <node concept="3cmrfG" id="3v9$RrAdy51" role="37wK5m">
                      <property role="3cmrfH" value="0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3cpWs8" id="3v9$RrAdykn" role="3cqZAp">
              <node concept="3cpWsn" id="3v9$RrAdyko" role="3cpWs9">
                <property role="TrG5h" value="g" />
                <node concept="10Pfzv" id="3v9$RrAdyfl" role="1tU5fm" />
                <node concept="2OqwBi" id="3v9$RrAdykp" role="33vP2m">
                  <node concept="37vLTw" id="3v9$RrAdykq" role="2Oq$k0">
                    <ref role="3cqZAo" node="3v9$RrAbCOC" resolve="hexColor" />
                  </node>
                  <node concept="liA8E" id="3v9$RrAdykr" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.charAt(int)" resolve="charAt" />
                    <node concept="3cmrfG" id="3v9$RrAdyks" role="37wK5m">
                      <property role="3cmrfH" value="1" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3cpWs8" id="3v9$RrAdyxW" role="3cqZAp">
              <node concept="3cpWsn" id="3v9$RrAdyxX" role="3cpWs9">
                <property role="TrG5h" value="b" />
                <node concept="10Pfzv" id="3v9$RrAdyxY" role="1tU5fm" />
                <node concept="2OqwBi" id="3v9$RrAdyxZ" role="33vP2m">
                  <node concept="37vLTw" id="3v9$RrAdyy0" role="2Oq$k0">
                    <ref role="3cqZAo" node="3v9$RrAbCOC" resolve="hexColor" />
                  </node>
                  <node concept="liA8E" id="3v9$RrAdyy1" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.charAt(int)" resolve="charAt" />
                    <node concept="3cmrfG" id="3v9$RrAdyy2" role="37wK5m">
                      <property role="3cmrfH" value="1" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbF" id="3v9$RrAbETu" role="3cqZAp">
              <node concept="37vLTI" id="3v9$RrAbFd3" role="3clFbG">
                <node concept="37vLTw" id="3v9$RrAbETt" role="37vLTJ">
                  <ref role="3cqZAo" node="3v9$RrAbCOC" resolve="hexColor" />
                </node>
                <node concept="3cpWs3" id="3v9$RrAdB5V" role="37vLTx">
                  <node concept="37vLTw" id="3v9$RrAdBfm" role="3uHU7w">
                    <ref role="3cqZAo" node="3v9$RrAdyxX" resolve="b" />
                  </node>
                  <node concept="3cpWs3" id="3v9$RrAdA81" role="3uHU7B">
                    <node concept="3cpWs3" id="3v9$RrAd_lI" role="3uHU7B">
                      <node concept="3cpWs3" id="3v9$RrAd$Xs" role="3uHU7B">
                        <node concept="3cpWs3" id="3v9$RrAd$0_" role="3uHU7B">
                          <node concept="3cpWs3" id="3v9$RrAdz0a" role="3uHU7B">
                            <node concept="Xl_RD" id="3v9$RrAdyDW" role="3uHU7B">
                              <property role="Xl_RC" value="" />
                            </node>
                            <node concept="37vLTw" id="3v9$RrAdz2g" role="3uHU7w">
                              <ref role="3cqZAo" node="3v9$RrAdy4X" resolve="r" />
                            </node>
                          </node>
                          <node concept="37vLTw" id="3v9$RrAd$3d" role="3uHU7w">
                            <ref role="3cqZAo" node="3v9$RrAdy4X" resolve="r" />
                          </node>
                        </node>
                        <node concept="37vLTw" id="3v9$RrAd_0h" role="3uHU7w">
                          <ref role="3cqZAo" node="3v9$RrAdyko" resolve="g" />
                        </node>
                      </node>
                      <node concept="37vLTw" id="3v9$RrAd_np" role="3uHU7w">
                        <ref role="3cqZAo" node="3v9$RrAdyko" resolve="g" />
                      </node>
                    </node>
                    <node concept="37vLTw" id="3v9$RrAdAbl" role="3uHU7w">
                      <ref role="3cqZAo" node="3v9$RrAdyxX" resolve="b" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="3v9$RrAbMVl" role="3cqZAp">
          <node concept="2YIFZM" id="3v9$RrAca2h" role="3clFbG">
            <ref role="1Pybhc" to="wyt6:~Integer" resolve="Integer" />
            <ref role="37wK5l" to="wyt6:~Integer.parseInt(java.lang.String,int)" resolve="parseInt" />
            <node concept="37vLTw" id="3v9$RrAca2i" role="37wK5m">
              <ref role="3cqZAo" node="3v9$RrAbCOC" resolve="hexColor" />
            </node>
            <node concept="3cmrfG" id="3v9$RrAca2j" role="37wK5m">
              <property role="3cmrfH" value="16" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="3v9$RrAbCD$" role="1B3o_S" />
      <node concept="37vLTG" id="3v9$RrAbCOC" role="3clF46">
        <property role="TrG5h" value="hexColor" />
        <node concept="17QB3L" id="3v9$RrAbCOB" role="1tU5fm" />
      </node>
      <node concept="10Oyi0" id="3v9$RrAc9EG" role="3clF45" />
    </node>
  </node>
</model>

