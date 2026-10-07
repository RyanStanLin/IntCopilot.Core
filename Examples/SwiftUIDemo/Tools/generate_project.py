import hashlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PROJECT = ROOT / 'IntCopilotDemo.xcodeproj'
PROJECT.mkdir(exist_ok=True)
def key(value): return hashlib.sha256(value.encode()).hexdigest()[:24].upper()
def quoted(value): return '"' + value.replace('\\','\\\\').replace('"','\\"') + '"'
objects = []
def object(name, contents):
    identity=key(name); objects.append(identity+' = { '+contents+' };'); return identity
sources=[]; references=[]
for file in sorted(list((ROOT/'App').rglob('*.swift'))+list((ROOT/'Support').rglob('*.swift'))):
    relative=str(file.relative_to(ROOT))
    ref=object('file:'+relative, 'isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = '+quoted(relative)+'; sourceTree = SOURCE_ROOT;')
    references.append(ref)
    sources.append(object('build:'+relative, 'isa = PBXBuildFile; fileRef = '+ref+';'))
resources=[]
for relative,filetype in [('App/Resources/FieldCatalog.json','text.json'),('App/Resources/Fixtures','folder')]:
    ref=object('file:'+relative, 'isa = PBXFileReference; lastKnownFileType = '+filetype+'; path = '+quoted(relative)+'; sourceTree = SOURCE_ROOT;');references.append(ref)
    resources.append(object('build:'+relative,'isa = PBXBuildFile; fileRef = '+ref+';'))
product=object('product','isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = IntCopilotDemo.app; sourceTree = BUILT_PRODUCTS_DIR;')
products=object('products','isa = PBXGroup; children = ('+product+',); name = Products; sourceTree = "<group>";')
main=object('group','isa = PBXGroup; children = ('+','.join(references+[products])+',); sourceTree = "<group>";')
package=object('package','isa = XCLocalSwiftPackageReference; relativePath = "../..";')
dependency=object('dependency','isa = XCSwiftPackageProductDependency; productName = "IntCopilot.Core";')
framework=object('framework','isa = PBXBuildFile; productRef = '+dependency+';')
sourcesPhase=object('sources','isa = PBXSourcesBuildPhase; buildActionMask = 2147483647; files = ('+','.join(sources)+',); runOnlyForDeploymentPostprocessing = 0;')
resourcesPhase=object('resources','isa = PBXResourcesBuildPhase; buildActionMask = 2147483647; files = ('+','.join(resources)+',); runOnlyForDeploymentPostprocessing = 0;')
frameworksPhase=object('frameworks','isa = PBXFrameworksBuildPhase; buildActionMask = 2147483647; files = ('+framework+',); runOnlyForDeploymentPostprocessing = 0;')
configs=[];projectConfigs=[]
for name in ['Debug','Release']:
    settings={'PRODUCT_BUNDLE_IDENTIFIER':'cn.intcopilot.demo','PRODUCT_NAME':'IntCopilotDemo','SWIFT_VERSION':'6.0','SWIFT_STRICT_CONCURRENCY':'complete','MACOSX_DEPLOYMENT_TARGET':'13.0','IPHONEOS_DEPLOYMENT_TARGET':'16.0','SUPPORTED_PLATFORMS':'macosx iphoneos iphonesimulator','SUPPORTS_MACCATALYST':'YES','TARGETED_DEVICE_FAMILY':'1,2','GENERATE_INFOPLIST_FILE':'YES','INFOPLIST_KEY_CFBundleDisplayName':'IntCopilot Demo','INFOPLIST_KEY_LSApplicationCategoryType':'public.app-category.developer-tools','INFOPLIST_KEY_UIApplicationSceneManifest_Generation':'YES','INFOPLIST_KEY_UILaunchScreen_Generation':'YES','CODE_SIGN_STYLE':'Automatic','ENABLE_APP_SANDBOX':'YES','ENABLE_OUTGOING_NETWORK_CONNECTIONS':'YES','SWIFT_OPTIMIZATION_LEVEL':'-Onone' if name=='Debug' else '-O','SWIFT_ACTIVE_COMPILATION_CONDITIONS':'DEBUG' if name=='Debug' else '', 'MARKETING_VERSION':'0.1.0','CURRENT_PROJECT_VERSION':'1'}
    contents=' '.join(k+' = '+quoted(v)+';' for k,v in settings.items())
    configs.append(object('config:'+name,'isa = XCBuildConfiguration; buildSettings = {'+contents+'}; name = '+name+';'))
    projectConfigs.append(object('projectConfig:'+name,'isa = XCBuildConfiguration; buildSettings = { CLANG_ENABLE_MODULES = YES; ONLY_ACTIVE_ARCH = '+('YES' if name=='Debug' else 'NO')+'; }; name = '+name+';'))
