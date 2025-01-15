<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true page="reset"; section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcInputWrapperClass!}">
                    <#if auth?has_content && auth.showUsername()>
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}" placeholder="Email"/>
                    <#else>
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus placeholder="Email"/>
                    </#if>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} content-center">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonLargeClass!} filled" type="submit" value="Send Confirmation"/>
                </div>
            </div>
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!} content-center">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span class="form-link" ><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>
        </form>
    </#if>
</@layout.registrationLayout>
