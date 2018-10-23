package ${packageName};

import ${superClassFqcn};
<#if appCompat>
import android.support.v7.app.ActionBar;
import android.support.v7.widget.Toolbar;
</#if>
import android.os.Bundle;
import android.content.Intent;
import android.net.Uri;

<#if generateLayout>
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
</#if>

public class ${activityClass} extends ${superClass} {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
<#if generateLayout>
        setContentView(R.layout.${layoutName});
       <#include "../../../../common/jni_code_usage.java.ftl">
<#elseif includeCppSupport!false>
		
        // Example of a call to a native method
        android.util.Log.d("${activityClass}", stringFromJNI());
</#if>
		applyHoverDroidsBranding();
    }
<#include "../../../../common/jni_code_snippet.java.ftl">

	//None of this is essential for the example. It is only used to brand HoverDroids examples
    private void applyHoverDroidsBranding(){
		<#if appCompat>
        //Show app icon
        ActionBar actBar = getSupportActionBar();
        if(actBar != null) {
            actBar.setDisplayShowHomeEnabled(true);
            actBar.setIcon(R.mipmap.ic_ab_hoverdroids);
            actBar.setTitle(R.string.ab_title);
        }

        //Set actions to take when the AB is clicked
        Toolbar ab = findViewById(R.id.action_bar);
        if(ab != null){
            for (int i= 0; i < ab.getChildCount(); i++){
                setActionBarChildActions(ab.getChildAt(i));
            }
        }
		</#if>
    }
	<#if appCompat>
    private void setActionBarChildActions(View child){
        //Send users to HoverDroids.com when the title or icon are clicked
        if(child instanceof TextView || child instanceof ImageView) {
            child.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    String url = "http://www.HoverDroids.com";

                    Intent i = new Intent(Intent.ACTION_VIEW);
                    i.setData(Uri.parse(url));
                    startActivity(i);
                }
            });
        }
    }
	</#if>
}
