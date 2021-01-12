<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:dafd433b-bd7d-4e09-a08a-b0d744ae8f8b(imagelang.templates@generator)">
  <persistence version="9" />
  <languages>
    <use id="b401a680-8325-4110-8fd3-84331ff25bef" name="jetbrains.mps.lang.generator" version="3" />
    <use id="d7706f63-9be2-479c-a3da-ae92af1e64d5" name="jetbrains.mps.lang.generator.generationContext" version="2" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="11" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="17" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="1" />
    <use id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures" version="0" />
    <devkit ref="a2eb3a43-fcc2-4200-80dc-c60110c4862d(jetbrains.mps.devkit.templates)" />
  </languages>
  <imports>
    <import index="i5hu" ref="r:b3782452-bf10-4ef1-8aaf-fef26baa6603(imagelang.structure)" />
    <import index="dxuu" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:javax.swing(JDK/)" />
    <import index="z60i" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.awt(JDK/)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="6i10" ref="9c95c47c-f8eb-4d05-99e7-e289866467b8/java:org.golchin(imagelang-dsl/)" />
    <import index="jan3" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.awt.image(JDK/)" />
    <import index="fbzs" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.awt.geom(JDK/)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="tpek" ref="r:00000000-0000-4000-0000-011c895902c0(jetbrains.mps.baseLanguage.behavior)" />
    <import index="urxu" ref="r:1b898324-867b-40bd-88ea-4fba393a2cd1(imagelang.generator.util)" />
    <import index="v18h" ref="9c95c47c-f8eb-4d05-99e7-e289866467b8/java:kotlin(imagelang-dsl/)" />
    <import index="ouht" ref="9c95c47c-f8eb-4d05-99e7-e289866467b8/java:kotlin.jvm.functions(imagelang-dsl/)" />
    <import index="62hf" ref="r:19b55077-23c6-4e27-8af1-519aa82747d9(imagelang.behavior)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1080223426719" name="jetbrains.mps.baseLanguage.structure.OrExpression" flags="nn" index="22lmx$" />
      <concept id="1082485599095" name="jetbrains.mps.baseLanguage.structure.BlockStatement" flags="nn" index="9aQIb">
        <child id="1082485599096" name="statements" index="9aQI4" />
      </concept>
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1465982738277781862" name="jetbrains.mps.baseLanguage.structure.PlaceholderMember" flags="nn" index="2tJIrI" />
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
      <concept id="1197029447546" name="jetbrains.mps.baseLanguage.structure.FieldReferenceOperation" flags="nn" index="2OwXpG">
        <reference id="1197029500499" name="fieldDeclaration" index="2Oxat5" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070475354124" name="jetbrains.mps.baseLanguage.structure.ThisExpression" flags="nn" index="Xjq3P">
        <reference id="1182955020723" name="classConcept" index="1HBi2w" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1182160077978" name="jetbrains.mps.baseLanguage.structure.AnonymousClassCreator" flags="nn" index="YeOm9">
        <child id="1182160096073" name="cls" index="YeSDq" />
      </concept>
      <concept id="1081236700938" name="jetbrains.mps.baseLanguage.structure.StaticMethodDeclaration" flags="ig" index="2YIFZL" />
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070533707846" name="jetbrains.mps.baseLanguage.structure.StaticFieldReference" flags="nn" index="10M0yZ">
        <reference id="1144433057691" name="classifier" index="1PxDUh" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534370425" name="jetbrains.mps.baseLanguage.structure.IntegerType" flags="in" index="10Oyi0" />
      <concept id="1070534760951" name="jetbrains.mps.baseLanguage.structure.ArrayType" flags="in" index="10Q1$e">
        <child id="1070534760952" name="componentType" index="10Q1$1" />
      </concept>
      <concept id="1070534934090" name="jetbrains.mps.baseLanguage.structure.CastExpression" flags="nn" index="10QFUN">
        <child id="1070534934091" name="type" index="10QFUM" />
        <child id="1070534934092" name="expression" index="10QFUP" />
      </concept>
      <concept id="1068390468200" name="jetbrains.mps.baseLanguage.structure.FieldDeclaration" flags="ig" index="312cEg" />
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu">
        <child id="1165602531693" name="superclass" index="1zkMxy" />
      </concept>
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <property id="1176718929932" name="isFinal" index="3TUv4t" />
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1111509017652" name="jetbrains.mps.baseLanguage.structure.FloatingPointConstant" flags="nn" index="3b6qkQ">
        <property id="1113006610751" name="value" index="$nhwW" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123165" name="jetbrains.mps.baseLanguage.structure.InstanceMethodDeclaration" flags="ig" index="3clFb_" />
      <concept id="1068580123152" name="jetbrains.mps.baseLanguage.structure.EqualsExpression" flags="nn" index="3clFbC" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT">
        <property id="1068580123138" name="value" index="3clFbU" />
      </concept>
      <concept id="1068580123140" name="jetbrains.mps.baseLanguage.structure.ConstructorDeclaration" flags="ig" index="3clFbW" />
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1068581517677" name="jetbrains.mps.baseLanguage.structure.VoidType" flags="in" index="3cqZAl" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1073063089578" name="jetbrains.mps.baseLanguage.structure.SuperMethodCall" flags="nn" index="3nyPlj" />
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk" />
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <property id="521412098689998745" name="nonStatic" index="2bfB8j" />
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="7812454656619025412" name="jetbrains.mps.baseLanguage.structure.LocalMethodCall" flags="nn" index="1rXfSq" />
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
        <child id="1109201940907" name="parameter" index="11_B2D" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1073239437375" name="jetbrains.mps.baseLanguage.structure.NotEqualsExpression" flags="nn" index="3y3z36" />
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ng" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1146644623116" name="jetbrains.mps.baseLanguage.structure.PrivateVisibility" flags="nn" index="3Tm6S6" />
      <concept id="1146644641414" name="jetbrains.mps.baseLanguage.structure.ProtectedVisibility" flags="nn" index="3Tmbuc" />
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
      <concept id="1170345865475" name="jetbrains.mps.baseLanguage.structure.AnonymousClass" flags="ig" index="1Y3b0j">
        <reference id="1170346070688" name="classifier" index="1Y3XeK" />
      </concept>
    </language>
    <language id="b401a680-8325-4110-8fd3-84331ff25bef" name="jetbrains.mps.lang.generator">
      <concept id="1114706874351" name="jetbrains.mps.lang.generator.structure.CopySrcNodeMacro" flags="ln" index="29HgVG">
        <child id="1168024447342" name="sourceNodeQuery" index="3NFExx" />
      </concept>
      <concept id="1095416546421" name="jetbrains.mps.lang.generator.structure.MappingConfiguration" flags="ig" index="bUwia">
        <child id="1200911492601" name="mappingLabel" index="2rTMjI" />
        <child id="1167328349397" name="reductionMappingRule" index="3acgRq" />
        <child id="1167514678247" name="rootMappingRule" index="3lj3bC" />
      </concept>
      <concept id="1177093525992" name="jetbrains.mps.lang.generator.structure.InlineTemplate_RuleConsequence" flags="lg" index="gft3U">
        <child id="1177093586806" name="templateNode" index="gfFT$" />
      </concept>
      <concept id="1168619357332" name="jetbrains.mps.lang.generator.structure.RootTemplateAnnotation" flags="lg" index="n94m4">
        <reference id="1168619429071" name="applicableConcept" index="n9lRv" />
      </concept>
      <concept id="1095672379244" name="jetbrains.mps.lang.generator.structure.TemplateFragment" flags="ng" index="raruj" />
      <concept id="1200911316486" name="jetbrains.mps.lang.generator.structure.MappingLabelDeclaration" flags="lg" index="2rT7sh">
        <reference id="1200911342686" name="sourceConcept" index="2rTdP9" />
        <reference id="1200913004646" name="targetConcept" index="2rZz_L" />
      </concept>
      <concept id="1167168920554" name="jetbrains.mps.lang.generator.structure.BaseMappingRule_Condition" flags="in" index="30G5F_" />
      <concept id="1167169188348" name="jetbrains.mps.lang.generator.structure.TemplateFunctionParameter_sourceNode" flags="nn" index="30H73N" />
      <concept id="1167169308231" name="jetbrains.mps.lang.generator.structure.BaseMappingRule" flags="ng" index="30H$t8">
        <reference id="1167169349424" name="applicableConcept" index="30HIoZ" />
        <child id="1167169362365" name="conditionFunction" index="30HLyM" />
      </concept>
      <concept id="1087833241328" name="jetbrains.mps.lang.generator.structure.PropertyMacro" flags="ln" index="17Uvod">
        <child id="1167756362303" name="propertyValueFunction" index="3zH0cK" />
      </concept>
      <concept id="1087833466690" name="jetbrains.mps.lang.generator.structure.NodeMacro" flags="lg" index="17VmuZ">
        <reference id="1200912223215" name="mappingLabel" index="2rW$FS" />
      </concept>
      <concept id="1167327847730" name="jetbrains.mps.lang.generator.structure.Reduction_MappingRule" flags="lg" index="3aamgX">
        <child id="1169672767469" name="ruleConsequence" index="1lVwrX" />
      </concept>
      <concept id="1167514355419" name="jetbrains.mps.lang.generator.structure.Root_MappingRule" flags="lg" index="3lhOvk">
        <reference id="1167514355421" name="template" index="3lhOvi" />
      </concept>
      <concept id="1131073187192" name="jetbrains.mps.lang.generator.structure.MapSrcNodeMacro" flags="ln" index="1pdMLZ">
        <child id="1168281849769" name="sourceNodeQuery" index="31$UT" />
      </concept>
      <concept id="1167756080639" name="jetbrains.mps.lang.generator.structure.PropertyMacro_GetPropertyValue" flags="in" index="3zFVjK" />
      <concept id="1167770111131" name="jetbrains.mps.lang.generator.structure.ReferenceMacro_GetReferent" flags="in" index="3$xsQk" />
      <concept id="1167945743726" name="jetbrains.mps.lang.generator.structure.IfMacro_Condition" flags="in" index="3IZrLx" />
      <concept id="1167951910403" name="jetbrains.mps.lang.generator.structure.SourceSubstituteMacro_SourceNodesQuery" flags="in" index="3JmXsc" />
      <concept id="8900764248744213868" name="jetbrains.mps.lang.generator.structure.InlineTemplateWithContext_RuleConsequence" flags="lg" index="1Koe21">
        <child id="8900764248744213871" name="contentNode" index="1Koe22" />
      </concept>
      <concept id="1168024337012" name="jetbrains.mps.lang.generator.structure.SourceSubstituteMacro_SourceNodeQuery" flags="in" index="3NFfHV" />
      <concept id="1118773211870" name="jetbrains.mps.lang.generator.structure.IfMacro" flags="ln" index="1W57fq">
        <child id="1194989344771" name="alternativeConsequence" index="UU_$l" />
        <child id="1167945861827" name="conditionFunction" index="3IZSJc" />
      </concept>
      <concept id="1118786554307" name="jetbrains.mps.lang.generator.structure.LoopMacro" flags="ln" index="1WS0z7">
        <child id="1167952069335" name="sourceNodesQuery" index="3Jn$fo" />
      </concept>
      <concept id="1088761943574" name="jetbrains.mps.lang.generator.structure.ReferenceMacro" flags="ln" index="1ZhdrF">
        <child id="1167770376702" name="referentFunction" index="3$ytzL" />
      </concept>
    </language>
    <language id="d7706f63-9be2-479c-a3da-ae92af1e64d5" name="jetbrains.mps.lang.generator.generationContext">
      <concept id="1216860049627" name="jetbrains.mps.lang.generator.generationContext.structure.GenerationContextOp_GetOutputByLabelAndInput" flags="nn" index="1iwH70">
        <reference id="1216860049628" name="label" index="1iwH77" />
        <child id="1216860049632" name="inputNode" index="1iwH7V" />
      </concept>
      <concept id="1216860049635" name="jetbrains.mps.lang.generator.generationContext.structure.TemplateFunctionParameter_generationContext" flags="nn" index="1iwH7S" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="7453996997717780434" name="jetbrains.mps.lang.smodel.structure.Node_GetSConceptOperation" flags="nn" index="2yIwOk" />
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="1180031783296" name="jetbrains.mps.lang.smodel.structure.Concept_IsSubConceptOfOperation" flags="nn" index="2Zo12i">
        <child id="1180031783297" name="conceptArgument" index="2Zo12j" />
      </concept>
      <concept id="1139613262185" name="jetbrains.mps.lang.smodel.structure.Node_GetParentOperation" flags="nn" index="1mfA1w" />
      <concept id="1139621453865" name="jetbrains.mps.lang.smodel.structure.Node_IsInstanceOfOperation" flags="nn" index="1mIQ4w">
        <child id="1177027386292" name="conceptArgument" index="cj9EA" />
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
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="3364660638048049750" name="jetbrains.mps.lang.core.structure.PropertyAttribute" flags="ng" index="A9Btg">
        <property id="1757699476691236117" name="name_DebugInfo" index="2qtEX9" />
        <property id="1341860900487648621" name="propertyId" index="P4ACc" />
      </concept>
      <concept id="3364660638048049745" name="jetbrains.mps.lang.core.structure.LinkAttribute" flags="ng" index="A9Btn">
        <property id="1757699476691236116" name="role_DebugInfo" index="2qtEX8" />
        <property id="1341860900488019036" name="linkId" index="P3scX" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1237721394592" name="jetbrains.mps.baseLanguage.collections.structure.AbstractContainerCreator" flags="nn" index="HWqM0">
        <child id="1237721435807" name="elementType" index="HW$YZ" />
      </concept>
      <concept id="1160600644654" name="jetbrains.mps.baseLanguage.collections.structure.ListCreatorWithInit" flags="nn" index="Tc6Ow" />
    </language>
  </registry>
  <node concept="bUwia" id="2zOT$_1s3Dd">
    <property role="TrG5h" value="main" />
    <node concept="2rT7sh" id="4q8PBg26OJb" role="2rTMjI">
      <property role="TrG5h" value="LocalVar" />
      <ref role="2rTdP9" to="i5hu:4q8PBg22YGV" resolve="Variable" />
      <ref role="2rZz_L" to="tpee:fzcpWvJ" resolve="LocalVariableDeclaration" />
    </node>
    <node concept="3aamgX" id="3v9$RrAcg5E" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:3v9$RrAbC4I" resolve="HexColor" />
      <node concept="gft3U" id="3v9$RrAckKq" role="1lVwrX">
        <node concept="2ShNRf" id="3v9$RrAckKr" role="gfFT$">
          <node concept="1pGfFk" id="3v9$RrAckKs" role="2ShVmc">
            <ref role="37wK5l" to="z60i:~Color.&lt;init&gt;(int)" resolve="Color" />
            <node concept="3cmrfG" id="3v9$RrAcl$r" role="37wK5m">
              <property role="3cmrfH" value="0" />
              <node concept="17Uvod" id="3v9$RrAcl$C" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068580320020/1068580320021" />
                <node concept="3zFVjK" id="3v9$RrAcl$D" role="3zH0cK">
                  <node concept="3clFbS" id="3v9$RrAcl$E" role="2VODD2">
                    <node concept="3clFbF" id="3v9$RrAclHV" role="3cqZAp">
                      <node concept="2YIFZM" id="3v9$RrAclSm" role="3clFbG">
                        <ref role="37wK5l" to="urxu:3v9$RrAbCM1" resolve="getRgbColor" />
                        <ref role="1Pybhc" to="urxu:6RTgCFCLoSE" resolve="Util" />
                        <node concept="2OqwBi" id="3v9$RrAcmaK" role="37wK5m">
                          <node concept="30H73N" id="3v9$RrAclTK" role="2Oq$k0" />
                          <node concept="3TrcHB" id="3v9$RrAcmjR" role="2OqNvi">
                            <ref role="3TsBF5" to="i5hu:3v9$RrAbC4J" resolve="color" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="3v9$RrAcmC6" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:2zOT$_1suc8" resolve="ColorReference" />
      <node concept="gft3U" id="3v9$RrAcq5b" role="1lVwrX">
        <node concept="10M0yZ" id="3v9$RrAcrjE" role="gfFT$">
          <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
          <ref role="3cqZAo" to="z60i:~Color.WHITE" resolve="WHITE" />
          <node concept="1ZhdrF" id="3v9$RrAcrjF" role="lGtFl">
            <property role="2qtEX8" value="variableDeclaration" />
            <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
            <node concept="3$xsQk" id="3v9$RrAcrjG" role="3$ytzL">
              <node concept="3clFbS" id="3v9$RrAcrjH" role="2VODD2">
                <node concept="3clFbF" id="3v9$RrAcrjI" role="3cqZAp">
                  <node concept="2YIFZM" id="3v9$RrAcrjJ" role="3clFbG">
                    <ref role="1Pybhc" to="urxu:6RTgCFCLoSE" resolve="Util" />
                    <ref role="37wK5l" to="urxu:4vSAr3EDjG_" resolve="getStaticColorField" />
                    <node concept="30H73N" id="3v9$RrAcrvu" role="37wK5m" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="4Fmodk11335" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:4Fmodk112XB" resolve="FileImage" />
      <node concept="gft3U" id="5aueixUZpnM" role="1lVwrX">
        <node concept="2ShNRf" id="5aueixUZq0s" role="gfFT$">
          <node concept="1pGfFk" id="5aueixUZq0t" role="2ShVmc">
            <ref role="37wK5l" to="6i10:~FileImage.&lt;init&gt;(java.lang.String)" resolve="FileImage" />
            <node concept="Xl_RD" id="5aueixUZq0u" role="37wK5m">
              <property role="Xl_RC" value="path/to/image" />
              <node concept="17Uvod" id="5aueixUZq0v" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                <node concept="3zFVjK" id="5aueixUZq0w" role="3zH0cK">
                  <node concept="3clFbS" id="5aueixUZq0x" role="2VODD2">
                    <node concept="3clFbF" id="5aueixUZq0y" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixUZq0z" role="3clFbG">
                        <node concept="3TrcHB" id="5aueixUZq0$" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:4Fmodk112ZP" resolve="path" />
                        </node>
                        <node concept="30H73N" id="5aueixUZq0_" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="4Fmodk11F3S" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:4Fmodk112E5" resolve="Ellipse" />
      <node concept="gft3U" id="5aueixUZpxu" role="1lVwrX">
        <node concept="2ShNRf" id="5aueixUZpwV" role="gfFT$">
          <node concept="1pGfFk" id="5aueixUZpwW" role="2ShVmc">
            <ref role="37wK5l" to="6i10:~Ellipse.&lt;init&gt;(double,double,java.awt.Color,boolean)" resolve="Ellipse" />
            <node concept="3b6qkQ" id="5aueixUZpwX" role="37wK5m">
              <property role="$nhwW" value="10.0" />
              <node concept="17Uvod" id="5aueixUZpwY" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="5aueixUZpwZ" role="3zH0cK">
                  <node concept="3clFbS" id="5aueixUZpx0" role="2VODD2">
                    <node concept="3clFbF" id="5aueixUZpx1" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixUZpx2" role="3clFbG">
                        <node concept="3TrcHB" id="5aueixUZpx3" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:4Fmodk11KFA" resolve="width" />
                        </node>
                        <node concept="30H73N" id="5aueixUZpx4" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3b6qkQ" id="5aueixUZpx5" role="37wK5m">
              <property role="$nhwW" value="10.0" />
              <node concept="17Uvod" id="5aueixUZpx6" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="5aueixUZpx7" role="3zH0cK">
                  <node concept="3clFbS" id="5aueixUZpx8" role="2VODD2">
                    <node concept="3clFbF" id="5aueixUZpx9" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixUZpxa" role="3clFbG">
                        <node concept="3TrcHB" id="5aueixUZpxb" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:4Fmodk11KFC" resolve="height" />
                        </node>
                        <node concept="30H73N" id="5aueixUZpxc" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="10M0yZ" id="3v9$RrAcs_S" role="37wK5m">
              <ref role="3cqZAo" to="z60i:~Color.WHITE" resolve="WHITE" />
              <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
              <node concept="29HgVG" id="3v9$RrAcsDa" role="lGtFl">
                <node concept="3NFfHV" id="3v9$RrAcsDb" role="3NFExx">
                  <node concept="3clFbS" id="3v9$RrAcsDc" role="2VODD2">
                    <node concept="3clFbF" id="3v9$RrAcsDi" role="3cqZAp">
                      <node concept="2OqwBi" id="3v9$RrAcsDd" role="3clFbG">
                        <node concept="3TrEf2" id="3v9$RrAcsDg" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:2zOT$_1soRR" resolve="color" />
                        </node>
                        <node concept="30H73N" id="3v9$RrAcsDh" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbT" id="1tFQO7bJSVz" role="37wK5m">
              <property role="3clFbU" value="true" />
              <node concept="17Uvod" id="1tFQO7bJSV$" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068580123137/1068580123138" />
                <node concept="3zFVjK" id="1tFQO7bJSV_" role="3zH0cK">
                  <node concept="3clFbS" id="1tFQO7bJSVA" role="2VODD2">
                    <node concept="3clFbF" id="1tFQO7bJSVB" role="3cqZAp">
                      <node concept="2OqwBi" id="1tFQO7bJSVC" role="3clFbG">
                        <node concept="30H73N" id="1tFQO7bJSVD" role="2Oq$k0" />
                        <node concept="2qgKlT" id="1tFQO7bJSVE" role="2OqNvi">
                          <ref role="37wK5l" to="62hf:1tFQO7bErnw" resolve="isFilled" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="2zOT$_1thb$" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:2zOT$_1s4hf" resolve="Circle" />
      <node concept="gft3U" id="24qcwCbhkqt" role="1lVwrX">
        <node concept="2ShNRf" id="24qcwCbhkrl" role="gfFT$">
          <node concept="1pGfFk" id="24qcwCbhkCJ" role="2ShVmc">
            <ref role="37wK5l" to="6i10:~Circle.&lt;init&gt;(double,java.awt.Color,boolean)" resolve="Circle" />
            <node concept="3b6qkQ" id="24qcwCbhTWa" role="37wK5m">
              <property role="$nhwW" value="10.0" />
              <node concept="17Uvod" id="24qcwCbhTZm" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="24qcwCbhTZp" role="3zH0cK">
                  <node concept="3clFbS" id="24qcwCbhTZq" role="2VODD2">
                    <node concept="3clFbF" id="24qcwCbhTZw" role="3cqZAp">
                      <node concept="2OqwBi" id="24qcwCbhTZr" role="3clFbG">
                        <node concept="3TrcHB" id="24qcwCbhTZu" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:2zOT$_1s4hp" resolve="radius" />
                        </node>
                        <node concept="30H73N" id="24qcwCbhTZv" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="10M0yZ" id="3v9$RrAcsI4" role="37wK5m">
              <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
              <ref role="3cqZAo" to="z60i:~Color.WHITE" resolve="WHITE" />
              <node concept="29HgVG" id="3v9$RrAcsI5" role="lGtFl">
                <node concept="3NFfHV" id="3v9$RrAcsI6" role="3NFExx">
                  <node concept="3clFbS" id="3v9$RrAcsI7" role="2VODD2">
                    <node concept="3clFbF" id="3v9$RrAcsI8" role="3cqZAp">
                      <node concept="2OqwBi" id="3v9$RrAcsI9" role="3clFbG">
                        <node concept="3TrEf2" id="3v9$RrAcsIa" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:2zOT$_1soRR" resolve="color" />
                        </node>
                        <node concept="30H73N" id="3v9$RrAcsIb" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbT" id="1tFQO7bJQTE" role="37wK5m">
              <property role="3clFbU" value="true" />
              <node concept="17Uvod" id="1tFQO7bJQTF" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068580123137/1068580123138" />
                <node concept="3zFVjK" id="1tFQO7bJQTG" role="3zH0cK">
                  <node concept="3clFbS" id="1tFQO7bJQTH" role="2VODD2">
                    <node concept="3clFbF" id="1tFQO7bJQTI" role="3cqZAp">
                      <node concept="2OqwBi" id="1tFQO7bJQTJ" role="3clFbG">
                        <node concept="30H73N" id="1tFQO7bJQTK" role="2Oq$k0" />
                        <node concept="2qgKlT" id="1tFQO7bJQTL" role="2OqNvi">
                          <ref role="37wK5l" to="62hf:1tFQO7bErnw" resolve="isFilled" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="2zOT$_1thbC" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:4Fmodk112HB" resolve="Rectangle" />
      <node concept="gft3U" id="5aueixUZp5J" role="1lVwrX">
        <node concept="2ShNRf" id="5aueixUZp5l" role="gfFT$">
          <node concept="1pGfFk" id="5aueixUZp5m" role="2ShVmc">
            <ref role="37wK5l" to="6i10:~Rectangle.&lt;init&gt;(double,double,java.awt.Color,boolean)" resolve="Rectangle" />
            <node concept="3b6qkQ" id="5aueixV3lAp" role="37wK5m">
              <property role="$nhwW" value="10.0" />
              <node concept="17Uvod" id="5aueixV3lGZ" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="5aueixV3lH2" role="3zH0cK">
                  <node concept="3clFbS" id="5aueixV3lH3" role="2VODD2">
                    <node concept="3clFbF" id="5aueixV3lH9" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixV3lH4" role="3clFbG">
                        <node concept="3TrcHB" id="5aueixV3lH7" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:4Fmodk11KFA" resolve="width" />
                        </node>
                        <node concept="30H73N" id="5aueixV3lH8" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3b6qkQ" id="5aueixV35v$" role="37wK5m">
              <property role="$nhwW" value="10.0" />
              <node concept="17Uvod" id="5aueixV35P8" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="5aueixV35Pb" role="3zH0cK">
                  <node concept="3clFbS" id="5aueixV35Pc" role="2VODD2">
                    <node concept="3clFbF" id="5aueixV35Pi" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixV35Pd" role="3clFbG">
                        <node concept="3TrcHB" id="5aueixV3fvd" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:4Fmodk11KFC" resolve="height" />
                        </node>
                        <node concept="30H73N" id="5aueixV35Ph" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="10M0yZ" id="3v9$RrActfe" role="37wK5m">
              <ref role="3cqZAo" to="z60i:~Color.WHITE" resolve="WHITE" />
              <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
              <node concept="29HgVG" id="3v9$RrActff" role="lGtFl">
                <node concept="3NFfHV" id="3v9$RrActfg" role="3NFExx">
                  <node concept="3clFbS" id="3v9$RrActfh" role="2VODD2">
                    <node concept="3clFbF" id="3v9$RrActfi" role="3cqZAp">
                      <node concept="2OqwBi" id="3v9$RrActfj" role="3clFbG">
                        <node concept="3TrEf2" id="3v9$RrActfk" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:2zOT$_1soRR" resolve="color" />
                        </node>
                        <node concept="30H73N" id="3v9$RrActfl" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbT" id="1tFQO7bJReq" role="37wK5m">
              <property role="3clFbU" value="true" />
              <node concept="17Uvod" id="1tFQO7bJRer" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068580123137/1068580123138" />
                <node concept="3zFVjK" id="1tFQO7bJRes" role="3zH0cK">
                  <node concept="3clFbS" id="1tFQO7bJRet" role="2VODD2">
                    <node concept="3clFbF" id="1tFQO7bJReu" role="3cqZAp">
                      <node concept="2OqwBi" id="1tFQO7bJRev" role="3clFbG">
                        <node concept="30H73N" id="1tFQO7bJRew" role="2Oq$k0" />
                        <node concept="2qgKlT" id="1tFQO7bJRex" role="2OqNvi">
                          <ref role="37wK5l" to="62hf:1tFQO7bErnw" resolve="isFilled" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="5aueixV33Fk" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:2zOT$_1s4hr" resolve="Square" />
      <node concept="gft3U" id="5aueixV33Fl" role="1lVwrX">
        <node concept="2ShNRf" id="5aueixV33Fm" role="gfFT$">
          <node concept="1pGfFk" id="5aueixV33Fn" role="2ShVmc">
            <ref role="37wK5l" to="6i10:~Square.&lt;init&gt;(double,java.awt.Color,boolean)" resolve="Square" />
            <node concept="3b6qkQ" id="5aueixV33Fo" role="37wK5m">
              <property role="$nhwW" value="10.0" />
              <node concept="17Uvod" id="5aueixV33Fp" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="5aueixV33Fq" role="3zH0cK">
                  <node concept="3clFbS" id="5aueixV33Fr" role="2VODD2">
                    <node concept="3clFbF" id="5aueixV33Fs" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixV33Ft" role="3clFbG">
                        <node concept="3TrcHB" id="5aueixV33Fu" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:2zOT$_1s4hs" resolve="size" />
                        </node>
                        <node concept="30H73N" id="5aueixV33Fv" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="10M0yZ" id="3v9$RrActrZ" role="37wK5m">
              <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
              <ref role="3cqZAo" to="z60i:~Color.WHITE" resolve="WHITE" />
              <node concept="29HgVG" id="3v9$RrActs0" role="lGtFl">
                <node concept="3NFfHV" id="3v9$RrActs1" role="3NFExx">
                  <node concept="3clFbS" id="3v9$RrActs2" role="2VODD2">
                    <node concept="3clFbF" id="3v9$RrActs3" role="3cqZAp">
                      <node concept="2OqwBi" id="3v9$RrActs4" role="3clFbG">
                        <node concept="3TrEf2" id="3v9$RrActs5" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:2zOT$_1soRR" resolve="color" />
                        </node>
                        <node concept="30H73N" id="3v9$RrActs6" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbT" id="1tFQO7bJS1m" role="37wK5m">
              <property role="3clFbU" value="true" />
              <node concept="17Uvod" id="1tFQO7bJS1n" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068580123137/1068580123138" />
                <node concept="3zFVjK" id="1tFQO7bJS1o" role="3zH0cK">
                  <node concept="3clFbS" id="1tFQO7bJS1p" role="2VODD2">
                    <node concept="3clFbF" id="1tFQO7bJS1q" role="3cqZAp">
                      <node concept="2OqwBi" id="1tFQO7bJS1r" role="3clFbG">
                        <node concept="30H73N" id="1tFQO7bJS1s" role="2Oq$k0" />
                        <node concept="2qgKlT" id="1tFQO7bJS1t" role="2OqNvi">
                          <ref role="37wK5l" to="62hf:1tFQO7bErnw" resolve="isFilled" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="4Fmodk0WhSL" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:4Fmodk0Wimi" resolve="Line" />
      <node concept="gft3U" id="5aueixUZnvH" role="1lVwrX">
        <node concept="2ShNRf" id="5aueixUZnuK" role="gfFT$">
          <node concept="1pGfFk" id="5aueixUZnuL" role="2ShVmc">
            <ref role="37wK5l" to="6i10:~Line.&lt;init&gt;(double,double,double,double,java.awt.Color)" resolve="Line" />
            <node concept="3b6qkQ" id="5aueixUZnuM" role="37wK5m">
              <property role="$nhwW" value="0.0" />
              <node concept="17Uvod" id="5aueixUZnuN" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="5aueixUZnuO" role="3zH0cK">
                  <node concept="3clFbS" id="5aueixUZnuP" role="2VODD2">
                    <node concept="3clFbF" id="5aueixUZnuQ" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixV2gnE" role="3clFbG">
                        <node concept="2OqwBi" id="5aueixUZnuR" role="2Oq$k0">
                          <node concept="30H73N" id="5aueixUZnuS" role="2Oq$k0" />
                          <node concept="3TrEf2" id="5aueixV2g2i" role="2OqNvi">
                            <ref role="3Tt5mk" to="i5hu:5aueixV2d$H" resolve="from" />
                          </node>
                        </node>
                        <node concept="3TrcHB" id="5aueixV2gBB" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:5aueixV0xMH" resolve="x" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3b6qkQ" id="5aueixUZnuU" role="37wK5m">
              <property role="$nhwW" value="0.0" />
              <node concept="17Uvod" id="5aueixUZnuV" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="5aueixUZnuW" role="3zH0cK">
                  <node concept="3clFbS" id="5aueixUZnuX" role="2VODD2">
                    <node concept="3clFbF" id="5aueixUZnuY" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixV2h5$" role="3clFbG">
                        <node concept="2OqwBi" id="5aueixUZnuZ" role="2Oq$k0">
                          <node concept="3TrEf2" id="5aueixV2gKc" role="2OqNvi">
                            <ref role="3Tt5mk" to="i5hu:5aueixV2d$H" resolve="from" />
                          </node>
                          <node concept="30H73N" id="5aueixUZnv1" role="2Oq$k0" />
                        </node>
                        <node concept="3TrcHB" id="5aueixV2hl8" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:5aueixV0xNU" resolve="y" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3b6qkQ" id="5aueixUZnv2" role="37wK5m">
              <property role="$nhwW" value="0.0" />
              <node concept="17Uvod" id="5aueixUZnv3" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="5aueixUZnv4" role="3zH0cK">
                  <node concept="3clFbS" id="5aueixUZnv5" role="2VODD2">
                    <node concept="3clFbF" id="5aueixUZnv6" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixV2hyI" role="3clFbG">
                        <node concept="2OqwBi" id="5aueixUZnv7" role="2Oq$k0">
                          <node concept="30H73N" id="5aueixUZnv8" role="2Oq$k0" />
                          <node concept="3TrEf2" id="5aueixV2htk" role="2OqNvi">
                            <ref role="3Tt5mk" to="i5hu:5aueixV2d_U" resolve="to" />
                          </node>
                        </node>
                        <node concept="3TrcHB" id="5aueixV2hMt" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:5aueixV0xMH" resolve="x" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3b6qkQ" id="5aueixUZnva" role="37wK5m">
              <property role="$nhwW" value="0.0" />
              <node concept="17Uvod" id="5aueixUZnvb" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="5aueixUZnvc" role="3zH0cK">
                  <node concept="3clFbS" id="5aueixUZnvd" role="2VODD2">
                    <node concept="3clFbF" id="5aueixUZnve" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixV2ifV" role="3clFbG">
                        <node concept="2OqwBi" id="5aueixUZnvf" role="2Oq$k0">
                          <node concept="3TrEf2" id="5aueixV2i6p" role="2OqNvi">
                            <ref role="3Tt5mk" to="i5hu:5aueixV2d_U" resolve="to" />
                          </node>
                          <node concept="30H73N" id="5aueixUZnvh" role="2Oq$k0" />
                        </node>
                        <node concept="3TrcHB" id="5aueixV2ih7" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:5aueixV0xNU" resolve="y" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="10M0yZ" id="3v9$RrActWJ" role="37wK5m">
              <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
              <ref role="3cqZAo" to="z60i:~Color.WHITE" resolve="WHITE" />
              <node concept="29HgVG" id="3v9$RrActWK" role="lGtFl">
                <node concept="3NFfHV" id="3v9$RrActWL" role="3NFExx">
                  <node concept="3clFbS" id="3v9$RrActWM" role="2VODD2">
                    <node concept="3clFbF" id="3v9$RrActWN" role="3cqZAp">
                      <node concept="2OqwBi" id="3v9$RrActWO" role="3clFbG">
                        <node concept="3TrEf2" id="3v9$RrActWP" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:2zOT$_1soRR" resolve="color" />
                        </node>
                        <node concept="30H73N" id="3v9$RrActWQ" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3lhOvk" id="2zOT$_1sE0S" role="3lj3bC">
      <ref role="30HIoZ" to="i5hu:2zOT$_1s4h0" resolve="Canvas" />
      <ref role="3lhOvi" node="2zOT$_1sDZx" resolve="map_Canvas" />
    </node>
    <node concept="3aamgX" id="5aueixV0F9X" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:4Fmodk112zJ" resolve="Polygon" />
      <node concept="gft3U" id="5aueixV0F9Y" role="1lVwrX">
        <node concept="2ShNRf" id="5aueixV0F9Z" role="gfFT$">
          <node concept="1pGfFk" id="5aueixV0Fa0" role="2ShVmc">
            <ref role="37wK5l" to="6i10:~Polygon.&lt;init&gt;(java.awt.Color,boolean,kotlin.Pair...)" resolve="Polygon" />
            <node concept="10M0yZ" id="3v9$RrAcunQ" role="37wK5m">
              <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
              <ref role="3cqZAo" to="z60i:~Color.WHITE" resolve="WHITE" />
              <node concept="29HgVG" id="3v9$RrAcunR" role="lGtFl">
                <node concept="3NFfHV" id="3v9$RrAcunS" role="3NFExx">
                  <node concept="3clFbS" id="3v9$RrAcunT" role="2VODD2">
                    <node concept="3clFbF" id="3v9$RrAcunU" role="3cqZAp">
                      <node concept="2OqwBi" id="3v9$RrAcunV" role="3clFbG">
                        <node concept="3TrEf2" id="3v9$RrAcunW" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:2zOT$_1soRR" resolve="color" />
                        </node>
                        <node concept="30H73N" id="3v9$RrAcunX" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbT" id="5aueixV0Fao" role="37wK5m">
              <property role="3clFbU" value="true" />
              <node concept="17Uvod" id="5aueixV0Fap" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068580123137/1068580123138" />
                <node concept="3zFVjK" id="5aueixV0Faq" role="3zH0cK">
                  <node concept="3clFbS" id="5aueixV0Far" role="2VODD2">
                    <node concept="3clFbF" id="1tFQO7bIWfz" role="3cqZAp">
                      <node concept="2OqwBi" id="1tFQO7bJn2c" role="3clFbG">
                        <node concept="30H73N" id="1tFQO7bJmNe" role="2Oq$k0" />
                        <node concept="2qgKlT" id="1tFQO7bJnhr" role="2OqNvi">
                          <ref role="37wK5l" to="62hf:1tFQO7bErnw" resolve="isFilled" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="2ShNRf" id="5aueixV0NbR" role="37wK5m">
              <node concept="1pGfFk" id="5aueixV0Os3" role="2ShVmc">
                <ref role="37wK5l" to="v18h:~Pair.&lt;init&gt;(java.lang.Object,java.lang.Object)" resolve="Pair" />
                <node concept="3b6qkQ" id="5aueixV0OER" role="37wK5m">
                  <property role="$nhwW" value="0.0" />
                  <node concept="17Uvod" id="5aueixV0PU9" role="lGtFl">
                    <property role="2qtEX9" value="value" />
                    <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                    <node concept="3zFVjK" id="5aueixV0PUc" role="3zH0cK">
                      <node concept="3clFbS" id="5aueixV0PUd" role="2VODD2">
                        <node concept="3clFbF" id="5aueixV0PUj" role="3cqZAp">
                          <node concept="2OqwBi" id="5aueixV0PUe" role="3clFbG">
                            <node concept="3TrcHB" id="5aueixV0PUh" role="2OqNvi">
                              <ref role="3TsBF5" to="i5hu:5aueixV0xMH" resolve="x" />
                            </node>
                            <node concept="30H73N" id="5aueixV0PUi" role="2Oq$k0" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3b6qkQ" id="5aueixV0P5v" role="37wK5m">
                  <property role="$nhwW" value="0.0" />
                  <node concept="17Uvod" id="5aueixV0QeW" role="lGtFl">
                    <property role="2qtEX9" value="value" />
                    <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                    <node concept="3zFVjK" id="5aueixV0QeZ" role="3zH0cK">
                      <node concept="3clFbS" id="5aueixV0Qf0" role="2VODD2">
                        <node concept="3clFbF" id="5aueixV0Qf6" role="3cqZAp">
                          <node concept="2OqwBi" id="5aueixV0Qf1" role="3clFbG">
                            <node concept="3TrcHB" id="5aueixV0Qf4" role="2OqNvi">
                              <ref role="3TsBF5" to="i5hu:5aueixV0xNU" resolve="y" />
                            </node>
                            <node concept="30H73N" id="5aueixV0Qf5" role="2Oq$k0" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="1WS0z7" id="5aueixV0Pju" role="lGtFl">
                <node concept="3JmXsc" id="5aueixV0Pjx" role="3Jn$fo">
                  <node concept="3clFbS" id="5aueixV0Pjy" role="2VODD2">
                    <node concept="3clFbF" id="5aueixV0PjC" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixV0Pjz" role="3clFbG">
                        <node concept="3Tsc0h" id="5aueixV0PjA" role="2OqNvi">
                          <ref role="3TtcxE" to="i5hu:5aueixV0xSD" resolve="points" />
                        </node>
                        <node concept="30H73N" id="5aueixV0PjB" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="24qcwCbhPH2" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:4Fmodk112Sm" resolve="Triangle" />
      <node concept="gft3U" id="24qcwCbhPMS" role="1lVwrX">
        <node concept="2ShNRf" id="24qcwCbhPNK" role="gfFT$">
          <node concept="1pGfFk" id="24qcwCbhQbk" role="2ShVmc">
            <ref role="37wK5l" to="6i10:~Triangle.&lt;init&gt;(double,java.awt.Color,boolean)" resolve="Triangle" />
            <node concept="3b6qkQ" id="24qcwCbhQcT" role="37wK5m">
              <property role="$nhwW" value="10.0" />
              <node concept="17Uvod" id="24qcwCbhVEG" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="24qcwCbhVEJ" role="3zH0cK">
                  <node concept="3clFbS" id="24qcwCbhVEK" role="2VODD2">
                    <node concept="3clFbF" id="24qcwCbhVEQ" role="3cqZAp">
                      <node concept="2OqwBi" id="24qcwCbhVEL" role="3clFbG">
                        <node concept="3TrcHB" id="24qcwCbhVEO" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:24qcwCbhPIQ" resolve="leg" />
                        </node>
                        <node concept="30H73N" id="24qcwCbhVEP" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="10M0yZ" id="3v9$RrAcv82" role="37wK5m">
              <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
              <ref role="3cqZAo" to="z60i:~Color.WHITE" resolve="WHITE" />
              <node concept="29HgVG" id="3v9$RrAcv83" role="lGtFl">
                <node concept="3NFfHV" id="3v9$RrAcv84" role="3NFExx">
                  <node concept="3clFbS" id="3v9$RrAcv85" role="2VODD2">
                    <node concept="3clFbF" id="3v9$RrAcv86" role="3cqZAp">
                      <node concept="2OqwBi" id="3v9$RrAcv87" role="3clFbG">
                        <node concept="3TrEf2" id="3v9$RrAcv88" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:2zOT$_1soRR" resolve="color" />
                        </node>
                        <node concept="30H73N" id="3v9$RrAcv89" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbT" id="1tFQO7bJSic" role="37wK5m">
              <property role="3clFbU" value="true" />
              <node concept="17Uvod" id="1tFQO7bJSid" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068580123137/1068580123138" />
                <node concept="3zFVjK" id="1tFQO7bJSie" role="3zH0cK">
                  <node concept="3clFbS" id="1tFQO7bJSif" role="2VODD2">
                    <node concept="3clFbF" id="1tFQO7bJSig" role="3cqZAp">
                      <node concept="2OqwBi" id="1tFQO7bJSih" role="3clFbG">
                        <node concept="30H73N" id="1tFQO7bJSii" role="2Oq$k0" />
                        <node concept="2qgKlT" id="1tFQO7bJSij" role="2OqNvi">
                          <ref role="37wK5l" to="62hf:1tFQO7bErnw" resolve="isFilled" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="24qcwCbhV2T" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:4Fmodk112ND" resolve="Star" />
      <node concept="gft3U" id="24qcwCbhV2U" role="1lVwrX">
        <node concept="2ShNRf" id="24qcwCbhV2V" role="gfFT$">
          <node concept="1pGfFk" id="24qcwCbhV2W" role="2ShVmc">
            <ref role="37wK5l" to="6i10:~Star.&lt;init&gt;(double,java.awt.Color,boolean)" resolve="Star" />
            <node concept="3b6qkQ" id="24qcwCbhV2X" role="37wK5m">
              <property role="$nhwW" value="10.0" />
              <node concept="17Uvod" id="24qcwCbhW5p" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
                <node concept="3zFVjK" id="24qcwCbhW5s" role="3zH0cK">
                  <node concept="3clFbS" id="24qcwCbhW5t" role="2VODD2">
                    <node concept="3clFbF" id="24qcwCbhW5z" role="3cqZAp">
                      <node concept="2OqwBi" id="24qcwCbhW5u" role="3clFbG">
                        <node concept="3TrcHB" id="24qcwCbhW5x" role="2OqNvi">
                          <ref role="3TsBF5" to="i5hu:24qcwCbhVPa" resolve="size" />
                        </node>
                        <node concept="30H73N" id="24qcwCbhW5y" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="10M0yZ" id="3v9$RrAcvh5" role="37wK5m">
              <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
              <ref role="3cqZAo" to="z60i:~Color.WHITE" resolve="WHITE" />
              <node concept="29HgVG" id="3v9$RrAcvh6" role="lGtFl">
                <node concept="3NFfHV" id="3v9$RrAcvh7" role="3NFExx">
                  <node concept="3clFbS" id="3v9$RrAcvh8" role="2VODD2">
                    <node concept="3clFbF" id="3v9$RrAcvh9" role="3cqZAp">
                      <node concept="2OqwBi" id="3v9$RrAcvha" role="3clFbG">
                        <node concept="3TrEf2" id="3v9$RrAcvhb" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:2zOT$_1soRR" resolve="color" />
                        </node>
                        <node concept="30H73N" id="3v9$RrAcvhc" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbT" id="1tFQO7bJSCC" role="37wK5m">
              <property role="3clFbU" value="true" />
              <node concept="17Uvod" id="1tFQO7bJSCD" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068580123137/1068580123138" />
                <node concept="3zFVjK" id="1tFQO7bJSCE" role="3zH0cK">
                  <node concept="3clFbS" id="1tFQO7bJSCF" role="2VODD2">
                    <node concept="3clFbF" id="1tFQO7bJSCG" role="3cqZAp">
                      <node concept="2OqwBi" id="1tFQO7bJSCH" role="3clFbG">
                        <node concept="30H73N" id="1tFQO7bJSCI" role="2Oq$k0" />
                        <node concept="2qgKlT" id="1tFQO7bJSCJ" role="2OqNvi">
                          <ref role="37wK5l" to="62hf:1tFQO7bErnw" resolve="isFilled" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="5aueixUXRq4" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:24qcwCbhIu2" resolve="Besides" />
      <node concept="gft3U" id="5aueixUXRtb" role="1lVwrX">
        <node concept="2OqwBi" id="5aueixUZ6Oy" role="gfFT$">
          <node concept="2ShNRf" id="5aueixUXRu3" role="2Oq$k0">
            <node concept="1pGfFk" id="5aueixUXUfW" role="2ShVmc">
              <ref role="37wK5l" to="6i10:~Image.&lt;init&gt;(java.util.Collection)" resolve="Image" />
              <node concept="2ShNRf" id="5aueixUZ5q5" role="37wK5m">
                <node concept="Tc6Ow" id="5aueixUZ5N6" role="2ShVmc">
                  <node concept="3uibUv" id="5aueixUZ6uV" role="HW$YZ">
                    <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="29HgVG" id="5aueixUZ7jU" role="lGtFl">
              <node concept="3NFfHV" id="5aueixUZ7jV" role="3NFExx">
                <node concept="3clFbS" id="5aueixUZ7jW" role="2VODD2">
                  <node concept="3clFbF" id="5aueixUZ7k2" role="3cqZAp">
                    <node concept="2OqwBi" id="5aueixUZ7jX" role="3clFbG">
                      <node concept="3TrEf2" id="5aueixUZ7k0" role="2OqNvi">
                        <ref role="3Tt5mk" to="i5hu:24qcwCbhIdH" resolve="left" />
                      </node>
                      <node concept="30H73N" id="5aueixUZ7k1" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="liA8E" id="5aueixUZ6Za" role="2OqNvi">
            <ref role="37wK5l" to="6i10:~Image.besides(org.golchin.Image)" resolve="besides" />
            <node concept="2ShNRf" id="5aueixUZ7a9" role="37wK5m">
              <node concept="1pGfFk" id="5aueixUZ7aa" role="2ShVmc">
                <ref role="37wK5l" to="6i10:~Image.&lt;init&gt;(java.util.Collection)" resolve="Image" />
                <node concept="2ShNRf" id="5aueixUZ7ab" role="37wK5m">
                  <node concept="Tc6Ow" id="5aueixUZ7ac" role="2ShVmc">
                    <node concept="3uibUv" id="5aueixUZ7ad" role="HW$YZ">
                      <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="29HgVG" id="5aueixUZ7GX" role="lGtFl">
                <node concept="3NFfHV" id="5aueixUZ7GY" role="3NFExx">
                  <node concept="3clFbS" id="5aueixUZ7GZ" role="2VODD2">
                    <node concept="3clFbF" id="5aueixUZ7H5" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixUZ7H0" role="3clFbG">
                        <node concept="3TrEf2" id="5aueixUZ7H3" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:24qcwCbhImw" resolve="right" />
                        </node>
                        <node concept="30H73N" id="5aueixUZ7H4" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="5aueixUZOiv" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:5aueixUZMvC" resolve="Behind" />
      <node concept="gft3U" id="5aueixUZOiw" role="1lVwrX">
        <node concept="2OqwBi" id="5aueixUZOix" role="gfFT$">
          <node concept="2ShNRf" id="5aueixUZOiy" role="2Oq$k0">
            <node concept="1pGfFk" id="5aueixUZOiz" role="2ShVmc">
              <ref role="37wK5l" to="6i10:~Image.&lt;init&gt;(java.util.Collection)" resolve="Image" />
              <node concept="2ShNRf" id="5aueixUZOi$" role="37wK5m">
                <node concept="Tc6Ow" id="5aueixUZOi_" role="2ShVmc">
                  <node concept="3uibUv" id="5aueixUZOiA" role="HW$YZ">
                    <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="29HgVG" id="5aueixUZOiB" role="lGtFl">
              <node concept="3NFfHV" id="5aueixUZOiC" role="3NFExx">
                <node concept="3clFbS" id="5aueixUZOiD" role="2VODD2">
                  <node concept="3clFbF" id="5aueixUZOiE" role="3cqZAp">
                    <node concept="2OqwBi" id="5aueixUZOiF" role="3clFbG">
                      <node concept="3TrEf2" id="5aueixUZOiG" role="2OqNvi">
                        <ref role="3Tt5mk" to="i5hu:24qcwCbhIdH" resolve="left" />
                      </node>
                      <node concept="30H73N" id="5aueixUZOiH" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="liA8E" id="5aueixUZOiI" role="2OqNvi">
            <ref role="37wK5l" to="6i10:~Image.behind(org.golchin.Image)" resolve="behind" />
            <node concept="2ShNRf" id="5aueixUZOiJ" role="37wK5m">
              <node concept="1pGfFk" id="5aueixUZOiK" role="2ShVmc">
                <ref role="37wK5l" to="6i10:~Image.&lt;init&gt;(java.util.Collection)" resolve="Image" />
                <node concept="2ShNRf" id="5aueixUZOiL" role="37wK5m">
                  <node concept="Tc6Ow" id="5aueixUZOiM" role="2ShVmc">
                    <node concept="3uibUv" id="5aueixUZOiN" role="HW$YZ">
                      <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="29HgVG" id="5aueixUZOiO" role="lGtFl">
                <node concept="3NFfHV" id="5aueixUZOiP" role="3NFExx">
                  <node concept="3clFbS" id="5aueixUZOiQ" role="2VODD2">
                    <node concept="3clFbF" id="5aueixUZOiR" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixUZOiS" role="3clFbG">
                        <node concept="3TrEf2" id="5aueixUZOiT" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:24qcwCbhImw" resolve="right" />
                        </node>
                        <node concept="30H73N" id="5aueixUZOiU" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="5aueixUZODc" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:5aueixUZMAy" resolve="Above" />
      <node concept="gft3U" id="5aueixUZODd" role="1lVwrX">
        <node concept="2OqwBi" id="5aueixUZODe" role="gfFT$">
          <node concept="2ShNRf" id="5aueixUZODf" role="2Oq$k0">
            <node concept="1pGfFk" id="5aueixUZODg" role="2ShVmc">
              <ref role="37wK5l" to="6i10:~Image.&lt;init&gt;(java.util.Collection)" resolve="Image" />
              <node concept="2ShNRf" id="5aueixUZODh" role="37wK5m">
                <node concept="Tc6Ow" id="5aueixUZODi" role="2ShVmc">
                  <node concept="3uibUv" id="5aueixUZODj" role="HW$YZ">
                    <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="29HgVG" id="5aueixUZODk" role="lGtFl">
              <node concept="3NFfHV" id="5aueixUZODl" role="3NFExx">
                <node concept="3clFbS" id="5aueixUZODm" role="2VODD2">
                  <node concept="3clFbF" id="5aueixUZODn" role="3cqZAp">
                    <node concept="2OqwBi" id="5aueixUZODo" role="3clFbG">
                      <node concept="3TrEf2" id="5aueixUZODp" role="2OqNvi">
                        <ref role="3Tt5mk" to="i5hu:24qcwCbhIdH" resolve="left" />
                      </node>
                      <node concept="30H73N" id="5aueixUZODq" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="liA8E" id="5aueixUZODr" role="2OqNvi">
            <ref role="37wK5l" to="6i10:~Image.above(org.golchin.Image)" resolve="above" />
            <node concept="2ShNRf" id="5aueixUZODs" role="37wK5m">
              <node concept="1pGfFk" id="5aueixUZODt" role="2ShVmc">
                <ref role="37wK5l" to="6i10:~Image.&lt;init&gt;(java.util.Collection)" resolve="Image" />
                <node concept="2ShNRf" id="5aueixUZODu" role="37wK5m">
                  <node concept="Tc6Ow" id="5aueixUZODv" role="2ShVmc">
                    <node concept="3uibUv" id="5aueixUZODw" role="HW$YZ">
                      <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="29HgVG" id="5aueixUZODx" role="lGtFl">
                <node concept="3NFfHV" id="5aueixUZODy" role="3NFExx">
                  <node concept="3clFbS" id="5aueixUZODz" role="2VODD2">
                    <node concept="3clFbF" id="5aueixUZOD$" role="3cqZAp">
                      <node concept="2OqwBi" id="5aueixUZOD_" role="3clFbG">
                        <node concept="3TrEf2" id="5aueixUZODA" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:24qcwCbhImw" resolve="right" />
                        </node>
                        <node concept="30H73N" id="5aueixUZODB" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1tFQO7bz7Rw" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7bz2fl" resolve="Translate" />
      <node concept="gft3U" id="1tFQO7bzaxn" role="1lVwrX">
        <node concept="2YIFZM" id="1tFQO7bzaFM" role="gfFT$">
          <ref role="37wK5l" to="6i10:~TransformsKt.translate(double,double)" resolve="translate" />
          <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
          <node concept="3b6qkQ" id="1tFQO7bzbmJ" role="37wK5m">
            <property role="$nhwW" value="10.0" />
            <node concept="17Uvod" id="1tFQO7bzbvw" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzbvx" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzbvy" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzb_$" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzeJU" role="3clFbG">
                      <node concept="30H73N" id="1tFQO7bzezk" role="2Oq$k0" />
                      <node concept="3TrcHB" id="1tFQO7bzeL0" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bzdYK" resolve="x" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3b6qkQ" id="1tFQO7bzbpQ" role="37wK5m">
            <property role="$nhwW" value="10.0" />
            <node concept="17Uvod" id="1tFQO7bzeTQ" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzeTT" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzeTU" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzeU0" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzeTV" role="3clFbG">
                      <node concept="3TrcHB" id="1tFQO7bzeTY" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bzdZ$" resolve="y" />
                      </node>
                      <node concept="30H73N" id="1tFQO7bzeTZ" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1tFQO7bzeYL" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7bz38p" resolve="Rotate" />
      <node concept="gft3U" id="1tFQO7bzeYM" role="1lVwrX">
        <node concept="2YIFZM" id="1tFQO7bzgsN" role="gfFT$">
          <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
          <ref role="37wK5l" to="6i10:~TransformsKt.rotate(double,double,double)" resolve="rotate" />
          <node concept="3b6qkQ" id="1tFQO7bzhVc" role="37wK5m">
            <property role="$nhwW" value="10.0" />
            <node concept="17Uvod" id="1tFQO7bzjRk" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzjRl" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzjRm" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzjZD" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzkBg" role="3clFbG">
                      <node concept="2OqwBi" id="1tFQO7bzkcB" role="2Oq$k0">
                        <node concept="30H73N" id="1tFQO7bzjZC" role="2Oq$k0" />
                        <node concept="3TrEf2" id="1tFQO7bzkrv" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:1tFQO7bzhvU" resolve="center" />
                        </node>
                      </node>
                      <node concept="3TrcHB" id="1tFQO7bzkKr" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:5aueixV0xMH" resolve="x" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3b6qkQ" id="1tFQO7bzi14" role="37wK5m">
            <property role="$nhwW" value="10.0" />
            <node concept="17Uvod" id="1tFQO7bzm3F" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzm3G" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzm3H" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzmep" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzmVX" role="3clFbG">
                      <node concept="2OqwBi" id="1tFQO7bzmrn" role="2Oq$k0">
                        <node concept="30H73N" id="1tFQO7bzmeo" role="2Oq$k0" />
                        <node concept="3TrEf2" id="1tFQO7bzmJW" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:1tFQO7bzhvU" resolve="center" />
                        </node>
                      </node>
                      <node concept="3TrcHB" id="1tFQO7bznbo" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:5aueixV0xNU" resolve="y" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3b6qkQ" id="1tFQO7bzgsO" role="37wK5m">
            <property role="$nhwW" value="10.0" />
            <node concept="17Uvod" id="1tFQO7bzgsP" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzgsQ" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzgsR" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzgsS" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzgsT" role="3clFbG">
                      <node concept="30H73N" id="1tFQO7bzgsU" role="2Oq$k0" />
                      <node concept="3TrcHB" id="1tFQO7bzgVd" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bz3c0" resolve="angle" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="30G5F_" id="1tFQO7bzkVx" role="30HLyM">
        <node concept="3clFbS" id="1tFQO7bzkVy" role="2VODD2">
          <node concept="3clFbF" id="1tFQO7bzl26" role="3cqZAp">
            <node concept="3y3z36" id="1tFQO7bzlH6" role="3clFbG">
              <node concept="10Nm6u" id="1tFQO7bzlT0" role="3uHU7w" />
              <node concept="2OqwBi" id="1tFQO7bzlgz" role="3uHU7B">
                <node concept="30H73N" id="1tFQO7bzl25" role="2Oq$k0" />
                <node concept="3TrEf2" id="1tFQO7bzlrx" role="2OqNvi">
                  <ref role="3Tt5mk" to="i5hu:1tFQO7bzhvU" resolve="center" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1tFQO7bznfP" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7bz38p" resolve="Rotate" />
      <node concept="gft3U" id="1tFQO7bznfQ" role="1lVwrX">
        <node concept="2YIFZM" id="1tFQO7bznfR" role="gfFT$">
          <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
          <ref role="37wK5l" to="6i10:~TransformsKt.rotate(double)" resolve="rotate" />
          <node concept="3b6qkQ" id="1tFQO7bzngc" role="37wK5m">
            <property role="$nhwW" value="10.0" />
            <node concept="17Uvod" id="1tFQO7bzngd" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bznge" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzngf" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzngg" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzngh" role="3clFbG">
                      <node concept="30H73N" id="1tFQO7bzngi" role="2Oq$k0" />
                      <node concept="3TrcHB" id="1tFQO7bzngj" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bz3c0" resolve="angle" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="30G5F_" id="1tFQO7bzngk" role="30HLyM">
        <node concept="3clFbS" id="1tFQO7bzngl" role="2VODD2">
          <node concept="3clFbF" id="1tFQO7bzngm" role="3cqZAp">
            <node concept="3clFbC" id="1tFQO7bzorc" role="3clFbG">
              <node concept="2OqwBi" id="1tFQO7bzngp" role="3uHU7B">
                <node concept="30H73N" id="1tFQO7bzngq" role="2Oq$k0" />
                <node concept="3TrEf2" id="1tFQO7bzngr" role="2OqNvi">
                  <ref role="3Tt5mk" to="i5hu:1tFQO7bzhvU" resolve="center" />
                </node>
              </node>
              <node concept="10Nm6u" id="1tFQO7bzngo" role="3uHU7w" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1tFQO7bzoGd" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7bz3eo" resolve="Scale" />
      <node concept="gft3U" id="1tFQO7bzoGe" role="1lVwrX">
        <node concept="2YIFZM" id="1tFQO7bzrb7" role="gfFT$">
          <ref role="37wK5l" to="6i10:~TransformsKt.scale(double,double)" resolve="scale" />
          <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
          <node concept="3b6qkQ" id="1tFQO7bzrb8" role="37wK5m">
            <property role="$nhwW" value="10.0" />
            <node concept="17Uvod" id="1tFQO7bzrb9" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzrba" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzrbb" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzrbc" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzrbd" role="3clFbG">
                      <node concept="30H73N" id="1tFQO7bzrbe" role="2Oq$k0" />
                      <node concept="3TrcHB" id="1tFQO7bzrp9" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bz3ep" resolve="scaleX" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="17Uvod" id="1tFQO7bzrEt" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzrEu" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzrEv" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzrEw" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzrEx" role="3clFbG">
                      <node concept="30H73N" id="1tFQO7bzrEy" role="2Oq$k0" />
                      <node concept="3TrcHB" id="1tFQO7bzrEz" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bz3ep" resolve="scaleX" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3b6qkQ" id="1tFQO7bzrZm" role="37wK5m">
            <property role="$nhwW" value="10.0" />
            <node concept="17Uvod" id="1tFQO7bzsa9" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzsac" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzsad" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzsaj" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzsae" role="3clFbG">
                      <node concept="3TrcHB" id="1tFQO7bzsah" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bz3hZ" resolve="scaleY" />
                      </node>
                      <node concept="30H73N" id="1tFQO7bzsai" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1tFQO7bzse2" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7bz3Po" resolve="HorizontalMirror" />
      <node concept="gft3U" id="1tFQO7bzse3" role="1lVwrX">
        <node concept="2YIFZM" id="1tFQO7bzusH" role="gfFT$">
          <ref role="37wK5l" to="6i10:~TransformsKt.getHorizontalMirror()" resolve="getHorizontalMirror" />
          <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1tFQO7bzuGX" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7bz3En" resolve="VerticalMirror" />
      <node concept="gft3U" id="1tFQO7bzuGY" role="1lVwrX">
        <node concept="2YIFZM" id="1tFQO7b$qHV" role="gfFT$">
          <ref role="37wK5l" to="6i10:~TransformsKt.getVerticalMirror()" resolve="getVerticalMirror" />
          <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1tFQO7bzwZo" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7bzzlQ" resolve="ShearX" />
      <node concept="gft3U" id="1tFQO7bzwZp" role="1lVwrX">
        <node concept="2YIFZM" id="1tFQO7bzyQo" role="gfFT$">
          <ref role="37wK5l" to="6i10:~TransformsKt.shearX(double)" resolve="shearX" />
          <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
          <node concept="3b6qkQ" id="1tFQO7bzCgu" role="37wK5m">
            <property role="$nhwW" value="10.0" />
            <node concept="17Uvod" id="1tFQO7bzCiT" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzCiW" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzCiX" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzCj3" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzCiY" role="3clFbG">
                      <node concept="3TrcHB" id="1tFQO7bzFLp" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bz3lX" resolve="factor" />
                      </node>
                      <node concept="30H73N" id="1tFQO7bzCj2" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1tFQO7bzCr7" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7bz$CC" resolve="ShearY" />
      <node concept="gft3U" id="1tFQO7bzCr8" role="1lVwrX">
        <node concept="2YIFZM" id="1tFQO7bzFai" role="gfFT$">
          <ref role="37wK5l" to="6i10:~TransformsKt.shearY(double)" resolve="shearY" />
          <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
          <node concept="3b6qkQ" id="1tFQO7bzFaj" role="37wK5m">
            <property role="$nhwW" value="10.0" />
            <node concept="17Uvod" id="1tFQO7bzFak" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzFal" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzFam" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzFan" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzFao" role="3clFbG">
                      <node concept="3TrcHB" id="1tFQO7bzGe3" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bz3lX" resolve="factor" />
                      </node>
                      <node concept="30H73N" id="1tFQO7bzFaq" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1tFQO7bzGsy" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7bz4eB" resolve="ClipOrCrop" />
      <node concept="gft3U" id="1tFQO7bzGsz" role="1lVwrX">
        <node concept="2YIFZM" id="1tFQO7bzJ4k" role="gfFT$">
          <ref role="37wK5l" to="6i10:~TransformsKt.clipOrCrop(double,double,double,double,boolean)" resolve="clipOrCrop" />
          <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
          <node concept="3b6qkQ" id="1tFQO7bzJ4l" role="37wK5m">
            <property role="$nhwW" value="10.0" />
            <node concept="17Uvod" id="1tFQO7bzJ4m" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzJ4n" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzJ4o" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzJ4p" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzJ4q" role="3clFbG">
                      <node concept="3TrcHB" id="1tFQO7bzJjn" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bz4oS" resolve="upperLeftX" />
                      </node>
                      <node concept="30H73N" id="1tFQO7bzJ4s" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3b6qkQ" id="1tFQO7bzMw1" role="37wK5m">
            <property role="$nhwW" value="1.0" />
            <node concept="17Uvod" id="1tFQO7bzN60" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzN63" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzN64" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzN6a" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzN65" role="3clFbG">
                      <node concept="3TrcHB" id="1tFQO7bzN68" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bz4rD" resolve="upperLeftY" />
                      </node>
                      <node concept="30H73N" id="1tFQO7bzN69" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3b6qkQ" id="1tFQO7bzMDI" role="37wK5m">
            <property role="$nhwW" value="1.0" />
            <node concept="17Uvod" id="1tFQO7bzN8O" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzN8R" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzN8S" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzN8Y" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzN8T" role="3clFbG">
                      <node concept="3TrcHB" id="1tFQO7bzN8W" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bz4u2" resolve="width" />
                      </node>
                      <node concept="30H73N" id="1tFQO7bzN8X" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3b6qkQ" id="1tFQO7bzMFV" role="37wK5m">
            <property role="$nhwW" value="1.0" />
            <node concept="17Uvod" id="1tFQO7bzNcW" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1111509017652/1113006610751" />
              <node concept="3zFVjK" id="1tFQO7bzNcZ" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzNd0" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzNd6" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzNd1" role="3clFbG">
                      <node concept="3TrcHB" id="1tFQO7bzNd4" role="2OqNvi">
                        <ref role="3TsBF5" to="i5hu:1tFQO7bz4vh" resolve="height" />
                      </node>
                      <node concept="30H73N" id="1tFQO7bzNd5" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbT" id="1tFQO7bzMWV" role="37wK5m">
            <property role="3clFbU" value="true" />
            <node concept="17Uvod" id="1tFQO7bzNnt" role="lGtFl">
              <property role="2qtEX9" value="value" />
              <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068580123137/1068580123138" />
              <node concept="3zFVjK" id="1tFQO7bzNnw" role="3zH0cK">
                <node concept="3clFbS" id="1tFQO7bzNnx" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7bzNnB" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7bzNny" role="3clFbG">
                      <node concept="1mIQ4w" id="4q8PBg1ZLiw" role="2OqNvi">
                        <node concept="chp4Y" id="4q8PBg1ZLnf" role="cj9EA">
                          <ref role="cht4Q" to="i5hu:4q8PBg1ZI7a" resolve="Crop" />
                        </node>
                      </node>
                      <node concept="30H73N" id="1tFQO7bzNnA" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1tFQO7b_Sul" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7b_OKE" resolve="Bbox" />
      <node concept="gft3U" id="1tFQO7b_Sum" role="1lVwrX">
        <node concept="2YIFZM" id="1tFQO7b_USg" role="gfFT$">
          <ref role="37wK5l" to="6i10:~TransformsKt.getBbox()" resolve="getBbox" />
          <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="4q8PBg2gha7" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7bz1Cj" resolve="Then" />
      <node concept="gft3U" id="4q8PBg2gha8" role="1lVwrX">
        <node concept="2YIFZM" id="4q8PBg2glui" role="gfFT$">
          <ref role="37wK5l" to="6i10:~TransformsKt.then(kotlin.jvm.functions.Function1,kotlin.jvm.functions.Function1)" resolve="then" />
          <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
          <node concept="2YIFZM" id="4q8PBg2gha9" role="37wK5m">
            <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
            <ref role="37wK5l" to="6i10:~TransformsKt.getBbox()" resolve="getBbox" />
            <node concept="29HgVG" id="4q8PBg2glT8" role="lGtFl">
              <node concept="3NFfHV" id="4q8PBg2glT9" role="3NFExx">
                <node concept="3clFbS" id="4q8PBg2glTa" role="2VODD2">
                  <node concept="3clFbF" id="4q8PBg2glTg" role="3cqZAp">
                    <node concept="2OqwBi" id="4q8PBg2glTb" role="3clFbG">
                      <node concept="3TrEf2" id="4q8PBg2glTe" role="2OqNvi">
                        <ref role="3Tt5mk" to="i5hu:1tFQO7bz1Re" resolve="left" />
                      </node>
                      <node concept="30H73N" id="4q8PBg2glTf" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2YIFZM" id="4q8PBg2glz6" role="37wK5m">
            <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
            <ref role="37wK5l" to="6i10:~TransformsKt.getBbox()" resolve="getBbox" />
            <node concept="29HgVG" id="4q8PBg2gm11" role="lGtFl">
              <node concept="3NFfHV" id="4q8PBg2gm12" role="3NFExx">
                <node concept="3clFbS" id="4q8PBg2gm13" role="2VODD2">
                  <node concept="3clFbF" id="4q8PBg2gm19" role="3cqZAp">
                    <node concept="2OqwBi" id="4q8PBg2gm14" role="3clFbG">
                      <node concept="3TrEf2" id="4q8PBg2gm17" role="2OqNvi">
                        <ref role="3Tt5mk" to="i5hu:1tFQO7bz1TA" resolve="right" />
                      </node>
                      <node concept="30H73N" id="4q8PBg2gm18" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1tFQO7b$Ze2" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:1tFQO7b$IWd" resolve="Transformed" />
      <node concept="gft3U" id="1tFQO7b$Ze3" role="1lVwrX">
        <node concept="2OqwBi" id="1tFQO7b_1Tf" role="gfFT$">
          <node concept="2YIFZM" id="1tFQO7b_1D7" role="2Oq$k0">
            <ref role="37wK5l" to="6i10:~TransformsKt.getVerticalMirror()" resolve="getVerticalMirror" />
            <ref role="1Pybhc" to="6i10:~TransformsKt" resolve="TransformsKt" />
            <node concept="29HgVG" id="1tFQO7b_2lD" role="lGtFl">
              <node concept="3NFfHV" id="1tFQO7b_2lE" role="3NFExx">
                <node concept="3clFbS" id="1tFQO7b_2lF" role="2VODD2">
                  <node concept="3clFbF" id="1tFQO7b_2lL" role="3cqZAp">
                    <node concept="2OqwBi" id="1tFQO7b_2lG" role="3clFbG">
                      <node concept="3TrEf2" id="1tFQO7b_2lJ" role="2OqNvi">
                        <ref role="3Tt5mk" to="i5hu:1tFQO7b$J4a" resolve="transform" />
                      </node>
                      <node concept="30H73N" id="1tFQO7b_2lK" role="2Oq$k0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="liA8E" id="1tFQO7b_2e5" role="2OqNvi">
            <ref role="37wK5l" to="ouht:~Function1.invoke(java.lang.Object)" resolve="invoke" />
            <node concept="10Nm6u" id="1tFQO7b_2hB" role="37wK5m">
              <node concept="29HgVG" id="1tFQO7b_2sm" role="lGtFl">
                <node concept="3NFfHV" id="1tFQO7b_2sn" role="3NFExx">
                  <node concept="3clFbS" id="1tFQO7b_2so" role="2VODD2">
                    <node concept="3clFbF" id="1tFQO7b_2su" role="3cqZAp">
                      <node concept="2OqwBi" id="1tFQO7b_2sp" role="3clFbG">
                        <node concept="3TrEf2" id="1tFQO7b_2ss" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:1tFQO7b$J1p" resolve="original" />
                        </node>
                        <node concept="30H73N" id="1tFQO7b_2st" role="2Oq$k0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="4q8PBg260QD" role="3acgRq">
      <ref role="30HIoZ" to="i5hu:7mguUt1XDmB" resolve="Reference" />
      <node concept="1Koe21" id="4q8PBg26LT0" role="1lVwrX">
        <node concept="9aQIb" id="4q8PBg26LTi" role="1Koe22">
          <node concept="3clFbS" id="4q8PBg26LTj" role="9aQI4">
            <node concept="3cpWs8" id="4q8PBg26LUn" role="3cqZAp">
              <node concept="3cpWsn" id="4q8PBg26LUo" role="3cpWs9">
                <property role="TrG5h" value="image" />
                <node concept="3uibUv" id="4q8PBg26MvG" role="1tU5fm">
                  <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
                </node>
                <node concept="2ShNRf" id="4q8PBg26LVf" role="33vP2m">
                  <node concept="1pGfFk" id="4q8PBg26Mlz" role="2ShVmc">
                    <ref role="37wK5l" to="6i10:~Star.&lt;init&gt;(double,java.awt.Color,boolean)" resolve="Star" />
                    <node concept="3b6qkQ" id="4q8PBg26Mm3" role="37wK5m">
                      <property role="$nhwW" value="10.0" />
                    </node>
                    <node concept="10M0yZ" id="4q8PBg26Mr7" role="37wK5m">
                      <ref role="3cqZAo" to="z60i:~Color.WHITE" resolve="WHITE" />
                      <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
                    </node>
                    <node concept="3clFbT" id="4q8PBg26Muu" role="37wK5m">
                      <property role="3clFbU" value="true" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbF" id="4q8PBg2f7gp" role="3cqZAp">
              <node concept="37vLTI" id="4q8PBg2f7mw" role="3clFbG">
                <node concept="37vLTw" id="4q8PBg2f7gn" role="37vLTJ">
                  <ref role="3cqZAo" node="4q8PBg26LUo" resolve="image" />
                </node>
                <node concept="37vLTw" id="4q8PBg28k7T" role="37vLTx">
                  <ref role="3cqZAo" node="4q8PBg26LUo" resolve="image" />
                  <node concept="raruj" id="4q8PBg28k7U" role="lGtFl" />
                  <node concept="1ZhdrF" id="4q8PBg28k7V" role="lGtFl">
                    <property role="2qtEX8" value="variableDeclaration" />
                    <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                    <node concept="3$xsQk" id="4q8PBg28k7W" role="3$ytzL">
                      <node concept="3clFbS" id="4q8PBg28k7X" role="2VODD2">
                        <node concept="3clFbF" id="4q8PBg28k7Y" role="3cqZAp">
                          <node concept="2OqwBi" id="4q8PBg28k7Z" role="3clFbG">
                            <node concept="1iwH7S" id="4q8PBg28k80" role="2Oq$k0" />
                            <node concept="1iwH70" id="4q8PBg28k81" role="2OqNvi">
                              <ref role="1iwH77" node="4q8PBg26OJb" resolve="LocalVar" />
                              <node concept="2OqwBi" id="4q8PBg28k82" role="1iwH7V">
                                <node concept="30H73N" id="4q8PBg28k83" role="2Oq$k0" />
                                <node concept="3TrEf2" id="7mguUt1YsUx" role="2OqNvi">
                                  <ref role="3Tt5mk" to="i5hu:7mguUt1XDo5" resolve="target" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="312cEu" id="2zOT$_1sDZx">
    <property role="TrG5h" value="map_Canvas" />
    <node concept="312cEg" id="4Fmodk0ZiBB" role="jymVt">
      <property role="TrG5h" value="image" />
      <property role="3TUv4t" value="true" />
      <node concept="3Tm6S6" id="4Fmodk0Zhvy" role="1B3o_S" />
      <node concept="3uibUv" id="4Fmodk0Zi$j" role="1tU5fm">
        <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
      </node>
    </node>
    <node concept="312cEg" id="4Fmodk0XC2m" role="jymVt">
      <property role="TrG5h" value="panel" />
      <node concept="3uibUv" id="4Fmodk0XBNL" role="1tU5fm">
        <ref role="3uigEE" to="dxuu:~JPanel" resolve="JPanel" />
      </node>
      <node concept="3Tm6S6" id="4Fmodk0XC9p" role="1B3o_S" />
      <node concept="2ShNRf" id="4Fmodk0XCO5" role="33vP2m">
        <node concept="YeOm9" id="4Fmodk0XEeI" role="2ShVmc">
          <node concept="1Y3b0j" id="4Fmodk0XEeL" role="YeSDq">
            <property role="2bfB8j" value="true" />
            <ref role="37wK5l" to="dxuu:~JPanel.&lt;init&gt;()" resolve="JPanel" />
            <ref role="1Y3XeK" to="dxuu:~JPanel" resolve="JPanel" />
            <node concept="2tJIrI" id="4Fmodk10iBT" role="jymVt" />
            <node concept="3Tm1VV" id="4Fmodk0XEeM" role="1B3o_S" />
            <node concept="3clFb_" id="4Fmodk0XEhR" role="jymVt">
              <property role="TrG5h" value="paintComponent" />
              <node concept="3Tmbuc" id="4Fmodk0XEhS" role="1B3o_S" />
              <node concept="3cqZAl" id="4Fmodk0XEhU" role="3clF45" />
              <node concept="37vLTG" id="4Fmodk0XEhV" role="3clF46">
                <property role="TrG5h" value="g" />
                <node concept="3uibUv" id="4Fmodk0XEhW" role="1tU5fm">
                  <ref role="3uigEE" to="z60i:~Graphics" resolve="Graphics" />
                </node>
              </node>
              <node concept="3clFbS" id="4Fmodk0XEi0" role="3clF47">
                <node concept="3clFbF" id="4Fmodk0XEi4" role="3cqZAp">
                  <node concept="3nyPlj" id="4Fmodk0XEi3" role="3clFbG">
                    <ref role="37wK5l" to="dxuu:~JComponent.paintComponent(java.awt.Graphics)" resolve="paintComponent" />
                    <node concept="37vLTw" id="4Fmodk0XEi2" role="37wK5m">
                      <ref role="3cqZAo" node="4Fmodk0XEhV" resolve="g" />
                    </node>
                  </node>
                </node>
                <node concept="3clFbF" id="4Fmodk0YctK" role="3cqZAp">
                  <node concept="2OqwBi" id="4Fmodk0Yd$L" role="3clFbG">
                    <node concept="liA8E" id="4Fmodk0YdGm" role="2OqNvi">
                      <ref role="37wK5l" to="6i10:~Image.draw(java.awt.Graphics2D)" resolve="draw" />
                      <node concept="10QFUN" id="4Fmodk0YsGD" role="37wK5m">
                        <node concept="3uibUv" id="4Fmodk0YvwG" role="10QFUM">
                          <ref role="3uigEE" to="z60i:~Graphics2D" resolve="Graphics2D" />
                        </node>
                        <node concept="37vLTw" id="4Fmodk0Ywxy" role="10QFUP">
                          <ref role="3cqZAo" node="4Fmodk0XEhV" resolve="g" />
                        </node>
                      </node>
                    </node>
                    <node concept="2OqwBi" id="4Fmodk0ZzSv" role="2Oq$k0">
                      <node concept="Xjq3P" id="4Fmodk0ZzSw" role="2Oq$k0">
                        <ref role="1HBi2w" node="2zOT$_1sDZx" resolve="map_Canvas" />
                      </node>
                      <node concept="2OwXpG" id="4Fmodk0ZzSx" role="2OqNvi">
                        <ref role="2Oxat5" node="4Fmodk0ZiBB" resolve="image" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2AHcQZ" id="4Fmodk0XEi1" role="2AJF6D">
                <ref role="2AI5Lk" to="wyt6:~Override" resolve="Override" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="4Fmodk0Zjdk" role="jymVt" />
    <node concept="3clFbW" id="4Fmodk0ZjOk" role="jymVt">
      <node concept="3cqZAl" id="4Fmodk0ZjOl" role="3clF45" />
      <node concept="3Tm1VV" id="4Fmodk0ZjOm" role="1B3o_S" />
      <node concept="3clFbS" id="4Fmodk0ZjOo" role="3clF47">
        <node concept="3clFbF" id="4Fmodk0ZjOs" role="3cqZAp">
          <node concept="37vLTI" id="4Fmodk0ZjOu" role="3clFbG">
            <node concept="2OqwBi" id="4Fmodk0ZjOy" role="37vLTJ">
              <node concept="Xjq3P" id="4Fmodk0ZjOz" role="2Oq$k0" />
              <node concept="2OwXpG" id="4Fmodk0ZjO$" role="2OqNvi">
                <ref role="2Oxat5" node="4Fmodk0ZiBB" resolve="image" />
              </node>
            </node>
            <node concept="37vLTw" id="4Fmodk0ZjO_" role="37vLTx">
              <ref role="3cqZAo" node="4Fmodk0ZjOr" resolve="image" />
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="4Fmodk0ZjOr" role="3clF46">
        <property role="TrG5h" value="image" />
        <node concept="3uibUv" id="4Fmodk0ZjOq" role="1tU5fm">
          <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="4Fmodk0Zm5p" role="jymVt" />
    <node concept="2YIFZL" id="2zOT$_1sE6g" role="jymVt">
      <property role="TrG5h" value="main" />
      <node concept="37vLTG" id="2zOT$_1sE6h" role="3clF46">
        <property role="TrG5h" value="args" />
        <node concept="10Q1$e" id="2zOT$_1sE6i" role="1tU5fm">
          <node concept="17QB3L" id="2zOT$_1sE6j" role="10Q1$1" />
        </node>
      </node>
      <node concept="3cqZAl" id="2zOT$_1sE6k" role="3clF45" />
      <node concept="3Tm1VV" id="2zOT$_1sE6l" role="1B3o_S" />
      <node concept="3clFbS" id="2zOT$_1sE6m" role="3clF47">
        <node concept="3cpWs8" id="4q8PBg27ob5" role="3cqZAp">
          <node concept="3cpWsn" id="4q8PBg27ob6" role="3cpWs9">
            <property role="TrG5h" value="image" />
            <node concept="3uibUv" id="4q8PBg27s8v" role="1tU5fm">
              <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
              <node concept="1W57fq" id="3v9$RrA1Z7d" role="lGtFl">
                <node concept="3IZrLx" id="3v9$RrA1Z7e" role="3IZSJc">
                  <node concept="3clFbS" id="3v9$RrA1Z7f" role="2VODD2">
                    <node concept="3cpWs8" id="daz9VSKXIn" role="3cqZAp">
                      <node concept="3cpWsn" id="daz9VSKXIo" role="3cpWs9">
                        <property role="TrG5h" value="value" />
                        <node concept="3Tqbb2" id="daz9VSKX$L" role="1tU5fm">
                          <ref role="ehGHo" to="i5hu:7mguUt1ZuOZ" resolve="IExpression" />
                        </node>
                        <node concept="2OqwBi" id="daz9VSKXIp" role="33vP2m">
                          <node concept="1PxgMI" id="daz9VSKXIq" role="2Oq$k0">
                            <node concept="chp4Y" id="daz9VSKXIr" role="3oSUPX">
                              <ref role="cht4Q" to="i5hu:24qcwCbfqWD" resolve="Declaration" />
                            </node>
                            <node concept="2OqwBi" id="daz9VSKXIs" role="1m5AlR">
                              <node concept="30H73N" id="daz9VSKXIt" role="2Oq$k0" />
                              <node concept="1mfA1w" id="daz9VSKXIu" role="2OqNvi" />
                            </node>
                          </node>
                          <node concept="3TrEf2" id="daz9VSKXIv" role="2OqNvi">
                            <ref role="3Tt5mk" to="i5hu:4q8PBg22G4o" resolve="value" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="3clFbF" id="3v9$RrA22pY" role="3cqZAp">
                      <node concept="22lmx$" id="daz9VSKYwR" role="3clFbG">
                        <node concept="1Wc70l" id="daz9VSL636" role="3uHU7w">
                          <node concept="2OqwBi" id="daz9VSLkvR" role="3uHU7w">
                            <node concept="2OqwBi" id="daz9VSLi4_" role="2Oq$k0">
                              <node concept="2OqwBi" id="daz9VSLdFk" role="2Oq$k0">
                                <node concept="2OqwBi" id="daz9VSLaCC" role="2Oq$k0">
                                  <node concept="1PxgMI" id="daz9VSL9ns" role="2Oq$k0">
                                    <node concept="chp4Y" id="7mguUt1Y1vs" role="3oSUPX">
                                      <ref role="cht4Q" to="i5hu:7mguUt1XDmB" resolve="Reference" />
                                    </node>
                                    <node concept="37vLTw" id="daz9VSL7Pz" role="1m5AlR">
                                      <ref role="3cqZAo" node="daz9VSKXIo" resolve="value" />
                                    </node>
                                  </node>
                                  <node concept="3TrEf2" id="7mguUt1Y2lO" role="2OqNvi">
                                    <ref role="3Tt5mk" to="i5hu:7mguUt1XDo5" resolve="target" />
                                  </node>
                                </node>
                                <node concept="3TrEf2" id="daz9VSLejf" role="2OqNvi">
                                  <ref role="3Tt5mk" to="i5hu:daz9VSLceS" resolve="type" />
                                </node>
                              </node>
                              <node concept="2yIwOk" id="daz9VSLjdC" role="2OqNvi" />
                            </node>
                            <node concept="3O6GUB" id="daz9VSLlkn" role="2OqNvi">
                              <node concept="chp4Y" id="daz9VSLmgY" role="3QVz_e">
                                <ref role="cht4Q" to="i5hu:3v9$RrAae5I" resolve="ImageType" />
                              </node>
                            </node>
                          </node>
                          <node concept="2OqwBi" id="daz9VSL3Ii" role="3uHU7B">
                            <node concept="2OqwBi" id="daz9VSL2vQ" role="2Oq$k0">
                              <node concept="37vLTw" id="daz9VSL1mU" role="2Oq$k0">
                                <ref role="3cqZAo" node="daz9VSKXIo" resolve="value" />
                              </node>
                              <node concept="2yIwOk" id="daz9VSL2XW" role="2OqNvi" />
                            </node>
                            <node concept="2Zo12i" id="daz9VSL4C9" role="2OqNvi">
                              <node concept="chp4Y" id="7mguUt1Y0zA" role="2Zo12j">
                                <ref role="cht4Q" to="i5hu:7mguUt1XDmB" resolve="Reference" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="2OqwBi" id="3v9$RrA2EUg" role="3uHU7B">
                          <node concept="2OqwBi" id="3v9$RrA22q0" role="2Oq$k0">
                            <node concept="37vLTw" id="daz9VSKXIw" role="2Oq$k0">
                              <ref role="3cqZAo" node="daz9VSKXIo" resolve="value" />
                            </node>
                            <node concept="2yIwOk" id="3v9$RrA2E3m" role="2OqNvi" />
                          </node>
                          <node concept="2Zo12i" id="3v9$RrA2Ft9" role="2OqNvi">
                            <node concept="chp4Y" id="3v9$RrA2GhG" role="2Zo12j">
                              <ref role="cht4Q" to="i5hu:24qcwCbhIhF" resolve="Image" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="gft3U" id="3v9$RrA24pP" role="UU_$l">
                  <node concept="3uibUv" id="3v9$RrA24RR" role="gfFT$">
                    <ref role="3uigEE" to="ouht:~Function1" resolve="Function1" />
                    <node concept="3uibUv" id="3v9$RrA24RS" role="11_B2D">
                      <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
                    </node>
                    <node concept="3uibUv" id="3v9$RrA24RT" role="11_B2D">
                      <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="17Uvod" id="4q8PBg27z6s" role="lGtFl">
              <property role="2qtEX9" value="name" />
              <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
              <node concept="3zFVjK" id="4q8PBg27z6t" role="3zH0cK">
                <node concept="3clFbS" id="4q8PBg27z6u" role="2VODD2">
                  <node concept="3clFbF" id="4q8PBg27$iH" role="3cqZAp">
                    <node concept="2OqwBi" id="4q8PBg2esXI" role="3clFbG">
                      <node concept="30H73N" id="4q8PBg2es00" role="2Oq$k0" />
                      <node concept="3TrcHB" id="4q8PBg2etnI" role="2OqNvi">
                        <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="1pdMLZ" id="4q8PBg2dCid" role="lGtFl">
              <ref role="2rW$FS" node="4q8PBg26OJb" resolve="LocalVar" />
              <node concept="3NFfHV" id="4q8PBg2efRF" role="31$UT">
                <node concept="3clFbS" id="4q8PBg2efRG" role="2VODD2">
                  <node concept="3clFbF" id="4q8PBg2ehdC" role="3cqZAp">
                    <node concept="2OqwBi" id="4q8PBg2ei3b" role="3clFbG">
                      <node concept="30H73N" id="4q8PBg2ehdB" role="2Oq$k0" />
                      <node concept="3TrEf2" id="4q8PBg2eijM" role="2OqNvi">
                        <ref role="3Tt5mk" to="i5hu:4q8PBg22YLQ" resolve="variable" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="10Nm6u" id="3v9$RrAhza7" role="33vP2m">
              <node concept="29HgVG" id="3v9$RrAhzWE" role="lGtFl">
                <node concept="3NFfHV" id="3v9$RrAh__K" role="3NFExx">
                  <node concept="3clFbS" id="3v9$RrAh__L" role="2VODD2">
                    <node concept="3clFbF" id="4q8PBg27ySJ" role="3cqZAp">
                      <node concept="2OqwBi" id="4q8PBg2evxj" role="3clFbG">
                        <node concept="1PxgMI" id="4q8PBg2evfV" role="2Oq$k0">
                          <node concept="chp4Y" id="4q8PBg2evld" role="3oSUPX">
                            <ref role="cht4Q" to="i5hu:24qcwCbfqWD" resolve="Declaration" />
                          </node>
                          <node concept="2OqwBi" id="4q8PBg27ySE" role="1m5AlR">
                            <node concept="30H73N" id="4q8PBg27ySI" role="2Oq$k0" />
                            <node concept="1mfA1w" id="4q8PBg2euQW" role="2OqNvi" />
                          </node>
                        </node>
                        <node concept="3TrEf2" id="4q8PBg2evG2" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:4q8PBg22G4o" resolve="value" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="1WS0z7" id="4q8PBg27yez" role="lGtFl">
            <node concept="3JmXsc" id="4q8PBg27yeA" role="3Jn$fo">
              <node concept="3clFbS" id="4q8PBg27yeB" role="2VODD2">
                <node concept="3clFbF" id="4q8PBg27yeH" role="3cqZAp">
                  <node concept="2OqwBi" id="4q8PBg27yeC" role="3clFbG">
                    <node concept="3Tsc0h" id="4q8PBg27yeF" role="2OqNvi">
                      <ref role="3TtcxE" to="i5hu:24qcwCbgR1Y" resolve="vars" />
                    </node>
                    <node concept="30H73N" id="4q8PBg27yeG" role="2Oq$k0" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4Fmodk0WD2O" role="3cqZAp">
          <node concept="3cpWsn" id="4Fmodk0WD2P" role="3cpWs9">
            <property role="TrG5h" value="mainImage" />
            <node concept="3uibUv" id="4Fmodk0WD2Q" role="1tU5fm">
              <ref role="3uigEE" to="6i10:~Image" resolve="Image" />
            </node>
            <node concept="2ShNRf" id="3v9$RrAeay1" role="33vP2m">
              <node concept="1pGfFk" id="3v9$RrAeay2" role="2ShVmc">
                <ref role="37wK5l" to="6i10:~Star.&lt;init&gt;(double,java.awt.Color,boolean)" resolve="Star" />
                <node concept="3b6qkQ" id="3v9$RrAeay3" role="37wK5m">
                  <property role="$nhwW" value="10.0" />
                </node>
                <node concept="10M0yZ" id="3v9$RrAeay4" role="37wK5m">
                  <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
                  <ref role="3cqZAo" to="z60i:~Color.WHITE" resolve="WHITE" />
                </node>
                <node concept="3clFbT" id="3v9$RrAeay5" role="37wK5m">
                  <property role="3clFbU" value="true" />
                </node>
              </node>
              <node concept="29HgVG" id="3v9$RrAeay6" role="lGtFl">
                <node concept="3NFfHV" id="3v9$RrAeay7" role="3NFExx">
                  <node concept="3clFbS" id="3v9$RrAeay8" role="2VODD2">
                    <node concept="3clFbF" id="3v9$RrAeay9" role="3cqZAp">
                      <node concept="2OqwBi" id="3v9$RrAg$ZX" role="3clFbG">
                        <node concept="30H73N" id="3v9$RrAg$iB" role="2Oq$k0" />
                        <node concept="3TrEf2" id="3v9$RrAg_cy" role="2OqNvi">
                          <ref role="3Tt5mk" to="i5hu:2zOT$_1s4h6" resolve="image" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="4Fmodk0WGrt" role="3cqZAp">
          <node concept="2OqwBi" id="4Fmodk0WH7e" role="3clFbG">
            <node concept="37vLTw" id="4Fmodk0WGrr" role="2Oq$k0">
              <ref role="3cqZAo" node="4Fmodk0WD2P" resolve="mainImage" />
            </node>
            <node concept="liA8E" id="4Fmodk0WHj1" role="2OqNvi">
              <ref role="37wK5l" to="6i10:~Image.drawInto(java.lang.String)" resolve="drawInto" />
              <node concept="3cpWs3" id="4Fmodk0WIEn" role="37wK5m">
                <node concept="Xl_RD" id="4Fmodk0WJgr" role="3uHU7w">
                  <property role="Xl_RC" value=".png" />
                </node>
                <node concept="Xl_RD" id="4Fmodk0WHRA" role="3uHU7B">
                  <property role="Xl_RC" value="file" />
                  <node concept="17Uvod" id="4Fmodk0WI1N" role="lGtFl">
                    <property role="2qtEX9" value="value" />
                    <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                    <node concept="3zFVjK" id="4Fmodk0WI1Q" role="3zH0cK">
                      <node concept="3clFbS" id="4Fmodk0WI1R" role="2VODD2">
                        <node concept="3clFbF" id="4Fmodk0WI1X" role="3cqZAp">
                          <node concept="2OqwBi" id="4Fmodk0WI1S" role="3clFbG">
                            <node concept="3TrcHB" id="4Fmodk0WI1V" role="2OqNvi">
                              <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                            </node>
                            <node concept="30H73N" id="4Fmodk0WI1W" role="2Oq$k0" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4Fmodk0ZDiL" role="3cqZAp">
          <node concept="3cpWsn" id="4Fmodk0ZDiM" role="3cpWs9">
            <property role="TrG5h" value="canvas" />
            <node concept="3uibUv" id="4Fmodk0ZDiN" role="1tU5fm">
              <ref role="3uigEE" node="2zOT$_1sDZx" resolve="map_Canvas" />
            </node>
            <node concept="2ShNRf" id="4Fmodk0ZFMt" role="33vP2m">
              <node concept="1pGfFk" id="4Fmodk0ZFfn" role="2ShVmc">
                <ref role="37wK5l" node="4Fmodk0ZjOk" resolve="map_Canvas" />
                <node concept="37vLTw" id="4Fmodk0ZH1j" role="37wK5m">
                  <ref role="3cqZAo" node="4Fmodk0WD2P" resolve="mainImage" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="4Fmodk0ZIkl" role="3cqZAp">
          <node concept="2OqwBi" id="4Fmodk0ZJEs" role="3clFbG">
            <node concept="37vLTw" id="4Fmodk0ZIkj" role="2Oq$k0">
              <ref role="3cqZAo" node="4Fmodk0ZDiM" resolve="canvas" />
            </node>
            <node concept="liA8E" id="4Fmodk0ZKsB" role="2OqNvi">
              <ref role="37wK5l" node="4Fmodk0YBhm" resolve="initialize" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="4Fmodk0Y_O5" role="jymVt" />
    <node concept="3clFb_" id="4Fmodk0YBhm" role="jymVt">
      <property role="TrG5h" value="initialize" />
      <node concept="3clFbS" id="4Fmodk0YBhp" role="3clF47">
        <node concept="3clFbF" id="4Fmodk0YCV2" role="3cqZAp">
          <node concept="1rXfSq" id="4Fmodk0YCV1" role="3clFbG">
            <ref role="37wK5l" to="z60i:~Frame.setTitle(java.lang.String)" resolve="setTitle" />
            <node concept="Xl_RD" id="4Fmodk0YDvG" role="37wK5m">
              <property role="Xl_RC" value="Title" />
              <node concept="17Uvod" id="4Fmodk0ZV8j" role="lGtFl">
                <property role="2qtEX9" value="value" />
                <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                <node concept="3zFVjK" id="4Fmodk0ZV8k" role="3zH0cK">
                  <node concept="3clFbS" id="4Fmodk0ZV8l" role="2VODD2">
                    <node concept="3clFbF" id="4Fmodk0ZWkS" role="3cqZAp">
                      <node concept="2OqwBi" id="4Fmodk0ZX6V" role="3clFbG">
                        <node concept="30H73N" id="4Fmodk0ZWkR" role="2Oq$k0" />
                        <node concept="3TrcHB" id="4Fmodk0ZXhR" role="2OqNvi">
                          <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="4Fmodk0YEHh" role="3cqZAp">
          <node concept="1rXfSq" id="4Fmodk0YEHf" role="3clFbG">
            <ref role="37wK5l" to="dxuu:~JFrame.setDefaultCloseOperation(int)" resolve="setDefaultCloseOperation" />
            <node concept="10M0yZ" id="4Fmodk0YIRb" role="37wK5m">
              <ref role="3cqZAo" to="dxuu:~WindowConstants.EXIT_ON_CLOSE" resolve="EXIT_ON_CLOSE" />
              <ref role="1PxDUh" to="dxuu:~JFrame" resolve="JFrame" />
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="4Fmodk0YK2c" role="3cqZAp">
          <node concept="1rXfSq" id="4Fmodk0YK2a" role="3clFbG">
            <ref role="37wK5l" to="z60i:~Container.add(java.awt.Component)" resolve="add" />
            <node concept="37vLTw" id="4Fmodk0YLbC" role="37wK5m">
              <ref role="3cqZAo" node="4Fmodk0XC2m" resolve="panel" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4Fmodk10zB$" role="3cqZAp">
          <node concept="3cpWsn" id="4Fmodk10zBB" role="3cpWs9">
            <property role="TrG5h" value="dimension" />
            <node concept="3uibUv" id="4Fmodk10zBC" role="1tU5fm">
              <ref role="3uigEE" to="z60i:~Dimension" resolve="Dimension" />
            </node>
            <node concept="2ShNRf" id="4Fmodk10zBD" role="33vP2m">
              <node concept="1pGfFk" id="4Fmodk10zBE" role="2ShVmc">
                <ref role="37wK5l" to="z60i:~Dimension.&lt;init&gt;(int,int)" resolve="Dimension" />
                <node concept="10QFUN" id="4Fmodk10zBF" role="37wK5m">
                  <node concept="2OqwBi" id="4Fmodk10zBG" role="10QFUP">
                    <node concept="2OqwBi" id="4Fmodk10zBH" role="2Oq$k0">
                      <node concept="37vLTw" id="4Fmodk10zBI" role="2Oq$k0">
                        <ref role="3cqZAo" node="4Fmodk0ZiBB" resolve="image" />
                      </node>
                      <node concept="liA8E" id="4Fmodk10zBJ" role="2OqNvi">
                        <ref role="37wK5l" to="6i10:~Image.getBbox$imagelang()" resolve="getBbox$imagelang" />
                      </node>
                    </node>
                    <node concept="liA8E" id="1tFQO7b_r5f" role="2OqNvi">
                      <ref role="37wK5l" to="fbzs:~RectangularShape.getMaxX()" resolve="getMaxX" />
                    </node>
                  </node>
                  <node concept="10Oyi0" id="4Fmodk10zBL" role="10QFUM" />
                </node>
                <node concept="10QFUN" id="4Fmodk10zBM" role="37wK5m">
                  <node concept="2OqwBi" id="4Fmodk10zBN" role="10QFUP">
                    <node concept="2OqwBi" id="4Fmodk10zBO" role="2Oq$k0">
                      <node concept="37vLTw" id="4Fmodk10zBP" role="2Oq$k0">
                        <ref role="3cqZAo" node="4Fmodk0ZiBB" resolve="image" />
                      </node>
                      <node concept="liA8E" id="4Fmodk10zBQ" role="2OqNvi">
                        <ref role="37wK5l" to="6i10:~Image.getBbox$imagelang()" resolve="getBbox$imagelang" />
                      </node>
                    </node>
                    <node concept="liA8E" id="1tFQO7b_rNC" role="2OqNvi">
                      <ref role="37wK5l" to="fbzs:~RectangularShape.getMaxY()" resolve="getMaxY" />
                    </node>
                  </node>
                  <node concept="10Oyi0" id="4Fmodk10zBS" role="10QFUM" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="4Fmodk10_cC" role="3cqZAp">
          <node concept="2OqwBi" id="4Fmodk10Ced" role="3clFbG">
            <node concept="37vLTw" id="4Fmodk10AI$" role="2Oq$k0">
              <ref role="3cqZAo" node="4Fmodk0XC2m" resolve="panel" />
            </node>
            <node concept="liA8E" id="4Fmodk10D5n" role="2OqNvi">
              <ref role="37wK5l" to="dxuu:~JComponent.setPreferredSize(java.awt.Dimension)" resolve="setPreferredSize" />
              <node concept="37vLTw" id="4Fmodk10Er$" role="37wK5m">
                <ref role="3cqZAo" node="4Fmodk10zBB" resolve="dimension" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="4Fmodk10Mow" role="3cqZAp">
          <node concept="2OqwBi" id="4Fmodk10NGL" role="3clFbG">
            <node concept="37vLTw" id="4Fmodk10Mou" role="2Oq$k0">
              <ref role="3cqZAo" node="4Fmodk0XC2m" resolve="panel" />
            </node>
            <node concept="liA8E" id="4Fmodk10OPG" role="2OqNvi">
              <ref role="37wK5l" to="dxuu:~JComponent.setBackground(java.awt.Color)" resolve="setBackground" />
              <node concept="10M0yZ" id="4Fmodk10Q7S" role="37wK5m">
                <ref role="3cqZAo" to="z60i:~Color.BLACK" resolve="BLACK" />
                <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="4Fmodk0Zcz4" role="3cqZAp">
          <node concept="1rXfSq" id="4Fmodk0Zcz2" role="3clFbG">
            <ref role="37wK5l" to="z60i:~Window.pack()" resolve="pack" />
          </node>
        </node>
        <node concept="3clFbF" id="4Fmodk0ZdRU" role="3cqZAp">
          <node concept="1rXfSq" id="4Fmodk0ZdRS" role="3clFbG">
            <ref role="37wK5l" to="z60i:~Window.setVisible(boolean)" resolve="setVisible" />
            <node concept="3clFbT" id="4Fmodk0Zf1Q" role="37wK5m">
              <property role="3clFbU" value="true" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm6S6" id="4Fmodk0YAzb" role="1B3o_S" />
      <node concept="3cqZAl" id="4Fmodk0YBfn" role="3clF45" />
    </node>
    <node concept="3Tm1VV" id="2zOT$_1sDZy" role="1B3o_S" />
    <node concept="n94m4" id="2zOT$_1sDZz" role="lGtFl">
      <ref role="n9lRv" to="i5hu:2zOT$_1s4h0" resolve="Canvas" />
    </node>
    <node concept="3uibUv" id="2zOT$_1sHx2" role="1zkMxy">
      <ref role="3uigEE" to="dxuu:~JFrame" resolve="JFrame" />
    </node>
    <node concept="17Uvod" id="2zOT$_1tbLI" role="lGtFl">
      <property role="2qtEX9" value="name" />
      <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
      <node concept="3zFVjK" id="2zOT$_1tbLJ" role="3zH0cK">
        <node concept="3clFbS" id="2zOT$_1tbLK" role="2VODD2">
          <node concept="3clFbF" id="2zOT$_1tdst" role="3cqZAp">
            <node concept="2OqwBi" id="2zOT$_1teb_" role="3clFbG">
              <node concept="30H73N" id="2zOT$_1tdss" role="2Oq$k0" />
              <node concept="3TrcHB" id="2zOT$_1teog" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

