<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:19b55077-23c6-4e27-8af1-519aa82747d9(imagelang.behavior)">
  <persistence version="9" />
  <languages>
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="17" />
    <use id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior" version="2" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="11" />
    <use id="fdcdc48f-bfd8-4831-aa76-5abac2ffa010" name="jetbrains.mps.baseLanguage.jdk8" version="2" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="i5hu" ref="r:b3782452-bf10-4ef1-8aaf-fef26baa6603(imagelang.structure)" />
    <import index="tpcu" ref="r:00000000-0000-4000-0000-011c89590282(jetbrains.mps.lang.core.behavior)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="o8zo" ref="r:314576fc-3aee-4386-a0a5-a38348ac317d(jetbrains.mps.scope)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
  </imports>
  <registry>
    <language id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior">
      <concept id="1225194240794" name="jetbrains.mps.lang.behavior.structure.ConceptBehavior" flags="ng" index="13h7C7">
        <reference id="1225194240799" name="concept" index="13h7C2" />
        <child id="1225194240805" name="method" index="13h7CS" />
        <child id="1225194240801" name="constructor" index="13h7CW" />
      </concept>
      <concept id="1225194413805" name="jetbrains.mps.lang.behavior.structure.ConceptConstructorDeclaration" flags="in" index="13hLZK" />
      <concept id="1225194472830" name="jetbrains.mps.lang.behavior.structure.ConceptMethodDeclaration" flags="ng" index="13i0hz">
        <reference id="1225194472831" name="overriddenMethod" index="13i0hy" />
      </concept>
      <concept id="1225194628440" name="jetbrains.mps.lang.behavior.structure.SuperNodeExpression" flags="nn" index="13iAh5">
        <reference id="5299096511375896640" name="superConcept" index="3eA5LN" />
      </concept>
      <concept id="1225194691553" name="jetbrains.mps.lang.behavior.structure.ThisNodeExpression" flags="nn" index="13iPFW" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1188207840427" name="jetbrains.mps.baseLanguage.structure.AnnotationInstance" flags="nn" index="2AHcQZ">
        <reference id="1188208074048" name="annotation" index="2AI5Lk" />
      </concept>
      <concept id="1188208481402" name="jetbrains.mps.baseLanguage.structure.HasAnnotation" flags="ng" index="2AJDlI">
        <child id="1188208488637" name="annotation" index="2AJF6D" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1182160077978" name="jetbrains.mps.baseLanguage.structure.AnonymousClassCreator" flags="nn" index="YeOm9">
        <child id="1182160096073" name="cls" index="YeSDq" />
      </concept>
      <concept id="1070534644030" name="jetbrains.mps.baseLanguage.structure.BooleanType" flags="in" index="10P_77" />
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="1225271283259" name="jetbrains.mps.baseLanguage.structure.NPEEqualsExpression" flags="nn" index="17R0WA" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123165" name="jetbrains.mps.baseLanguage.structure.InstanceMethodDeclaration" flags="ig" index="3clFb_" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123157" name="jetbrains.mps.baseLanguage.structure.Statement" flags="nn" index="3clFbH" />
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <property id="521412098689998745" name="nonStatic" index="2bfB8j" />
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ng" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1170345865475" name="jetbrains.mps.baseLanguage.structure.AnonymousClass" flags="ig" index="1Y3b0j">
        <reference id="1170346070688" name="classifier" index="1Y3XeK" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1180031783296" name="jetbrains.mps.lang.smodel.structure.Concept_IsSubConceptOfOperation" flags="nn" index="2Zo12i">
        <child id="1180031783297" name="conceptArgument" index="2Zo12j" />
      </concept>
      <concept id="3562215692195599741" name="jetbrains.mps.lang.smodel.structure.SLinkImplicitSelect" flags="nn" index="13MTOL">
        <reference id="3562215692195600259" name="link" index="13MTZf" />
      </concept>
      <concept id="6677504323281689838" name="jetbrains.mps.lang.smodel.structure.SConceptType" flags="in" index="3bZ5Sz" />
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
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="13h7C7" id="5aueixUZHVA">
    <property role="3GE5qa" value="images" />
    <ref role="13h7C2" to="i5hu:2zOT$_1s4h8" resolve="FillableShape" />
    <node concept="13i0hz" id="1tFQO7bErnw" role="13h7CS">
      <property role="TrG5h" value="isFilled" />
      <node concept="3Tm1VV" id="1tFQO7bErnx" role="1B3o_S" />
      <node concept="10P_77" id="1tFQO7bErut" role="3clF45" />
      <node concept="3clFbS" id="1tFQO7bErnz" role="3clF47">
        <node concept="3clFbF" id="1tFQO7bErwc" role="3cqZAp">
          <node concept="17R0WA" id="1tFQO7bErwe" role="3clFbG">
            <node concept="2OqwBi" id="1tFQO7bErwf" role="3uHU7B">
              <node concept="2OqwBi" id="4q8PBg1YMWG" role="2Oq$k0">
                <node concept="2OqwBi" id="4q8PBg1YN1J" role="2Oq$k0">
                  <node concept="13iPFW" id="4q8PBg1YN1K" role="2Oq$k0" />
                  <node concept="3TrEf2" id="4q8PBg1YN1L" role="2OqNvi">
                    <ref role="3Tt5mk" to="i5hu:1tFQO7bB5dL" resolve="filling" />
                  </node>
                </node>
                <node concept="3TrEf2" id="4q8PBg1YMWI" role="2OqNvi">
                  <ref role="3Tt5mk" to="i5hu:1tFQO7bBByx" resolve="filling" />
                </node>
              </node>
              <node concept="3TrcHB" id="1tFQO7bErwl" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
            <node concept="Xl_RD" id="1tFQO7bErwm" role="3uHU7w">
              <property role="Xl_RC" value="filled" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13hLZK" id="5aueixUZHVB" role="13h7CW">
      <node concept="3clFbS" id="5aueixUZHVC" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="3v9$RrAj2Dn">
    <ref role="13h7C2" to="i5hu:2zOT$_1s4h0" resolve="Canvas" />
    <node concept="13hLZK" id="3v9$RrAj2Do" role="13h7CW">
      <node concept="3clFbS" id="3v9$RrAj2Dp" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="3v9$RrAj2E$" role="13h7CS">
      <property role="TrG5h" value="getScope" />
      <ref role="13i0hy" to="tpcu:52_Geb4QDV$" resolve="getScope" />
      <node concept="3Tm1VV" id="3v9$RrAj2E_" role="1B3o_S" />
      <node concept="3clFbS" id="3v9$RrAj2EI" role="3clF47">
        <node concept="3clFbJ" id="3v9$RrAj5na" role="3cqZAp">
          <node concept="3clFbS" id="3v9$RrAj5nc" role="3clFbx">
            <node concept="3cpWs6" id="3v9$RrAj5WC" role="3cqZAp">
              <node concept="2ShNRf" id="3v9$RrAjcVx" role="3cqZAk">
                <node concept="YeOm9" id="3v9$RrAjwba" role="2ShVmc">
                  <node concept="1Y3b0j" id="3v9$RrAjwbd" role="YeSDq">
                    <property role="2bfB8j" value="true" />
                    <ref role="37wK5l" to="o8zo:4IP40Bi3e_T" resolve="ListScope" />
                    <ref role="1Y3XeK" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
                    <node concept="3Tm1VV" id="3v9$RrAjwbe" role="1B3o_S" />
                    <node concept="2OqwBi" id="3v9$RrAjtJs" role="37wK5m">
                      <node concept="2OqwBi" id="3v9$RrAjs8o" role="2Oq$k0">
                        <node concept="13iPFW" id="3v9$RrAjrO0" role="2Oq$k0" />
                        <node concept="3Tsc0h" id="3v9$RrAjsmB" role="2OqNvi">
                          <ref role="3TtcxE" to="i5hu:24qcwCbgR1Y" resolve="vars" />
                        </node>
                      </node>
                      <node concept="13MTOL" id="3v9$RrAjvEW" role="2OqNvi">
                        <ref role="13MTZf" to="i5hu:4q8PBg22YLQ" resolve="variable" />
                      </node>
                    </node>
                    <node concept="3clFb_" id="3v9$RrAjwkl" role="jymVt">
                      <property role="TrG5h" value="getName" />
                      <node concept="17QB3L" id="3v9$RrAjwkm" role="3clF45" />
                      <node concept="3Tm1VV" id="3v9$RrAjwkn" role="1B3o_S" />
                      <node concept="37vLTG" id="3v9$RrAjwkp" role="3clF46">
                        <property role="TrG5h" value="child" />
                        <node concept="3Tqbb2" id="3v9$RrAjwkq" role="1tU5fm">
                          <ref role="ehGHo" to="i5hu:4q8PBg22YGV" resolve="Variable" />
                        </node>
                      </node>
                      <node concept="3clFbS" id="3v9$RrAjwks" role="3clF47">
                        <node concept="3clFbF" id="3v9$RrAjw$h" role="3cqZAp">
                          <node concept="2OqwBi" id="3v9$RrAjwKn" role="3clFbG">
                            <node concept="37vLTw" id="3v9$RrAjw$g" role="2Oq$k0">
                              <ref role="3cqZAo" node="3v9$RrAjwkp" resolve="child" />
                            </node>
                            <node concept="3TrcHB" id="3v9$RrAjx4_" role="2OqNvi">
                              <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="2AHcQZ" id="3v9$RrAjwkt" role="2AJF6D">
                        <ref role="2AI5Lk" to="wyt6:~Override" resolve="Override" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="3v9$RrAj5Eq" role="3clFbw">
            <node concept="37vLTw" id="3v9$RrAj5r$" role="2Oq$k0">
              <ref role="3cqZAo" node="3v9$RrAj2EJ" resolve="kind" />
            </node>
            <node concept="2Zo12i" id="3v9$RrAj5Rq" role="2OqNvi">
              <node concept="chp4Y" id="3v9$RrAj5UP" role="2Zo12j">
                <ref role="cht4Q" to="i5hu:4q8PBg22YGV" resolve="Variable" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="3v9$RrAj2ET" role="3cqZAp">
          <node concept="2OqwBi" id="3v9$RrAj2EQ" role="3clFbG">
            <node concept="13iAh5" id="3v9$RrAj2ER" role="2Oq$k0">
              <ref role="3eA5LN" to="tpck:3fifI_xCcJN" resolve="ScopeProvider" />
            </node>
            <node concept="2qgKlT" id="3v9$RrAj2ES" role="2OqNvi">
              <ref role="37wK5l" to="tpcu:52_Geb4QDV$" resolve="getScope" />
              <node concept="37vLTw" id="3v9$RrAj2EO" role="37wK5m">
                <ref role="3cqZAo" node="3v9$RrAj2EJ" resolve="kind" />
              </node>
              <node concept="37vLTw" id="3v9$RrAj2EP" role="37wK5m">
                <ref role="3cqZAo" node="3v9$RrAj2EL" resolve="child" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="3v9$RrAj6yu" role="3cqZAp" />
      </node>
      <node concept="37vLTG" id="3v9$RrAj2EJ" role="3clF46">
        <property role="TrG5h" value="kind" />
        <node concept="3bZ5Sz" id="3v9$RrAj2EK" role="1tU5fm" />
      </node>
      <node concept="37vLTG" id="3v9$RrAj2EL" role="3clF46">
        <property role="TrG5h" value="child" />
        <node concept="3Tqbb2" id="3v9$RrAj2EM" role="1tU5fm" />
      </node>
      <node concept="3uibUv" id="3v9$RrAj2EN" role="3clF45">
        <ref role="3uigEE" to="o8zo:3fifI_xCtN$" resolve="Scope" />
      </node>
    </node>
  </node>
</model>

