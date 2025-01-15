<#import "template.ftl" as layout>
<@layout.registrationLayout page="register"; section>
    <#if section == "header">
        ${msg("registerTitle")}
    <#elseif section == "form">
        <#assign errorMessages = []>
        <#if message?has_content && message.summary?has_content>
            <#assign errorMessages = message.summary?split("<br>")>
        </#if>
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="${properties.kcInputClass!} input-sm" name="firstName" placeholder="${msg("firstName")}" value="${(register.formData.firstName!'')}" />
                    <br/>
                    <#list errorMessages as errorMessage>
                        <#if errorMessage?contains("first name")>
                            <span class="error">${errorMessage}</span>
                        </#if>
                    </#list>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" class="${properties.kcInputClass!} input-sm" name="lastName" placeholder="${msg("lastName")}" value="${(register.formData.lastName!'')}" />
                    <br/>
                    <#list errorMessages as errorMessage>
                        <#if errorMessage?contains("last name")>
                            <span class="error">${errorMessage}</span>
                        </#if>
                    </#list>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" class="${properties.kcInputClass!} input-sm" name="email" placeholder="${msg("email")}" value="${(register.formData.email!'')}" autocomplete="email" />
                    <br/>
                    <#list errorMessages as errorMessage>
                        <#if errorMessage?contains("email")>
                            <span class="error">${errorMessage}</span>
                        </#if>
                    </#list>
                </div>
            </div>

            <#if !realm.registrationEmailAsUsername>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" class="${properties.kcInputClass!} input-sm" name="username" placeholder="${msg("username")}" value="${(register.formData.username!'')}" autocomplete="username" />
                    <br/>
                    <#list errorMessages as errorMessage>
                        <#if errorMessage?contains("username")>
                            <span class="error">${errorMessage}</span>
                        </#if>
                    </#list>
                </div>
            </div>
            </#if>

            <#if passwordRequired??>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password" class="${properties.kcInputClass!} input-sm" name="password" placeholder="${msg("password")}" autocomplete="new-password"/>
                    <br/>
                    <#list errorMessages as errorMessage>
                        <#if errorMessage?contains("password") && !errorMessage?contains("confirm")>
                            <span class="error">${errorMessage}</span>
                        </#if>
                    </#list>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm" class="${properties.kcInputClass!} input-sm" name="password-confirm" placeholder="${msg("passwordConfirm")}"  />
                    <br/>
                    <#list errorMessages as errorMessage>
                        <#if errorMessage?contains("confirm password")>
                            <span class="error">${errorMessage}</span>
                        </#if>
                    </#list>
                </div>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcInputWrapperClass!} flex">
                    <input type="checkbox" id="accept-terms" name="acceptTerms" />
                    <label for="accept-terms" class="form-text form-terms">I have read and agreed to this site's <a target="_blank" href="https://digitaltruistpark-dev.surrealevents.com/privacy">Privacy Policy</a></label>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} content-center">
                    <input id="registration-submit" class="${properties.kcButtonClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}" disabled/>
                </div>
            </div>
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!} content-center">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span class="form-text">Already have an accout? <a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>
        </form>
        <script src="${url.resourcesPath}/js/register.js"></script>
    </#if>
</@layout.registrationLayout>
