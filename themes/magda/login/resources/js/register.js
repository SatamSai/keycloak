console.log("hey")
var acceptTermsCheckbox = document.getElementById('accept-terms');
var submitButton = document.getElementById('registration-submit');

if (acceptTermsCheckbox && submitButton) {
    acceptTermsCheckbox.addEventListener('change', function () {
        submitButton.disabled = !this.checked;
    });
}