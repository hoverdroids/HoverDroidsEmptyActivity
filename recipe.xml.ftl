<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <#include "../common/recipe_manifest.xml.ftl" />
	<@kt.addAllKotlinDependencies />   
	
	<#if generateLayout>
		<#if appCompat && !(hasDependency('com.android.support:appcompat-v7'))>
			<dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+"/>
		</#if>
		
		<dependency mavenUrl="com.android.support.constraint:constraint-layout:+" />
		
		<instantiate from="root/res/layout/activity_main.xml.ftl"
					   to="${escapeXmlAttribute(resOut)}/layout/${simpleLayoutName}.xml" />
					   
		<#if (isNewProject!false) && !(excludeMenu!false)>
			<#include "../common/recipe_simple_menu.xml.ftl" />
		</#if>
	</#if>
	
    <instantiate from="root/src/app_package/HoverDroidsActivity.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.${ktOrJavaExt}" />
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.${ktOrJavaExt}" />

</recipe>