configList=object('configList','isa = XCConfigurationList; buildConfigurations = ('+','.join(configs)+',); defaultConfigurationIsVisible = 0; defaultConfigurationName = Release;')
projectList=object('projectList','isa = XCConfigurationList; buildConfigurations = ('+','.join(projectConfigs)+',); defaultConfigurationIsVisible = 0; defaultConfigurationName = Release;')
target=object('target','isa = PBXNativeTarget; buildConfigurationList = '+configList+'; buildPhases = ('+','.join([sourcesPhase,frameworksPhase,resourcesPhase])+',); buildRules = (); dependencies = (); name = IntCopilotDemo; packageProductDependencies = ('+dependency+',); productName = IntCopilotDemo; productReference = '+product+'; productType = "com.apple.product-type.application";')
project=object('project','isa = PBXProject; attributes = { BuildIndependentTargetsInParallel = YES; LastUpgradeCheck = 2700; }; buildConfigurationList = '+projectList+'; compatibilityVersion = "Xcode 14.0"; developmentRegion = en; knownRegions = (en, Base); mainGroup = '+main+'; productRefGroup = '+products+'; projectDirPath = ""; projectRoot = ""; packageReferences = ('+package+',); targets = ('+target+',);')
(PROJECT/'project.pbxproj').write_text('// !$*UTF8*$!\n{ archiveVersion = 1; classes = {}; objectVersion = 56; objects = {\n'+'\n'.join(objects)+'\n}; rootObject = '+project+'; }\n')
scheme=PROJECT/'xcshareddata/xcschemes';scheme.mkdir(parents=True,exist_ok=True)
(scheme/'IntCopilotDemo.xcscheme').write_text('''<?xml version="1.0" encoding="UTF-8"?>
<Scheme LastUpgradeVersion="2700" version="1.3">
<BuildAction parallelizeBuildables="YES" buildImplicitDependencies="YES"><BuildActionEntries><BuildActionEntry buildForTesting="YES" buildForRunning="YES" buildForProfiling="YES" buildForArchiving="YES" buildForAnalyzing="YES"><BuildableReference BuildableIdentifier="primary" BlueprintIdentifier="'''+target+'''" BuildableName="IntCopilotDemo.app" BlueprintName="IntCopilotDemo" ReferencedContainer="container:IntCopilotDemo.xcodeproj"/></BuildActionEntry></BuildActionEntries></BuildAction>
<LaunchAction buildConfiguration="Debug" selectedDebuggerIdentifier="Xcode.DebuggerFoundation.Debugger.LLDB" selectedLauncherIdentifier="Xcode.IDEFoundation.Launcher.LLDB" launchStyle="0" useCustomWorkingDirectory="NO" ignoresPersistentStateOnLaunch="NO" debugDocumentVersioning="YES" debugServiceExtension="internal" allowLocationSimulation="YES"><BuildableProductRunnable runnableDebuggingMode="0"><BuildableReference BuildableIdentifier="primary" BlueprintIdentifier="'''+target+'''" BuildableName="IntCopilotDemo.app" BlueprintName="IntCopilotDemo" ReferencedContainer="container:IntCopilotDemo.xcodeproj"/></BuildableProductRunnable></LaunchAction>
<ProfileAction buildConfiguration="Release" shouldUseLaunchSchemeArgsEnv="YES" savedToolIdentifier="" useCustomWorkingDirectory="NO" debugDocumentVersioning="YES"/><AnalyzeAction buildConfiguration="Debug"/><ArchiveAction buildConfiguration="Release" revealArchiveInOrganizer="YES"/>
</Scheme>
''')
print('Generated IntCopilotDemo.xcodeproj with '+str(len(sources))+' Swift sources')
