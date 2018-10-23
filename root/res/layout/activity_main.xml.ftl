<?xml version="1.0" encoding="utf-8"?>
<${getMaterialComponentName('android.widget.FrameLayout', useAndroidX)}
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
<#if hasAppBar && appBarLayoutName??>
    app:layout_behavior="@string/appbar_scrolling_view_behavior"
    tools:showIn="@layout/${appBarLayoutName}"
</#if>
    tools:context="${packageName}.${activityClass}">
</${getMaterialComponentName('android.widget.FrameLayout', useAndroidX)}>